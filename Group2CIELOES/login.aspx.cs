using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace Group2CIELOES
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;database=cieloesdb;uid=root;pwd=";
            string usernameOrEmail = UserName.Text;
            string password = UserPassword.Text;

            if (IsValidLogin(connectionString, usernameOrEmail, password))
            {
                Response.Write("Login successful!");
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                Response.Write("Invalid username or password!");
            }
        }

        private bool IsValidLogin(string connectionString, string usernameOrEmail, string password)
        {
            string query = "SELECT COUNT(*) FROM userinfo WHERE (username = @username OR user_email = @username) AND user_password = @password";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@username", usernameOrEmail);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();
                    int count = Convert.ToInt32(command.ExecuteScalar());

                    return count > 0;
                }
            }
        }

    }
}