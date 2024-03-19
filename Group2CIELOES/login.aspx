<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Group2CIELOES.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link rel="shortcut icon" type="x-icon" href="images/foxlogo.png"/>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title>LOG IN</title>
</head>
<body>
    <form id="loginpage" runat="server">
        <section class="login">
            <div class="login-modal" id="login-modal">
                <div class="login-container">
                    <div class="loginclose-btn" onclick="redirectToPageIndex()">&times;</div>
                    <script>
                        function redirectToPageIndex() {
                            window.location.href = 'index.aspx';
                        }
                    </script>

                    <div class="login-details">
                        <h2>Log In</h2>
                        <asp:TextBox ID="UserName" class="l-username" runat="server" placeholder="Email or Username"></asp:TextBox>
                        <asp:TextBox ID="UserPassword" class="l-password" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <asp:Button ID="login_btn" class="login-btn" runat="server" Text="LOG IN" OnClick="login_btn_Click" />
                        <p>Don't have an account? <a onclick="redirectToPageSignUp()" id="signup-link" style="color: blue; cursor: pointer;">Sign Up</a></p>
                        <script>
                            function redirectToPageSignUp() {
                                window.location.href = 'signup.aspx';
                            }
                        </script>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>

