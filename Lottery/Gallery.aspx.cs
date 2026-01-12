using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lottery
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userId = Session["UserId"].ToString(); // 改為實際使用者帳號
                string connectionString =
               ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = @"
 SELECT c.Id, c.Name, c.Rarity, c.ImagePath,
 COUNT(g.Id) AS DrawCount
 FROM Card c
 LEFT JOIN GachaHistory g ON c.Id = g.CardId AND g.UserId
= @UserId
 GROUP BY c.Id, c.Name, c.Rarity, c.ImagePath
 ORDER BY c.Rarity DESC, c.Name";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    rptGallery.DataSource = dt;
                    rptGallery.DataBind();
                }
            }
        }
    }
}