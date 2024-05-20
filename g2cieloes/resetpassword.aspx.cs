using System;
using System.Net;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using BCrypt.Net;

namespace g2cieloes
{
    public partial class resetpassword : System.Web.UI.Page
    {
        private static string otpValue;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SendOTP_Click(object sender, EventArgs e)
        {
            string recipientEmail = email.Text;

            if (!string.IsNullOrEmpty(recipientEmail) && CheckIfEmailExists(recipientEmail))
            {
                otpValue = GenerateOTP();

                string fromMail = "cieloes.demo@gmail.com";
                string fromPassword = "pmvvcsttjdwuepxa";

                string bodyMessage = @"
<!DOCTYPE html>
<html lang='en' xmlns='http://www.w3.org/1999/xhtml' xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office'>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='x-apple-disable-message-reformatting'>
    <meta name='format-detection' content='telephone=no,address=no,email=no,date=no,url=no'>
    <meta name='color-scheme' content='light'>
    <meta name='supported-color-schemes' content='light'>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap');
        body { margin: 0; padding: 0; background-color: #423836; }
        .contentMainTable { width: 100%; max-width: 640px; margin: auto; }
        .heading1 { font-size: 38px; font-family: 'Courier', sans-serif; text-align: center; color: #79B751; }
        .paragraph { font-size: 15px; font-family: 'Montserrat', sans-serif; color: #5f5f5f; }
        .bold { font-weight: bold; }
    </style>
</head>
<body>
    <center role='article' aria-roledescription='email' lang='en' style='width: 100%; background-color: #423836;'>
        <table align='center' role='presentation' cellspacing='0' cellpadding='0' border='0' width='640' class='contentMainTable'>
            <tr><td style='background-color:#F5F8F4; height: 30px;'>&nbsp;</td></tr>
            <tr><td style='background-color:#f5f8f4; padding: 20px; text-align:center;'><p class='heading1'><span class='bold'>CIELOES</span></p></td></tr>
            <tr><td style='background-color:#F5F8F4; padding: 20px 80px;'><div style='background:#79B751; height: 3px;'>&nbsp;</div></td></tr>
            <tr><td style='background-color:#F5F8F4; padding: 32px 50px;'><p class='paragraph'><span class='bold' style='color:#36710F;'>Good day!</span><br><br>We received a request to reset the password for your CIELOES account. To proceed, please use the OTP provided below:<br><br><span class='bold'>OTP: {otp}</span><br><br>If you didn't request this password reset, please ignore this email. Your account security is our top priority.<br><br>Thank you for choosing CIELOES. If you have any questions or concerns, please don't hesitate to contact our support team.<br><br>Best regards,<br><br>CIELOES Support Team</p></td></tr>
            <tr><td style='background-color:#F5F8F4; padding: 20px 80px;'><div style='background:#79B751; height: 1px;'>&nbsp;</div></td></tr>
            <tr><td style='background-color:#F5F8F4; padding: 20px; text-align:center;'><p class='paragraph'>If you no longer wish to receive mail from us, you can <a href='{unsubscribe}' style='color: #5457FF;'>unsubscribe</a>.</p></td></tr>
            <tr><td style='background-color:#79B751; padding: 12px; text-align:center;'><p class='paragraph' style='font-size: 10px;'>Unable to view? Read it <a href='{view}' style='color:#36710F;'>Online</a></p></td></tr>
        </table>
    </center>
</body>
</html>";

                bodyMessage = bodyMessage.Replace("{otp}", otpValue);

                MailMessage message = new MailMessage();
                message.From = new MailAddress(fromMail);
                message.Subject = "Your OTP Code for Password Reset";
                message.To.Add(new MailAddress(recipientEmail));
                message.Body = bodyMessage;
                message.IsBodyHtml = true;

                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential(fromMail, fromPassword),
                    EnableSsl = true,
                };

                try
                {
                    smtpClient.Send(message);
                    otptext.Visible = true;
                    OTPbtn.Visible = true;
                    
                }
                catch (Exception ex)
                {
                   
                }
            }
            else
            {
                labelforotpverification.Text = "Email does not exist!";
                labelforotpverification.Visible = true;
                labelforotpverification.ForeColor = System.Drawing.Color.Red;
            }
        }


        private string GenerateOTP()
        {
            Random rand = new Random();
            int otp = rand.Next(100000, 999999);
            return otp.ToString();
        }

        private bool IsOtpVerified()
        {
            string userInput = otptext.Text;
            return userInput == otpValue;
        }

        protected void OTPbtn_Click(object sender, EventArgs e)
        {
            string userInput = otptext.Text;

            if (userInput == otpValue)
            {
                labelforotpverification.Text = "OTP verified!";
                labelforotpverification.ForeColor = System.Drawing.Color.Green;
                newpass.Visible = true;
                changepassbtn.Visible = true;
            }
            else
            {
                labelforotpverification.Text = "OTP verification failed!";
                labelforotpverification.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void changepassbtn_Click(object sender, EventArgs e)
        {
            string useremail = email.Text;
            string newPassword = newpass.Text;

            if (IsOtpVerified())
            {
                if (!CheckIfEmailExists(useremail))
                {
                    labelforotpverification.Text = "Email not registered!";
                    labelforotpverification.Visible = true;
                }
                else
                {
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);

                    UpdatePassword(useremail, hashedPassword);

                    Response.Redirect("resetsuccess.aspx");
                }
            }
            else
            {
                labelforotpverification.Text = "OTP verification failed!";
                labelforotpverification.Visible = true;
            }
        }

        private bool CheckIfEmailExists(string email)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            ;
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM userinfo WHERE user_email = @Email";
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    int count = Convert.ToInt32(command.ExecuteScalar());
                    return count > 0;
                }
            }
        }

        private void UpdatePassword(string email, string hashedPassword)
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "UPDATE userinfo SET user_password = @Password WHERE user_email = @Email";
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Password", hashedPassword);
                    command.Parameters.AddWithValue("@Email", email);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}


