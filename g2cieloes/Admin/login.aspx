<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="g2cieloes.Admin.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="login">
        <div class="login-modal" id="login-modal">
            <div class="login-container">
                <div class="close-btn" onclick="redirectToPageIndex()">&times;</div>

                <script>
                function redirectToPageIndex() {
                    window.location.href = '/Default.aspx';
                }
            </script>

                <div class="login-details">
                    <h2>Admin Log In</h2>
                    <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>  
                    <asp:TextBox ID="admin_email" class="username" placeholder="Email" runat="server" required ValidationGroup="loginV"></asp:TextBox>
                     
                    
                    <div class="otpverify">
                        <asp:TextBox ID="otptext" class="email" runat="server" Visible="False"></asp:TextBox>
                        <asp:Button ID="OTPbtn" class="sendOTP" style="background-color:#79b751;" runat="server" Text="Verify OTP" Visible="False" OnClick="OTPbtn_Click" />
                    </div>
                    <asp:TextBox ID="admin_password" type="password" class="password" placeholder="Password" runat="server" required ValidationGroup="loginV"></asp:TextBox>
                    <div class="g-recaptcha" data-sitekey="6LdREcIpAAAAAEWe9sTuzO61bqtWBToHCI7Yxoc2"  style="padding-bottom:13px;"></div>
                    <asp:Button ID="SendOTP" class="sendOTP" runat="server" Text="Send OTP" OnClick="SendOTP_Click"  />
                    <asp:Button ID="LoginBtn" class="login-btn" runat="server" Text="LOG IN"  ValidationGroup="loginV" OnClick="LoginBtn_Click" Visible="False"/>
                    <p>Forgot your Password? <a onclick="redirectToPageSignUp()" id="signup-link" style="color: blue; cursor: pointer;">Reset Password</a></p>
                    <script>
                    function redirectToPageSignUp() {
                        window.location.href = '/resetpassword.aspx';
                        }
                    </script>
                    </div>
                </div>
            </div>
    </section>
     <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</asp:Content>
