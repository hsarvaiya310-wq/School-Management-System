using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;

namespace schoolms
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Db.IsAnyoneLoggedIn(Session))
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            int classNo;
            if (!int.TryParse(ddlClass.SelectedItem.Value, out classNo) || classNo <= 0)
            {
                lblTimetable.Text = "Please select a class to view timetable.";
                return;
            }

            StringBuilder sb = new StringBuilder();
            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT TimeSlot, Subject FROM ClassTimetable WHERE ClassNo = @ClassNo ORDER BY SortOrder", con))
                {
                    cmd.Parameters.Add("@ClassNo", SqlDbType.Int).Value = classNo;
                    con.Open();
                    using (SqlDataReader r = cmd.ExecuteReader())
                    {
                        sb.Append("<b>Class " + classNo + " Timetable</b><br/>");
                        bool any = false;
                        while (r.Read())
                        {
                            any = true;
                            sb.Append(HttpUtility.HtmlEncode(r.GetString(0)) + " &rarr; " + HttpUtility.HtmlEncode(r.GetString(1)) + "<br/>");
                        }
                        if (!any)
                        {
                            sb.Append("No timetable has been added for this class yet.");
                        }
                    }
                }
            }
            catch (SqlException)
            {
                sb.Clear();
                sb.Append("Could not load the timetable from the database.");
            }

            lblTimetable.Text = sb.ToString();
        }
    }
}
