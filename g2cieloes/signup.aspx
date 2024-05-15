﻿<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="g2cieloes.signup" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script src="Scripts/otp.js"></script>
    <link rel="stylesheet" href="Content/signup.css" />
    <section class="signup">
        <div class="signup-modal" id="signup-modal">
            <div class="signup-container">
                <div class="close-btn" onclick="redirectToPageIndex()">&times;</div>

            <script>
                function redirectToPageIndex() {
                    window.location.href = 'Default.aspx';
                }
            </script>
                <div class="signup-details">
                    <asp:Label ID="OTPlabel" runat="server" Text="OTP SENT!" style="display: none; color: #79b751;"></asp:Label>
                    <h2>Sign Up</h2>
                    <asp:TextBox ID="firstname" class="firstname" runat="server" placeholder="First Name" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Special characters not allowed!" ControlToValidate="firstname" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="Svalidator"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="lastname" class="lastname" runat="server" placeholder="Last Name" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Special characters not allowed!" ControlToValidate="lastname" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$" ValidationGroup="Svalidator"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="email" ClientIDMode="Static" class="email" runat="server" placeholder="Email" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Email not valid!" Display="Dynamic" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Svalidator"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="password" type="password" class="password" runat="server" placeholder="Password" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Password should be atleast 8 characters!" ControlToValidate="password" Display="Dynamic" ForeColor="Red" ValidationExpression=".{8,}" ValidationGroup="Svalidator"></asp:RegularExpressionValidator>
                    <div class="otpverify" style="display: none; margin-bottom: 3%;">
                        <asp:TextBox ID="otptext" runat="server"></asp:TextBox>
                        <asp:Button ID="OTPbtn" class="otpbtn" style="background-color:#79b751;" runat="server" Text="Verify OTP" OnClick="OTPbtn_Click1" />
                       
                    </div>
                    <asp:Button ID="signupbtn" class="signupbtn" style="display: block;" runat="server" Text="SIGN UP" OnClick="signupbtn_Click1"/>

                
                    <p>Already have an account? <a onclick="redirectToPageLogin()" id="login-link" style="color: blue; cursor: pointer;">Log In</a></p>
                    <asp:HiddenField ID="otpHiddenField" runat="server" ClientIDMode="Static" />


                    <script>
                        function redirectToPageLogin() {
                            window.location.href = 'login.aspx';
                        }
                    </script>
                </div>
            </div>
        </div>
</section>
    <script src="Scripts/otp.js"></script>
</asp:Content>