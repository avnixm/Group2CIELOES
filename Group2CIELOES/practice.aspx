<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="practice.aspx.cs"Practice.aspx.cs="Group2CIELOES.practice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Practice</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="practice.css" />
<script>
        document.addEventListener('DOMContentLoaded', function () {
            let next = document.querySelector('.next');
            let prev = document.querySelector('.prev');

            next.addEventListener('click', function () {
                let items = document.querySelectorAll('.item');
                document.querySelector('.slide').appendChild(items[0]);
            });

            prev.addEventListener('click', function () {
                let items = document.querySelectorAll('.item');
                document.querySelector('.slide').prepend(items[items.length - 1]);
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="sidebar">
                <div class="logo-container">
                    <img src="wordwiselogo.png" alt="Logo" />
                    <h2>CIELOES</h2>
                    <hr />
                </div>
                <ul>
                    <li class="active"><a href="dashboard.html"><i class="fas fa-book"></i> Learn</a></li>
                    <li><a href="#"><i class="fas fa-pen"></i> Practice</a></li>
                    <li><a href="leaderboards.html" id="leaderboard-btn"><i class="fas fa-trophy"></i> Leaderboards</a></li>
                    <li><a href="shop.html"><i class="fas fa-shopping-cart"></i> Shop</a></li>
                    <li><a href="Profile.html"><i class="fas fa-user"></i> Profile</a></li>
                </ul>
            </div>
            <div class="container">
                <div class="slide">
                    <div class="item" style="background-image: url(asd.jpg);">
                        <div class="content">
                            <div class="name">SPEAK</div>
                            <div class="des">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!</div>
                            <button>ENTER</button>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(qeew-transformed.jpeg);">
                        <div class="content">
                            <div class="name">LISTEN</div>
                            <div class="des">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!</div>
                            <button>ENTER</button>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(qaz.jpg);">
                        <div class="content">
                            <div class="name">ANONYMS & SYNONYMS</div>
                            <div class="des">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ab, eum!</div>
                            <button>ENTER</button>
                        </div>
                    </div>
                </div>
                <div class="button">
                    <button class="prev"><i class="fa-solid fa-arrow-left"></i></button>
                    <button class="next"><i class="fa-solid fa-arrow-right"></i></button>
                </div>
            </div>
            <div class="xp_hearts">
                <div class="xp">
                    <img src="exp.svg" alt="Experience Icon" />
                    <h2>1100</h2>
                </div>
                <div class="hearts">
                    <img src="hearts.svg" alt="Hearts Icon" />
                    <h2>3</h2>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
