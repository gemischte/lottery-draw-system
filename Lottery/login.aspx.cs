using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
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
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Username FROM [User] WHERE Id = @Id AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Password", password); // 實務應加密比對
                conn.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    string username = result.ToString();
                    Session["UserId"] = id;
                    Session["Username"] = username;
                    Response.Redirect("Draw2.aspx");
                }
                else
                {
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('帳號或密碼錯誤');", true);
                    Msg.Text = "<script>" +
                        "Swal.fire({ icon: 'error',  " +
                        "title: 'Oops...',  " +
                        "text: 'Incorrect username or password!'}); " +
                        "</script >";
                }
            }

        }
    }
}