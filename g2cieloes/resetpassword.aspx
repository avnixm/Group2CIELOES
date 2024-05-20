<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" Inherits="g2cieloes.resetpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <link rel="stylesheet" href="Content/reset.css" />

     <section class="reset">
        <div class="reset-modal" id="rest-modal">
            <div class="reset-container">
                <div class="close-btn" onclick="redirectToPageIndex()">&times;</div>

                <script>
                    function redirectToPageIndex() {
                        window.location.href = 'Default.aspx';
                    }
                </script>

                <div class="reset-details">
                    <h2>Reset Password</h2>
                    <asp:Label ID="labelforotpverification" style="margin-bottom:1%;" runat="server" Text=""></asp:Label>
                    <div class="sendotpclass">
                    <asp:TextBox ID="email" ClientIDMode="Static" class="email" runat="server" placeholder="Email" required></asp:TextBox>
                    <asp:Button ID="SendOTP" class="sendOTP" runat="server" Text="Send OTP" OnClick="SendOTP_Click" />
                    </div>
                    <div class="otpverify">
                        <asp:TextBox ID="otptext" class="email" runat="server" Visible="False" placeholder="Enter OTP" required></asp:TextBox>
                        <asp:Button ID="OTPbtn" class="sendOTP" style="background-color:#79b751;" runat="server" Text="Verify OTP" Visible="False" OnClick="OTPbtn_Click" />
                    </div>
                    <asp:TextBox ID="newpass" class="email" runat="server" placeholder="New Password" required Visible="False"></asp:TextBox>
                    <asp:Button ID="changepassbtn" class="changepassbtn" runat="server" Text="Change Password" OnClick="changepassbtn_Click" Visible="False" />
                </div>
            </div>
        </div>
    </section>
    
</asp:Content>
