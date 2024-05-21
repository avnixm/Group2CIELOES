using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace g2cieloes
{
    public partial class shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayUserXPAndHearts();
            }
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