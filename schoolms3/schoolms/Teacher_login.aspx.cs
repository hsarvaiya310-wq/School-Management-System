using System;
using System.Data;
using System.Data.SqlClient;

namespace schoolms
{
    public partial class Teacher_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Admin_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string email = txteml.Text.Trim();
            string pwd = txtpwd.Text;

            if (email.Length == 0 || pwd.Length == 0)
            {
                Db.Alert(this, "Please enter your email and password.");
                return;
            }

            string stored = null;
            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand("SELECT Password FROM Teacher WHERE Email = @Email", con))
                {
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
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
                Session["teacher"] = email;
                Response.Redirect("Teacher_Dashboard.aspx");
            }
            else
            {
                Db.Alert(this, "Invalid email or password.");
            }
        }

        protected void Student_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student_Login.aspx");
        }
    }
}
