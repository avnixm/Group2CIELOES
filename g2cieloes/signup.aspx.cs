using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;

namespace g2cieloes
{
    public partial class signup : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

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


        protected void signupbtn_Click1(object sender, EventArgs e)
        {
            string userEmail = email.Text;
            bool emailExists = CheckIfEmailExists(userEmail);

            if (emailExists)
            {
                RegularExpressionValidator3.ErrorMessage = "Email already exists!";
                RegularExpressionValidator3.IsValid = false;
            }
            else
            {
                string script = "<script type='text/javascript'>sendOTPSignUp();</script>";
                if (!ClientScript.IsClientScriptBlockRegistered("SendOTPScript"))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SendOTPScript", script);
                }

                signupbtn.Visible = false;
            }

            
        }

        private bool CheckIfEmailExists(string email)
        {
            string connectionString = "Server=MYSQL9001.site4now.net;Database=db_aa7b08_cieloes;Uid=aa7b08_cieloes;Pwd=g2cieloes";
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM userinfo WHERE user_email = @Email";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();
                int count = Convert.ToInt32(command.ExecuteScalar());

                return count > 0;
            }
        }

        protected void OTPbtn_Click1(object sender, EventArgs e)
        {
            string otpText = otptext.Text;
            string generatedOTP = otpHiddenField.Value;

            if (otpText == generatedOTP)
            {
                // OTP is correct
                string firstName = firstname.Text;
                string lastName = lastname.Text;
                string userEmail = email.Text;
                string userPassword = password.Text;

                // Hash the password
                string hashedPassword = ComputeMD5Hash(userPassword);

                // Save data in User object
                User user = new User
                {
                    FirstName = firstName,
                    LastName = lastName,
                    Email = userEmail,
                    Password = hashedPassword, // Store hashed password
                };

                // Insert user data into database
                string connectionString = "Server=MYSQL9001.site4now.net;Database=db_aa7b08_cieloes;Uid=aa7b08_cieloes;Pwd=g2cieloes";
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    string query = "INSERT INTO userinfo (user_fname, user_lname, user_email, user_password, registration_date, user_activation) VALUES (@FirstName, @LastName, @Email, @Password, CURRENT_TIMESTAMP(), 1)";

                    MySqlCommand command = new MySqlCommand(query, connection);
                    command.Parameters.AddWithValue("@FirstName", user.FirstName);
                    command.Parameters.AddWithValue("@LastName", user.LastName);
                    command.Parameters.AddWithValue("@Email", user.Email);
                    command.Parameters.AddWithValue("@Password", user.Password);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();

                        OTPlabel.Style["display"] = "none";
                        Response.Redirect("success.aspx");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("An error occurred: " + ex.Message);
                    }
                }
            }
            else
            {
                // Invalid OTP
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid OTP');", true);
            }
        }


    }
}
