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
    public partial class Ranking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString =
               ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = @"
 SELECT
 ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS Rank,
 g.UserId,
 COUNT(*) AS DrawCount
 FROM GachaHistory g
 GROUP BY g.UserId
 ORDER BY DrawCount DESC";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader reader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(reader);
                    gvRanking.DataSource = dt;
                    gvRanking.DataBind();
                }
            }
        }

    }
}