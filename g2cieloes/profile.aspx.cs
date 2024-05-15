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
                User currentUser = Session["User"] as User;

                if (currentUser != null && !string.IsNullOrEmpty(currentUser.user_fname))
                {
                    profileLink.InnerHtml = "<i class=\"fas fa-user\"></i> " + currentUser.user_fname;
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
    }
}