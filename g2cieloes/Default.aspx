<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="g2cieloes._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Home Section -->
    <section class="home" id="home">
        <div class="home-img">
            <img src="Content/images/fox.png">
        </div>

        <div class="content">
            <h1>The fun way of learning english is here!</h1>
            <asp:Button ID="ShowSignUp" class="get-started" runat="server" Text="GET STARTED" OnClick="ShowSignUp_Click" />
            <asp:Button ID="ShowLogIn" class="account-already" runat="server" Text="I ALREADY HAVE AN ACCOUNT" OnClick="ShowLogIn_Click" />
        </div>

        <script>
            function redirectToPageLogin() {
                window.location.href = 'login.html';
            }

            function redirectToPageSignUp() {
                window.location.href = 'signup.html';
            }
        </script>
    </section> 

    <!-- About Section -->
    <section class="about" id="about">
        
        <div class="about-img">
            <img src="Content/images/phone3D.png">
        </div>

        <div class="about-text">
            <h4>About Us</h4>
            <p>CIELOES is a <span id="orangespan">fun</span> and <span>interactive</span> way of learning english. We provide a wide range of services to help you improve your english skills. Our services include vocabulary, grammar, reading, writing, speaking and listening.</p>
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
                <div class="box-img">
                    <img src="Content/images/confused.png">
                </div>
                <h2>Beginner</h2>
            </div>

            <div class="box">
                <div class="box-img">
                    <img src="Content/images/intermediate.png">
                </div>
                <h2>Intermediate</h2>
            </div>

            <div class="box">
                <div class="box-img">
                    <img src="Content/images/expert.png">
                </div>
                <h2>Fluent</h2>
            </div>
        </div>
    </section>
    <footer>
        <div class="footer-content">
            <h3>CIELOES</h3>
            <p>You can contact us through our social medias, or you can email us!</p>
            <asp:Button ID="contactbtn" class="contact-btn" runat="server" Text="Email Us!" OnClick="contactbtn_Click" />

            <ul class="socials">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            </ul>
        </div>
        <div class="footer-bottom">
            <p>&copy; <%= DateTime.Now.Year %> - CIELOES</p>
        </div>
    </footer>
</asp:Content>
