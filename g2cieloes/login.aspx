<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="g2cieloes.login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <section class="login">
        <div class="login-modal" id="login-modal">
            <div class="login-container">
                <div class="close-btn" onclick="redirectToPageIndex()">&times;</div>

                <script>
                function redirectToPageIndex() {
                    window.location.href = 'Default.aspx';
                }
            </script>

                <div class="login-details">
                    <h2>Log In</h2>
                    <asp:Label ID="errorLabel" runat="server" Text="Invalid username or password!" style="margin-bottom:10px; color: red;" Visible="false"></asp:Label>
                    <asp:Button ID="googleLogin" runat="server" class="login-with-google-btn" Text="Sign in with Google" OnClick="googleLogin_Click" />
                    <p>OR</p>
                    <asp:TextBox ID="user_email" class="username" placeholder="Email" runat="server" required ValidationGroup="loginV"></asp:TextBox>
                    <asp:TextBox ID="user_password" type="password" class="password" placeholder="Password" runat="server" required ValidationGroup="loginV"></asp:TextBox>
                    <div class="g-recaptcha" data-sitekey="6LdREcIpAAAAAEWe9sTuzO61bqtWBToHCI7Yxoc2"></div>
                    <asp:Button ID="LoginBtn" class="login-btn" runat="server" Text="LOG IN" OnClick="LoginBtn_Click" ValidationGroup="loginV"/>
                    <p>Forgot your Password? <a onclick="redirectToPageSignUp()" id="signup-link" style="color: blue; cursor: pointer;">Reset Password</a></p>
                    <script>
                    function redirectToPageSignUp() {
                        window.location.href = 'resetpassword.aspx';
                        }
                    </script>
                </div>
            </div>
        </div>
    </section>
   <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</asp:Content>