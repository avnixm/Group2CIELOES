using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Text;
using BCrypt.Net;

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

                string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
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
        SELECT userID, user_fname, user_lname, user_email, RegistrationDate, user_password, user_xp, user_hearts
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
                    user.UserId = reader.GetInt32(0);
                    user.FirstName = reader.GetString(1);
                    user.LastName = reader.GetString(2);
                    user.Email = reader.GetString(3);
                    user.RegistrationDate = reader.GetDateTime(4);
                    user.Password = reader.GetString(5);
                    user.UserXP = reader.GetInt32(6);
                    user.UserHearts = reader.GetInt32(7);
                }

                reader.Close();
            }

            return user;
        }


        private bool IsValidLogin(string connectionString, string email, string password)
        {
            User user = GetUserDetails(connectionString, email);

            if (user != null)
            {
                return BCrypt.Net.BCrypt.Verify(password, user.Password);
            }
            return false;
        }


               private string GetGoogleAuthorizationUrl()
        {
            string clientId = "744603473685-6m4rravomvk26ag85d7q4jh42d91am6v.apps.googleusercontent.com";
            string redirectUri = Server.UrlEncode("https://cieloes.me/Learn");
            string scope = "email profile openid";
        
            string url = $"https://accounts.google.com/o/oauth2/auth?" +
                         $"client_id={clientId}&" +
                         $"redirect_uri={redirectUri}&" +
                         $"scope={scope}&" +
                         $"response_type=code&" +
                         $"state={Guid.NewGuid()}";
        
            return url;
        }
        
        protected void GoogleLoginButton_Click(object sender, EventArgs e)
        {
            string authorizationUrl = GetGoogleAuthorizationUrl();
            Response.Redirect(authorizationUrl);
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["code"]!= null)
            {
                string code = Request.QueryString["code"];
                string redirectUri = "https://cieloes.me/Learn";
                string tokenUrl = "https://oauth2.googleapis.com/token";
                string clientId = "744603473685-6m4rravomvk26ag85d7q4jh42d91am6v.apps.googleusercontent.com";
                string clientSecret = "YOUR_CLIENT_SECRET";
        
                using (var client = new WebClient())
                {
                    var request = new NameValueCollection();
                    request["code"] = code;
                    request["redirect_uri"] = redirectUri;
                    request["grant_type"] = "authorization_code";
                    request["client_id"] = clientId;
                    request["client_secret"] = clientSecret;
        
                    var response = client.UploadValues(tokenUrl, "POST", request);
                    var responseString = Encoding.Default.GetString(response);
        
                    var tokenResponseParts = responseString.Split('&');
                    string accessToken = null;
                    string expiresIn = null;
        
                    foreach (var part in tokenResponseParts)
                    {
                        var keyValue = part.Split('=');
                        if (keyValue[0] == "access_token")
                        {
                            accessToken = keyValue[1];
                        }
                        else if (keyValue[0] == "expires_in")
                        {
                            expiresIn = keyValue[1];
                        }
                    }
        
                    if (!string.IsNullOrEmpty(accessToken))
                    {
                        // Use the access token to authenticate the user
                        // You can use the token to call Google APIs or validate the user's identity
                        // For this example, we'll just redirect the user to the Learn page
                        Response.Redirect("Learn.aspx");
                    }
                    else
                    {
                        // Handle the error
                        Response.Write("Error authenticating with Google");
                    }
                }
            }
        }
   }
}


