<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sucess.aspx.cs" Inherits="Group2CIELOES.sucess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link rel="shortcut icon" type="x-icon" href="images/foxlogo.png"/>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title>Sucess!</title>
</head>
<body>
    <form id="sucesspage" runat="server" onsubmit="return validateForm()">
        <header>
            <img src="images/wordwiselogo.png" class="logo-image"/>
            <a href="index.aspx" class="logo-text">CIELOES</a>
        </header>

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
                        <script>
                        </script>
                    </div>
                </div>
            </div>
    </form>

    <script>
        function validateForm() {
            var firstname = document.getElementById("sfname").value;
            var lastname = document.getElementById("slname").value;
            var username = document.getElementById("susername").value;
            var email = document.getElementById("semail").value;
            var password = document.getElementById("spassword").value;

            if (firstname === "" || lastname === "" || username === "" || email === "" || password === "") {
                alert("Please fill out all required fields.");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>
