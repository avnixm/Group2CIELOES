<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Group2CIELOES.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link rel="shortcut icon" type="x-icon" href="images/foxlogo.png"/>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title>SIGN UP</title>
</head>
<body style="background-color: #dcdcdc">
    <form id="signuppage" runat="server">

        <section class="signup">
        <div class="signup-modal" id="signup-modal">
            <div class="signup-container">
                <div class="signupclose-btn" onclick="redirectToPageIndex()">&times;</div>

                <script>
                    function redirectToPageIndex() {
                        window.location.href = 'index.aspx';
                    }
                </script>

                <div class="signup-details">
                    <h2>Sign Up</h2>
                    <asp:TextBox ID="sfname" type="text" placeholder="First Name" runat="server"  required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="firstnameValidator" runat="server" ErrorMessage="First name should be 2 characters with no special characters!" ControlToValidate="sfname" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z]{2,}$" ValidationGroup="signupValidation"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="slname" type="text" placeholder="Last Name" runat="server" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="lastnameValidator" runat="server" ErrorMessage="Last name should be 2 characters with no special characters!" ControlToValidate="slname" Display="Dynamic" ForeColor="Red" ValidationExpression="^[a-zA-Z]{2,}$" ValidationGroup="signupValidation"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="susername" type="text" placeholder="Username" runat="server" required OnTextChanged="susername_TextChanged"></asp:TextBox>
                    <asp:CustomValidator ID="CustomUsernameValidator" runat="server" ErrorMessage="Username already taken!" ControlToValidate="susername" Display="Dynamic" ForeColor="Red" OnServerValidate="CustomUsernameValidator_ServerValidate" ValidationGroup="signupValidation"></asp:CustomValidator>
                    <asp:TextBox ID="semail" type="text" placeholder="Email" runat="server" required OnTextChanged="semail_TextChanged"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="emailValidator" runat="server" ErrorMessage="Email not valid!" ControlToValidate="semail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="signupValidation"  Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomEmailValidator" runat="server" ErrorMessage="Email already taken!" ControlToValidate="semail" Display="Dynamic" ForeColor="Red" ValidationGroup="signupValidation" OnServerValidate="CustomEmailValidator_ServerValidate"></asp:CustomValidator>
                    <asp:TextBox ID="spassword" TextMode="Password" placeholder="Password" runat="server" required></asp:TextBox>
                    <asp:RegularExpressionValidator ID="passwordValidator" runat="server" ErrorMessage="Password must be 8 characters long!" ControlToValidate="spassword" ForeColor="Red" ValidationExpression="^.{8,}$" ValidationGroup="signupValidation" Display="Dynamic"></asp:RegularExpressionValidator>
                        
                    <asp:Button ID="signup_btn" class="signup-btn" runat="server" Text="SIGN UP" OnClick="signup_btn_Click" CausesValidation="true" ValidationGroup="signupValidation"/>


                    <p>Already have an account? <a onclick="redirectToPageLogin()" id="login-link" style="color: blue; cursor: pointer;">Log In</a></p>
                        <script>
                            function redirectToPageLogin() {
                                window.location.href = 'login.aspx';
                            }
                        </script>
                </div>
            </div>
        </div>

            <div class="success-modal" id="success-modal">
                <div class="success-container">
                    <div class="successclose-btn" onclick="redirectToPageIndex()">&times</div>
                    <script>
                        function redirectToPageIndex() {
                            window.location.href = 'index.aspx';
                        }
                    </script>

                    <div class="success-details">
                        <h2>Registration Success!</h2>
                        <p>Congratulations, your account has been successfully created.</p>
                        <asp:Button ID="gotologinbtn" class="gotologin-btn" runat="server" Text="Continue" OnClick="gotologinbtn_Click" />
                    </div>
                </div>
            </div>
        </section>

        <script>
            function openSuccessModal() {
                document.getElementById("success-modal").classList.add("open");
            }
        </script>
    </form>
    <script src="modal.js"></script>
</body>
</html>
