using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace g2cieloes.Admin
{
    public partial class login : System.Web.UI.Page
    {
        private static string otpValue;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            var encodedResponse = Request.Form["g-Recaptcha-Response"];
            var isCaptchaValid = GoogleV3.Validate(encodedResponse);

            if (isCaptchaValid)
            {
                if (IsOtpVerified())
                {
                    string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
                    string adminEmail = admin_email.Text;
                    string adminPassword = admin_password.Text;

                    if (IsValidLogin(connectionString, adminEmail, adminPassword))
                    {
                        Admin admin = GetAdminDetails(connectionString, adminEmail);

                        Session["Admin"] = admin;

                        Response.Write("Login successful!");
                        Response.Redirect("adminlesson.aspx");
                    }
                    else
                    {
                        errorLabel.Text = "Invalid email or password!";
                        errorLabel.ForeColor = System.Drawing.Color.Red;
                        errorLabel.Visible = true;
                    }
                }
                else
                {
                    errorLabel.Text = "Invalid OTP!";
                    errorLabel.ForeColor = System.Drawing.Color.Red;
                    errorLabel.Visible = true;
                }
            }
            else
            {
                errorLabel.Text = "Invalid captcha!";
                errorLabel.ForeColor = System.Drawing.Color.Red;
                errorLabel.Visible = true;
            }
        }


        private bool IsOtpVerified()
        {
            string userInput = otptext.Text;
            return userInput == otpValue;
        }

        private Admin GetAdminDetails(string connectionString, string email)
        {
            Admin admin = null;

            string query = @"
                SELECT adminID, admin_fname, admin_lname, admin_email, admin_password, RegistrationDate, IsActivated, Role, LastLogin
                FROM admin
                WHERE admin_email = @Email";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

                connection.Open();
                MySqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    admin = new Admin
                    {
                        AdminId = reader.GetInt32("adminID"),
                        FirstName = reader.GetString("admin_fname"),
                        LastName = reader.GetString("admin_lname"),
                        Email = reader.GetString("admin_email"),
                        Password = reader.GetString("admin_password"),
                        RegistrationDate = reader.GetDateTime("RegistrationDate"),
                        IsActivated = reader.GetBoolean("IsActivated"),
                        Role = reader.GetString("Role"),
                        LastLogin = reader.IsDBNull(reader.GetOrdinal("LastLogin")) ? (DateTime?)null : reader.GetDateTime("LastLogin")
                    };
                }

                reader.Close();
            }

            return admin;
        }

        private bool IsValidLogin(string connectionString, string email, string password)
        {
            Admin admin = GetAdminDetails(connectionString, email);

            if (admin != null && admin.Password == password)
            {
                return true;
            }

            return false;
        }

        protected void SendOTP_Click(object sender, EventArgs e)
        {
            string recipientEmail = admin_email.Text;

            if (!string.IsNullOrEmpty(recipientEmail))
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
            <tr><td style='background-color:#F5F8F4; padding: 32px 50px;'><p class='paragraph'><span class='bold' style='color:#36710F;'>Good day!</span><br><br> To complete your log in procedure, please use the OTP provided below:<br><br><span class='bold'>OTP: {otp}</span><br><br>If you did not log in for in this account, please change your password immediately. Your account security is our top priority.<br><br>Thank you for choosing CIELOES. If you have any questions or concerns, please don't hesitate to contact our support team.<br><br>Best regards,<br><br>CIELOES Support Team</p></td></tr>
            <tr><td style='background-color:#F5F8F4; padding: 20px 80px;'><div style='background:#79B751; height: 1px;'>&nbsp;</div></td></tr>
            <tr><td style='background-color:#F5F8F4; padding: 20px; text-align:center;'><p class='paragraph'>If you no longer wish to receive mail from us, you can <a href='{unsubscribe}' style='color: #5457FF;'>unsubscribe</a>.</p></td></tr>
            <tr><td style='background-color:#79B751; padding: 12px; text-align:center;'><p class='paragraph' style='font-size: 10px;'>Unable to view? Read it <a href='{view}' style='color:#36710F;'>Online</a></p></td></tr>
        </table>
    </center>
</body>
</html>";

                bodyMessage = bodyMessage.Replace("{otp}", otpValue);

                try
                {
                    MailMessage message = new MailMessage();
                    SmtpClient smtp = new SmtpClient();
                    message.From = new MailAddress(fromMail);
                    message.To.Add(new MailAddress(recipientEmail));
                    message.Subject = "OTP Verification";
                    message.IsBodyHtml = true;
                    message.Body = bodyMessage;

                    smtp.Port = 587;
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential(fromMail, fromPassword);
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                    smtp.Send(message);

                    otptext.Visible = true;
                    OTPbtn.Visible = true;

                    LoginBtn.Visible = true;

                    SendOTP.Visible = false;

                    errorLabel.Text = "OTP Sent!";
                    errorLabel.ForeColor = System.Drawing.Color.Green;
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('Error: {ex.Message}')", true);
                }
            }
            else
            {
                errorLabel.Text = "Please enter a valid email address";
                errorLabel.ForeColor = System.Drawing.Color.Red;
            }
        }

        private string GenerateOTP()
        {
            Random rand = new Random();
            int otp = rand.Next(100000, 999999);
            return otp.ToString();
        }

        protected void OTPbtn_Click(object sender, EventArgs e)
        {
            string userInput = otptext.Text;

            if (userInput == otpValue)
            {
                errorLabel.Text = "OTP verified!";
                errorLabel.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                errorLabel.Text = "OTP verification failed!";
                errorLabel.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}