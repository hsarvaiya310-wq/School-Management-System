using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;

namespace schoolms
{
    public partial class Classes : System.Web.UI.Page
    {
        private const string SchoolName = "Bright Future Academy";

        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["teacher"] as string;
            if (email == null)
            {
                Response.Redirect("Teacher_login.aspx");
                return;
            }
            LoadSchedule(email);
        }

        private void LoadSchedule(string email)
        {
            DateTime now = DateTime.Now;
            int startYear = now.Month >= 6 ? now.Year : now.Year - 1;
            lblAcademicYear.Text = startYear + "-" + (startYear + 1);
            lblSchoolName.Text = HttpUtility.HtmlEncode(SchoolName);
            lblLastUpdated.Text = now.ToString("MMMM d, yyyy");
            lblTeacherName.Text = HttpUtility.HtmlEncode(email);
            lblDepartment.Text = "-";

            DataTable periods = new DataTable();
            Dictionary<int, string[]> cells = new Dictionary<int, string[]>(); // key = day*100 + sortOrder

            try
            {
                using (SqlConnection con = Db.CreateConnection())
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("SELECT Name, Department FROM Teacher WHERE Email = @Email", con))
                    {
                        cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
                        using (SqlDataReader r = cmd.ExecuteReader())
                        {
                            if (r.Read())
                            {
                                lblTeacherName.Text = HttpUtility.HtmlEncode(r.GetString(0));
                                if (!r.IsDBNull(1) && r.GetString(1).Length > 0)
                                    lblDepartment.Text = HttpUtility.HtmlEncode(r.GetString(1));
                            }
                        }
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(
                        "SELECT SortOrder, TimeSlot, PeriodLabel, IsBreak FROM SchedulePeriods ORDER BY SortOrder", con))
                    {
                        da.Fill(periods);
                    }

                    using (SqlCommand cmd = new SqlCommand(
                        "SELECT DayNo, SortOrder, Subject, Room, Grade, UpdatedAt FROM TeacherSchedule WHERE TeacherEmail = @Email", con))
                    {
                        cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
                        DateTime? last = null;
                        using (SqlDataReader r = cmd.ExecuteReader())
                        {
                            while (r.Read())
                            {
                                cells[r.GetByte(0) * 100 + r.GetInt32(1)] = new string[]
                                {
                                    r.GetString(2),
                                    r.IsDBNull(3) ? "" : r.GetString(3),
                                    r.IsDBNull(4) ? "" : r.GetString(4)
                                };
                                DateTime u = r.GetDateTime(5);
                                if (last == null || u > last.Value) last = u;
                            }
                        }
                        if (last != null) lblLastUpdated.Text = last.Value.ToLocalTime().ToString("MMMM d, yyyy");
                    }
                }
            }
            catch (SqlException)
            {
                Db.Alert(this, "Could not load the schedule from the database.");
                return;
            }

            StringBuilder sb = new StringBuilder();
            foreach (DataRow p in periods.Rows)
            {
                int order = Convert.ToInt32(p["SortOrder"]);
                string label = HttpUtility.HtmlEncode(Convert.ToString(p["PeriodLabel"]));
                bool isBreak = Convert.ToBoolean(p["IsBreak"]);

                sb.Append("<tr><td class=\"time-header\">" + HttpUtility.HtmlEncode(Convert.ToString(p["TimeSlot"])) + "</td>");
                for (int day = 1; day <= 5; day++)
                {
                    string[] cell;
                    if (isBreak)
                    {
                        sb.Append("<td class=\"break\">" + label + "</td>");
                    }
                    else if (!cells.TryGetValue(day * 100 + order, out cell))
                    {
                        sb.Append("<td class=\"free-period\"><div class=\"period\">Period " + label + "</div>Free</td>");
                    }
                    else
                    {
                        sb.Append("<td><div class=\"period\">Period " + label + "</div>"
                            + "<div class=\"subject\">" + HttpUtility.HtmlEncode(cell[0]) + "</div>"
                            + "<div class=\"room\">" + HttpUtility.HtmlEncode(cell[1]) + "</div>"
                            + "<div class=\"grade\">" + HttpUtility.HtmlEncode(cell[2]) + "</div></td>");
                    }
                }
                sb.Append("</tr>");
            }
            scheduleBody.InnerHtml = sb.ToString();
        }
    }
}
