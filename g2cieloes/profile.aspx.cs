using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace g2cieloes
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DisplayUserXPAndHearts();
                DisplayNameAndJoinDate();

                User currentUser = Session["User"] as User;

                if (currentUser != null && !string.IsNullOrEmpty(currentUser.FirstName))
                {
                    profileLink.InnerHtml = "<i class=\"fas fa-user\"></i> " + currentUser.FirstName;
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void logoutbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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

        private void DisplayNameAndJoinDate()
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                string fullName = $"{user.FirstName} {user.LastName}";
                firstnamelabel.Text = fullName;
                datejoinedlabel.Text = $"Date Joined: {user.RegistrationDate.ToString("MMM dd, yyyy")}";
            }
        }
    }
}