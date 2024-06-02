using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace g2cieloes
{
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayUserXPAndHearts();
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                int xpCost = 5;
                int heartsToAdd = 1;

                if (user.UserXP >= xpCost)
                {
                    user.UserXP -= xpCost;
                    user.UserHearts += heartsToAdd;
                    UpdateUserInDatabase(user);
                    Session["User"] = user; // Update the session with the new user state
                    DisplayUserXPAndHearts(); // Refresh the displayed values
                }
                else
                {
                    // Display alert if not enough XP
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Not enough XP!');", true);
                }
            }
        }

        private void UpdateUserInDatabase(User user)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "UPDATE userinfo SET user_xp = @UserXP, user_hearts = @UserHearts WHERE userID = @UserId";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@UserXP", user.UserXP);
                command.Parameters.AddWithValue("@UserHearts", user.UserHearts);
                command.Parameters.AddWithValue("@UserId", user.UserId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

    }
}