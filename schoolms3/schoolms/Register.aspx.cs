using System;
using System.Data;
using System.Data.SqlClient;

namespace schoolms
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        void clen()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtpwd.Text = "";
            txtcompwd.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = txtnm.Text.Trim();
            string email = txteml.Text.Trim();
            string pwd = txtpwd.Text;

            if (name.Length == 0 || email.Length == 0 || pwd.Length == 0)
            {
                Db.Alert(this, "Please fill in all fields.");
                return;
            }
            if (email.IndexOf('@') < 1)
            {
                Db.Alert(this, "Please enter a valid email address.");
                return;
            }
            if (pwd.Length < 6)
            {
                Db.Alert(this, "Password must be at least 6 characters.");
                return;
            }
            if (pwd != txtcompwd.Text)
            {
                Db.Alert(this, "Passwords do not match.");
                return;
            }

            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Users (Name, Email, Password) VALUES (@Name, @Email, @Password)", con))
                {
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = name;
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 200).Value = PasswordHasher.Hash(pwd);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                Db.Alert(this, Db.IsDuplicateKey(ex) ? "This email is already registered." : "Database error. Registration failed.");
                return;
            }

            clen();
            Response.Redirect("Login.aspx");
        }
    }
}
