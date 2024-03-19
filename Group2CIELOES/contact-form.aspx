<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="style.css"/>
    <link rel="shortcut icon" type="x-icon" href="images/foxlogo.png"/>
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <title>Contact Us</title>
</head>
<body>
    <form id="contactpage" runat="server">
        <header>
            <img src="images/wordwiselogo.png" class="logo-image"/>
            <a href="index.html" class="logo-text">CIELOES</a>
        </header>

        <div class="contact-modal" id="contact-modal">
            <div class="contact-container">
                <div class="close-btn" onclick="redirectToPageIndex()">&times;</div>
                <script>
                    function redirectToPageIndex() {
                        window.location.href = 'index.aspx';
                    }
                </script>
                <section class="contact-form" id="contact-form">
                    <form action="https://api.web3forms.com/submit" method="POST" class="contact-center">
                        <div class="contact-center-title">
                            <h2>Get in touch</h2>
                            <hr>
                        </div>
                        <input type="hidden" name="access_key" value="94c321ae-ac1f-4f91-b996-daadf820b130"/>
                        <input type="text" name="name" placeholder="Your Name" class="contact-input" required/>
                        <input type="email" name="email" placeholder="Your Email" class="contact-input" required/>
                        <textarea name="message" placeholder="Your Message" class="contact-input" required></textarea>
                        <button type="submit" class="send-btn">Send</button>
                    </form>
                </section>
            </div>
        </div>
    </form>
</body>
</html>
