﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace g2cieloes
{
    public partial class Learn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayUserXPAndHearts();
            }
        }

        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void Button1_Click1(object sender, ImageClickEventArgs e)
        {

        }

        private void DisplayUserXPAndHearts()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                userxplabel.Text = $"{user.UserXP}";
                userheartslabel.Text = $"{user.UserHearts}";
            }
        }
    }
}
