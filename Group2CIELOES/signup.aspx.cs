using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

namespace Group2CIELOES
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_btn_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;database=cieloesdb;uid=root;pwd=";
            string firstname = sfname.Text;
            string lastname = slname.Text;
            string email = semail.Text;
            string password = spassword.Text;
            string username = susername.Text; 

            
            bool usernameExists = CheckUsernameExists(username);

            if (usernameExists)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Username already taken! Please choose a different username.');", false);
                return;
            }

            bool EmailExists = CheckEmailExists(email);

            if (EmailExists)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email already exist! Please enter a different email.');", false);
                return;
            }

            if (RegisterUser(connectionString, firstname, lastname, username, email, password))
            {
                Response.Redirect("sucess.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration failed!');", true);
            }
        }


        private bool RegisterUser(string connectionString, string firstname, string lastname, string username, string email, string password)
        {
            string query = "INSERT INTO userinfo (firstname, lastname, username, user_email, user_password) VALUES (@FirstName, @LastName, @Username, @Email, @Password)";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FirstName", firstname);
                    command.Parameters.AddWithValue("@LastName", lastname);
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                    catch (Exception ex)
                    {
                        // Handle exception
                        return false;
                    }
                }
            }
        }


        protected void gotologinbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void spassword_TextChanged(object sender, EventArgs e)
        {

        }
            



        protected void semail_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void susername_TextChanged(object sender, EventArgs e)
        {

        }

        protected void sfnameValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string pattern = @"^[a-zA-Z\s]+$";

            if (Regex.IsMatch(args.Value, pattern) && args.Value.Length >= 2)
            {
                args.IsValid = true; 
            }
            else
            {
                args.IsValid = false; 
            }
        }

        protected void CustomUsernameValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string username = args.Value;
            
            bool usernameExists = CheckUsernameExists(username);

            args.IsValid = !usernameExists;
        }

        private bool CheckUsernameExists(string username)
        {
            string connectionString = "server=localhost;database=cieloesdb;uid=root;pwd=";
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM userinfo WHERE username = @Username";
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    connection.Open();
                    int count = Convert.ToInt32(command.ExecuteScalar());
                    return count > 0;
                }
            }
        }



        private bool CheckEmailExists(string email)
        {
            string connectionString = "server=localhost;database=cieloesdb;uid=root;pwd=";
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

        protected void CustomEmailValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string email = args.Value;

            bool usernameExists = CheckEmailExists(email);

            args.IsValid = !usernameExists;
        }
    }
}