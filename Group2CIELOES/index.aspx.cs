using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group2CIELOES
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void show_signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void show_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void contact_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("contact-form.aspx");
        }
    }
}