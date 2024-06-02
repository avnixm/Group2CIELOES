using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;


namespace g2cieloes.lessons
{
	public partial class lesson2 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["User"] == null)
            {
                Response.Redirect("../login.aspx");
            }

        }


        public static string SubmitResults(int score, string userId)
        {
            var response = new { success = false, message = "" };

            if (score < 0 || string.IsNullOrEmpty(userId))
            {
                response = new { success = false, message = "Invalid input data." };
                return new JavaScriptSerializer().Serialize(response);
            }

            int currentXp = GetUserXp(userId);
            if (currentXp == -1)
            {
                response = new { success = false, message = "Failed to retrieve current XP." };
                return new JavaScriptSerializer().Serialize(response);
            }

            bool success = UpdateXp(score, userId);
            if (success)
            {
                response = new { success = true, message = $"XP updated successfully! (Current XP: {currentXp + score})" };
            }
            else
            {
                response = new { success = false, message = "Failed to update XP" };
            }

            return new JavaScriptSerializer().Serialize(response);
        }

        private static bool UpdateXp(int score, string userId)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    MySqlCommand command = new MySqlCommand("UPDATE userinfo SET user_xp = user_xp + @score WHERE userID = @userId", connection);
                    command.Parameters.AddWithValue("@score", score);
                    command.Parameters.AddWithValue("@userId", userId);
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                LogError(ex.Message);
                return false;
            }
        }

        private static int GetUserXp(string userId)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    MySqlCommand command = new MySqlCommand("SELECT user_xp FROM userinfo WHERE userID = @userId", connection);
                    command.Parameters.AddWithValue("@userId", userId);
                    connection.Open();
                    object result = command.ExecuteScalar();
                    return result != null ? Convert.ToInt32(result) : -1;
                }
            }
            catch (Exception ex)
            {
                LogError(ex.Message);
                return -1;
            }
        }

        private static void LogError(string message)
        {
            System.Diagnostics.Debug.WriteLine($"Error: {message}");
        }

        protected void hiddenscore_ValueChanged(object sender, EventArgs e)
        {

        }


    }

}
