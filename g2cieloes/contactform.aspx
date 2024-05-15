<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactform.aspx.cs" Inherits="g2cieloes.contactform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Content/contactform.css" />
    <title></title>
</head>
<body>
    <header>
        <img src="Content/images/wordwiselogo.png" class="logo-image"/>
        <a href="index.html" class="logo-text">CIELOES</a>
    </header>

    <div class="contact-modal" id="contact-modal">
        <div class="contact-container">
            <div class="close-btn" onclick="redirectToPageIndex()">&times;</div>
            <script>
                function redirectToPageIndex() {
                    window.location.href = 'Default.aspx';
                }
            </script>
            
            <form action="https://api.web3forms.com/submit" method="POST" class="contact-center">
                <div class="contact-center-title">
                    <h2>Get in touch</h2>
                    <hr>
                </div>
                <input type="hidden" name="access_key" value="94c321ae-ac1f-4f91-b996-daadf820b130"/>
                <input type="text" name="name" placeholder="Your Name" class="contact-input" required/>
                <input type="email" name="email" placeholder="Your Email" class="contact-input" required/>
                <textarea name="message" placeholder="Your Message" class="contact-input" required></textarea>
                <button type="submit" class="submit-btn">Send</button>
            </form>
        </div>
    </div>
</body>
</html>
