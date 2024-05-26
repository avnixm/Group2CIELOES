using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace g2cieloes.Admin
{
    public partial class teachers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindTeacherTable();
        }


        private void BindTeacherTable()
        {
            string connectionString = "Server=MYSQL8010.site4now.net;Database=db_aa8eff_g2ciel;Uid=aa8eff_g2ciel;Pwd=g2cieloes";
            string query = "SELECT admin_fname, admin_lname, admin_email, RegistrationDate, LastLogin FROM admin WHERE Role = 'Teacher'";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                using (MySqlCommand command = new MySqlCommand(query, connection))
                {
                    connection.Open();
                    using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        teacher.DataSource = dt;
                        teacher.DataBind();
                    }
                }
            }
        }
    }
}