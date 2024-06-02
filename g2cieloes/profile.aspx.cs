using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace g2cieloes
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayUserRank();
                DisplayUserXPAndHearts();
                DisplayNameAndJoinDate();

                User currentUser = Session["User"] as User;

                if (currentUser != null && !string.IsNullOrEmpty(currentUser.FirstName))
                {
                    profileLink.InnerHtml = "<i class=\"fas fa-user\"></i> " + currentUser.FirstName;
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void logoutbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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

        private void DisplayNameAndJoinDate()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                string fullName = $"{user.FirstName} {user.LastName}";
                firstnamelabel.Text = fullName;
                datejoinedlabel.Text = $"Date Joined: {user.RegistrationDate:MMM dd, yyyy}";
                p_username.Text = user.Email;
                p_name.Text = fullName;
            }
        }

        protected void SaveChanges(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                string newEmail = p_username.Text;
                string newName = p_name.Text;

                if (newEmail != user.Email)
                {
                    // Send OTP to the current email
                    SendOTP(user.Email);
                    // Save new email to the session for verification later
                    Session["NewEmail"] = newEmail;
                }
                else
                {
                    // Update name in the database
                    UpdateUserName(user.UserId, newName);
                    user.FirstName = newName.Split(' ')[0];
                    user.LastName = newName.Split(' ').Length > 1 ? newName.Split(' ')[1] : "";
                }

                // Update the session user
                Session["User"] = user;
            }
        }

        protected void p_name_TextChanged(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                string newName = p_name.Text;

                if (newName != $"{user.FirstName} {user.LastName}")
                {
                    UpdateUserName(user.UserId, newName);
                    user.FirstName = newName.Split(' ')[0];
                    user.LastName = newName.Split(' ').Length > 1 ? newName.Split(' ')[1] : "";
                    Session["User"] = user;
                }
            }
        }

        protected void p_username_TextChanged(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                string newEmail = p_username.Text;

                if (newEmail != user.Email)
                {
                    // Send OTP to the current email
                    SendOTP(user.Email);
                    // Save new email to the session for verification later
                    Session["NewEmail"] = newEmail;
                }
            }
        }

        private void SendOTP(string email)
        {
            // Implement OTP sending logic here
        }

        private void UpdateUserName(int userId, string newName)
        {
            // Implement the database update logic here
            // Example:
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                var command = new MySqlCommand("UPDATE userinfo SET user_fname = @FirstName, user_lname = @LastName WHERE UserId = @UserId", conn);
                command.Parameters.AddWithValue("@FirstName", newName.Split(' ')[0]);
                command.Parameters.AddWithValue("@LastName", newName.Split(' ').Length > 1 ? newName.Split(' ')[1] : "");
                command.Parameters.AddWithValue("@UserId", userId);
                conn.Open();
                command.ExecuteNonQuery();
            }
        }

        private void UpdateUserEmail(int userId, string newEmail)
        {
            // Implement the database update logic here
            // Example:
            // using (var connection = new SqlConnection("your_connection_string"))
            // {
            //     var command = new SqlCommand("UPDATE Users SET Email = @Email WHERE UserId = @UserId", connection);
            //     command.Parameters.AddWithValue("@Email", newEmail);
            //     command.Parameters.AddWithValue("@UserId", userId);
            //     connection.Open();
            //     command.ExecuteNonQuery();
            // }
        }

        protected void VerifyOTP(string otp)
        {
            string sessionOtp = Session["OTP"] as string;
            if (otp == sessionOtp)
            {
                User user = (User)Session["User"];
                string newEmail = Session["NewEmail"] as string;
                UpdateUserEmail(user.UserId, newEmail);
                Session["NewEmail"] = null;
                Session["OTP"] = null;
            }
            else
            {
                // Handle invalid OTP case
            }
        }

        private void DisplayUserRank()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                int userId = user.UserId;  // Assuming User class has a property UserID

                // Fetch and display the user rank
                int userRank = GetUserRank(userId);
                ctr.Text = "Your Rank: " + userRank;
            }
        }


        private int GetUserRank(int userId)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            int rank = 0;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                // Query to get the user rank based on user_xp
                string query = @"
                SELECT RANK() OVER (ORDER BY user_xp DESC) AS UserRank, userID
                FROM userinfo";

                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        int currentUserId = reader.GetInt32(reader.GetOrdinal("userID"));
                        if (currentUserId == userId)
                        {
                            rank = reader.GetInt32(reader.GetOrdinal("UserRank"));
                            break;
                        }
                    }
                }
            }

            return rank;
        }
    }
}
