using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace g2cieloes
{
    public partial class Learn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayUserXPAndHearts();
            }
        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
            if (DecrementUserHearts())
            {
                Response.Redirect("lessons/lesson2.aspx");
            }
        }

        protected void Button2_Click(object sender, ImageClickEventArgs e)
        {
            if (DecrementUserHearts())
            {
                Response.Redirect("lessons/lesson3.aspx");
            }
        }

        private void DisplayUserXPAndHearts()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                userxplabel.Text = $"{user.UserXP}";
                userheartslabel.Text = $"{user.UserHearts}";
            }
        }

        private bool DecrementUserHearts()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                if (user.UserHearts > 0)
                {
                    user.UserHearts--;
                    UpdateUserHeartsInDatabase(user.UserId, user.UserHearts);
                    userheartslabel.Text = $"{user.UserHearts}";
                    return true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('You have no hearts left. Please buy on shop.');", true);
                    return false;
                }
            }
            return false;
        }

        private void UpdateUserHeartsInDatabase(int userID, int user_hearts)
        {
            string connectionString = "Server=localhost;user=root;database=g2cieloes;password=";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "UPDATE userinfo SET user_hearts = @hearts WHERE userID = @userId";
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@hearts", user_hearts);
                    cmd.Parameters.AddWithValue("@userId", userID);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
    
