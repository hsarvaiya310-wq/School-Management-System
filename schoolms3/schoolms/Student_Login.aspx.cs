using System;
using System.Data;
using System.Data.SqlClient;

namespace schoolms
{
    public partial class Student_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string enrl = txtenr.Text.Trim();
            string pwd = txtpwd.Text;

            if (enrl.Length == 0 || pwd.Length == 0)
            {
                Db.Alert(this, "Please enter your enrolment number and password.");
                return;
            }

            string stored = null;
            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand("SELECT Password FROM Stud WHERE EnrlNo = @EnrlNo", con))
                {
                    cmd.Parameters.Add("@EnrlNo", SqlDbType.NVarChar, 30).Value = enrl;
                    con.Open();
                    object r = cmd.ExecuteScalar();
                    if (r != null && r != DBNull.Value) stored = (string)r;
                }
            }
            catch (SqlException)
            {
                Db.Alert(this, "Database error. Please check the connection and try again.");
                return;
            }

            if (PasswordHasher.Verify(pwd, stored))
            {
                Session.Clear();
                Session["Stud"] = enrl;
                Response.Redirect("student_Dashboard.aspx");
            }
            else
            {
                Db.Alert(this, "Invalid enrolment number or password.");
            }
        }

        protected void Teacher_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Teacher_login.aspx");
        }

        protected void Admin_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}
