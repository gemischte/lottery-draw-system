using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Lottery
{
    public partial class Collection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadCards();
        }
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs
       e)
        {
            LoadCards();
        }
        private void LoadCards()
        {
            string connectionString =
           ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            string sortBy = ddlSort.SelectedValue;
            string keyword = txtSearch.Text.Trim();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = $@"
 SELECT GH.DrawTime, C.Name, C.Rarity, C.ImagePath
 FROM GachaHistory GH
 JOIN Card C ON GH.CardId = C.Id
 WHERE GH.UserId = @UserId AND (@Keyword = '' OR C.Name LIKE
'%' + @Keyword + '%')
 ORDER BY {(sortBy == "Rarity" ? "C.Rarity DESC" :
               "GH.DrawTime DESC")}";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", Session["UserId"].ToString());
                cmd.Parameters.AddWithValue("@Keyword", keyword);
                SqlDataReader reader = cmd.ExecuteReader();
                rptCards.DataSource = reader;
                rptCards.DataBind();
            }
        }
        // 顯示稀有度文字顏色
        protected string GetRarityColor(object rarity)
        {
            switch (Convert.ToInt32(rarity))
            {
                case 1: return "gray"; // 普通
                case 2: return "blue"; // 稀有
                case 3: return "purple"; // 超稀有
                default: return "black";
            }
        }
        // 顯示稀有度邊框色
        protected string GetBorderColor(object rarity)
        {
            switch (Convert.ToInt32(rarity))
            {
                case 1: return "gray";
                case 2: return "blue";
                case 3: return "purple";
                default: return "black";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadCards();
        }

    }
}