<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Group2CIELOES.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link rel="shortcut icon" type="x-icon" href="images/foxlogo.png"/>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title>CIELOES</title>
</head>
<body>
    <form id="landingpage" runat="server">
        <header>
            <img src="images/wordwiselogo.png" class="logo-image"/>
            <a href="index.html" class="logo-text">CIELOES</a>
        </header>

        <!-- Home Section -->
        <section class="home" id="home">
            <div class="home-img">
                <img src="images/fox.png" />
            </div>

            <div class="content">
                <h1>The fun way of learning english is here!</h1>
                <asp:Button ID="show_signup" class="get-started" runat="server" Text="GET STARTED" OnClick="show_signup_Click" />
                <asp:Button ID="show_login" class="account-already" runat="server" Text="I ALREADY HAVE AN ACCOUNT" OnClick="show_login_Click" />
            </div>
        </section>

        <!-- About Section -->
        <section class="about" id="about">
            <div class="about-img">
                <img src="images/phone3D.png" />
            </div>

            <div class="about-text">
                <h4>About Us</h4>
                <p>CAIEL is a <span id="orangespan">fun</span> and <span>interactive</span> way of learning english. We provide a wide range of services to help you improve your english skills. Our services include vocabulary, grammar, reading, writing, speaking and listening.</p>
            </div>
        </section>

        <!-- Level Section -->
        <section class="level" id="level">
            <div class="heading">
                <span>English Level</span>
                <h2>Discover Your English Mastery Level!</h2>
            </div>

            <div class="level-container">
                <div class="box">
                    <img src="images/confused.png" />
                </div>
                <h2>Beginner</h2>
            </div>

            <div class="level-container">
                <div class="box">
                    <img src="images/intermediate.png" />
                </div>
                <h2>Intermediate</h2>
            </div>
            <div class="level-container">
                <div class="box">
                    <img src="images/expert.png" />
                </div>
                <h2>Fluent</h2>
            </div>
        </section>

        <!--Footer -->
        <footer>
            <div class="footer-content">
                <h3>CAIEL</h3>
                <p>You can contact us through our social medias or you can send us an email!</p>
                <asp:Button ID="contact_btn" class="contact-btn" runat="server" Text="Email Us" OnClick="contact_btn_Click" />

                <ul class="socials">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            </ul>
            </div>
            <div class="footer-bottom">
                <p>copyright &copy;2024 CIELOES.</p>
            </div>
        </footer>
    </form>
</body>
</html>
