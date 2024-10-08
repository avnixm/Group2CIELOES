using System;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;

namespace g2cieloes
{
    public partial class GoogleCallback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var authResult = HttpContext.Current.GetOwinContext().Authentication.AuthenticateAsync("ExternalCookie").Result;
            if (authResult != null)
            {
             
                var identity = authResult.Identity;
                var emailClaim = identity.FindFirst(System.Security.Claims.ClaimTypes.Email);

                if (emailClaim != null)
                {
                    string email = emailClaim.Value;

                 
                    
                    Response.Redirect("learn.aspx");
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}
