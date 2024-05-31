using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace g2cieloes
{
    public partial class lesson3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("../login.aspx");
            }
            else
            {
                var user = (User)Session["User"];
                System.Diagnostics.Debug.WriteLine($"User session active: {user.UserId}");
            }
        }


        [WebMethod]
        public static object UpdateXP(int UserXP, int userId)
        {
            string connectionString = "Server=localhost;Database=g2cieloes;user=root;Password=;";
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "UPDATE userinfo SET user_xp = user_xp + @xp WHERE userID = @userId";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@xp", UserXP);
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

