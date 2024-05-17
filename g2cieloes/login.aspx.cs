using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Text;
using System.Security.Cryptography;

namespace g2cieloes
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            var isCaptchaValid = GoogleV3.Validate(encodedResponse);
            if (isCaptchaValid)
            {
                Response.Write("Captcha Valid!");

                string connectionString = "Server=MYSQL9001.site4now.net;Database=db_aa7b08_cieloes;Uid=aa7b08_cieloes;Pwd=g2cieloes";
                string userEmail = user_email.Text;
                string password = user_password.Text;

                if (IsValidLogin(connectionString, userEmail, password))
                {
                    User user = GetUserDetails(connectionString, userEmail);

                    Session["User"] = user;

                    Response.Write("Login successful!");
                    Response.Redirect("Learn.aspx");
                }
                else
                {
                    errorLabel.Visible = true;
                }
            }
            else
            {
                errorLabel.Text = "Captcha Invalid!";
                errorLabel.Visible = true;
            }
        }


        private User GetUserDetails(string connectionString, string usernameOrEmail)
        {
            User user = new User();

            string query = @"
                SELECT user_id, user_fname, registration_date
                FROM userinfo
                WHERE user_email = @UsernameOrEmail";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@UsernameOrEmail", usernameOrEmail);

                connection.Open();
                MySqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    user.user_id = reader.GetInt32(0);
                    user.user_fname = reader.GetString(1);
                    user.registration_date = reader.GetDateTime(2);
                }

                reader.Close();
            }

            return user;
        }

        private bool IsValidLogin(string connectionString, string email, string password)
        {
            string query = "SELECT user_password FROM userinfo WHERE user_email = @Email";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        string hashedPasswordFromDB = result.ToString();
                        string hashedPassword = ComputeMD5Hash(password);

                        return hashedPassword == hashedPasswordFromDB;
                    }
                    return false;
                }
            }
        }

        private string ComputeMD5Hash(string input)
        {
            using (MD5 md5 = MD5.Create())
            {
                byte[] inputBytes = Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("x2"));
                }
                return sb.ToString();
            }
        }

        protected void googleLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect(GetGoogleAuthorization());
        }

        private string GetGoogleAuthorization()
        {
            string clientId = "160524548544-g5m3905r30lalf7usvnh822kpl0skq2r.apps.googleusercontent.com";
            string redirectUri = "https://localhost:44331/Learn";
            string scope = "email profile openid";

            string url = $"https://accounts.google.com/o/oauth2/auth?" + $"client_id={clientId}&" + $"redirect_uri={redirectUri}&" + $"scope={scope}&" + $"response_type=code";

            return url;
        }
    }
}
