using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace g2cieloes
{
    public partial class Sidebar : System.Web.UI.MasterPage
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
    }
}