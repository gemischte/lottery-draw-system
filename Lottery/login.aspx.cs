using BCrypt.Net;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lottery
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            string id = txtEmail.Text.Trim(); // Id = 登入帳號
            string password = txtPassword.Text.Trim();
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            string username = null;
            string dbHash = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Username ,[Password] FROM  [user] WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        username = reader["Username"].ToString();
                        dbHash = reader["Password"].ToString();
                    }
                }
            }

            if (dbHash != null && BCrypt.Net.BCrypt.Verify(password, dbHash))
            {
                Session["UserId"] = id;
                Session["Username"] = username;
                Response.Redirect("Draw2.aspx");
            }
            else
            {
                Msg.Text = "<script>" +
                    "Swal.fire({ icon: 'error', " +
                    "title: 'Oops...', " +
                    "text: 'Incorrect username or password!' });" +
                    "</script>";

            }
        }
    }
}