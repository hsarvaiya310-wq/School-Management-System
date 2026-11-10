using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace schoolms
{
    public class CourseItem
    {
        public int Id { get; set; }
        public string CourseName { get; set; }
        public string Duration { get; set; }
        public string Faculty { get; set; }
        public List<string> Modules { get; set; }
    }

    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Db.IsAnyoneLoggedIn(Session))
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            List<CourseItem> list = new List<CourseItem>();
            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand(
                    "SELECT c.Id, c.CourseName, c.Duration, c.Faculty, m.ModuleCode " +
                    "FROM Courses c LEFT JOIN CourseModules m ON m.CourseId = c.Id " +
                    "ORDER BY c.Id, m.SortOrder", con))
                {
                    con.Open();
                    using (SqlDataReader r = cmd.ExecuteReader())
                    {
                        CourseItem current = null;
                        while (r.Read())
                        {
                            int id = r.GetInt32(0);
                            if (current == null || current.Id != id)
                            {
                                current = new CourseItem
                                {
                                    Id = id,
                                    CourseName = r.GetString(1),
                                    Duration = r.GetString(2),
                                    Faculty = r.GetString(3),
                                    Modules = new List<string>()
                                };
                                list.Add(current);
                            }
                            if (!r.IsDBNull(4)) current.Modules.Add(r.GetString(4));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                Db.Alert(this, "Could not load courses from the database.");
            }
            rptCourses.DataSource = list;
            rptCourses.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}
