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
                // Extract user info from authResult
                var identity = authResult.Identity;
                var emailClaim = identity.FindFirst(System.Security.Claims.ClaimTypes.Email);

                if (emailClaim != null)
                {
                    string email = emailClaim.Value;

                    // Use the email to find or create a user in your database
                    // Redirect to home page or authenticated area
                    Response.Redirect("home.aspx");
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}
