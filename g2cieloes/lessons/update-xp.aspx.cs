using System;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;

namespace g2cieloes.lessons
{
    public partial class update_xp : System.Web.UI.Page
    {
        [WebMethod]
        public static object UpdateXP(int xp, int userId)
        {
            string connectionString = "Server=localhost;Database=g2cieloes;user=root;Password=;";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE userinfo SET user_xp = user_xp + @xp WHERE userID = @userId";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@xp", xp);
                    command.Parameters.AddWithValue("@userId", userId);

                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        return new { success = true };
                    }
                    else
                    {
                        return new { success = false, message = "No rows affected." };
                    }
                }
            }
            catch (Exception ex)
            {
                return new { success = false, message = ex.Message };
            }
        }
    }
}
