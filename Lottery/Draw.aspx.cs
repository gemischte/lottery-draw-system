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
    public partial class Draw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDraw_Click(object sender, EventArgs e)
        {
            string connectionString =
           ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            Random rand = new Random();
            // 設定稀有度機率（加總為100）
            int rarityRoll = rand.Next(1, 101); // 1-100
            int selectedRarity = (rarityRoll <= 70) ? 1 : (rarityRoll <= 95 ? 2 : 3);
            // 使用 using 確保連線自動關閉
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // 抽卡：根據稀有度隨機抽一張卡
                string query = "SELECT TOP 1 * FROM Card WHERE Rarity = @rarity ORDER BY NEWID()";
            using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@rarity", selectedRarity);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            int cardId = (int)reader["Id"];
                            string cardName = reader["Name"].ToString();
                            string imagePath = reader["ImagePath"].ToString();
                            // 關閉讀取器再寫入資料
                            reader.Close();
                            // 模擬目前登入的 UserId（你可改為實際登入帳號）
                            string userId = Session["UserId"].ToString();
                            // 寫入抽卡紀錄
                            string insertQuery = "INSERT INTO GachaHistory (UserId, CardId,DrawTime) VALUES(@userId, @cardId, GETDATE())";
                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                            {
                                insertCmd.Parameters.AddWithValue("@userId", userId);
                                insertCmd.Parameters.AddWithValue("@cardId", cardId);
                                insertCmd.ExecuteNonQuery();
                            }
                            // 顯示卡片圖片與名稱
                            imgCard.ImageUrl = imagePath;
                            imgCard.Visible = true;
                            lblCardName.Text = "你抽到了：" + cardName;
                        }
                        else
                        {
                            lblCardName.Text = "抽卡失敗，請稍後再試。";
                            imgCard.Visible = false;
                        }
                    }
                }
                // 自動關閉 conn
            }
        }
    }
}