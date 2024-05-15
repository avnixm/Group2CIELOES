using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace g2cieloes
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void ShowLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void contactbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("contactform.aspx");
        }
    }
}