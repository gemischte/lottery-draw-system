using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using BCrypt.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lottery
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }



        protected void Button1_Click1(object sender, EventArgs e)
        {
            //Label1.Text = Account.Text;
            //Label1.Text += Username.Text;
            //Label1.Text += Password.Text;

            string connectionString =
ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            if (string.IsNullOrEmpty(userid.Text) || string.IsNullOrEmpty(Password.Text))
            {
                lblMessage.Text = "請填寫所有欄位！";
                return;
            }
            try
            {
                // 使用 SQL 連接資料庫並插入資料
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open(); // 開啟連線
                                       // 插入資料的 SQL 命令
                    var command = new SqlCommand("INSERT INTO [User] (Id, Username, [Password],RegisterDate) VALUES(@Id, @Username, @Password, GETDATE())", connection);

                    command.Parameters.AddWithValue("@Id", userid.Text);
                    command.Parameters.AddWithValue("@Username", Username.Text);
                    string hash_Pwd = BCrypt.Net.BCrypt.HashPassword(Password.Text);
                    command.Parameters.AddWithValue("@Password", hash_Pwd);
                    command.ExecuteNonQuery(); // 執行插入資料命令
                }
                // 顯示寫入完成訊息
                lblMessage.Text = "寫入完成！";
                lblMessage.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                // 處理錯誤
                lblMessage.Text = "寫入失敗：" + ex.Message;
                lblMessage.ForeColor = Color.Red;
            }
        }
    }
}