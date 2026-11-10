using System;
using System.Data;
using System.Data.SqlClient;

namespace schoolms
{
    public partial class Teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        void clen()
        {
            txtEml.Text = "";
            txtName.Text = "";
            txtAge.Text = "";
            txtCity.Text = "";
            txtpwd.Text = "";
        }

        private void BindGrid()
        {
            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT Email, Name, Age, City FROM Teacher ORDER BY Name", con))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
            }
            catch (SqlException)
            {
                Db.Alert(this, "Could not load teachers from the database.");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = txtEml.Text.Trim();
            string name = txtName.Text.Trim();
            string city = txtCity.Text.Trim();
            string pwd = txtpwd.Text;
            int age;

            if (email.Length == 0 || name.Length == 0 || pwd.Length == 0 || !int.TryParse(txtAge.Text.Trim(), out age))
            {
                Db.Alert(this, "Email, Name, a valid Age and Password are required.");
                return;
            }

            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Teacher (Email, Name, Age, City, Password) VALUES (@Email, @Name, @Age, @City, @Password)", con))
                {
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = name;
                    cmd.Parameters.Add("@Age", SqlDbType.Int).Value = age;
                    cmd.Parameters.Add("@City", SqlDbType.NVarChar, 100).Value = city;
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 200).Value = PasswordHasher.Hash(pwd);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                Db.Alert(this, Db.IsDuplicateKey(ex) ? "A teacher with this email already exists." : "Database error. Insert failed.");
                return;
            }
            clen();
            BindGrid();
        }

        protected void BunUpdate_Click(object sender, EventArgs e)
        {
            string email = txtEml.Text.Trim();
            string name = txtName.Text.Trim();
            string city = txtCity.Text.Trim();
            string pwd = txtpwd.Text;
            int age;

            if (email.Length == 0 || name.Length == 0 || !int.TryParse(txtAge.Text.Trim(), out age))
            {
                Db.Alert(this, "Email, Name and a valid Age are required. Leave Password blank to keep it unchanged.");
                return;
            }

            string sql = "UPDATE Teacher SET Name = @Name, Age = @Age, City = @City"
                       + (pwd.Length > 0 ? ", Password = @Password" : "")
                       + " WHERE Email = @Email";
            int rows;
            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100).Value = name;
                    cmd.Parameters.Add("@Age", SqlDbType.Int).Value = age;
                    cmd.Parameters.Add("@City", SqlDbType.NVarChar, 100).Value = city;
                    if (pwd.Length > 0)
                        cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 200).Value = PasswordHasher.Hash(pwd);
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
                    con.Open();
                    rows = cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                Db.Alert(this, "Database error. Update failed.");
                return;
            }
            if (rows == 0)
            {
                Db.Alert(this, "No teacher found with that email.");
                return;
            }
            clen();
            BindGrid();
        }

        protected void BunDelet_Click(object sender, EventArgs e)
        {
            string email = txtEml.Text.Trim();
            if (email.Length == 0)
            {
                Db.Alert(this, "Enter the teacher email to delete.");
                return;
            }
            int rows;
            try
            {
                using (SqlConnection con = Db.CreateConnection())
                using (SqlCommand cmd = new SqlCommand("DELETE FROM Teacher WHERE Email = @Email", con))
                {
                    cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150).Value = email;
                    con.Open();
                    rows = cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                Db.Alert(this, "Database error. Delete failed.");
                return;
            }
            if (rows == 0)
            {
                Db.Alert(this, "No teacher found with that email.");
                return;
            }
            clen();
            BindGrid();
        }

        protected void BunReset_Click(object sender, EventArgs e)
        {
            clen();
            BindGrid();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}
