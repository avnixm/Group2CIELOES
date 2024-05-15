<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="g2cieloes.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
        <link rel="stylesheet" href="Content/homepage.css" />
    <link rel="stylesheet" href="Content/profile.css" />
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <title>Profile</title>
</head>
<body>
    <div class="wrapper">

        <div class="xp_hearts">
            <div class="xp">
                <img src="Content/images/icons/exp.svg"/>
                <h2>1100</h2>
            </div>
            <div class="hearts">
                <img src="Content/images/icons/hearts.svg"/>
                <h2>3</h2>
            </div>
        </div>

        <div class="sidebar">
            <div class="logo-container">
                <img src="Content/images/wordwiselogo.png" alt="Logo"/>
                <h2>CIELOES</h2>
                <hr/>
            </div>
            <ul>
                <li><a href="Learn.aspx"><i class="fas fa-book"></i> Learn</a></li>
                <li><a href="#"><i class="fas fa-pen"></i> Practice</a></li>
                <li><a href="leaderboards.aspx" id="leaderboard-btn"><i class="fas fa-trophy"></i> Leaderboards</a></li>
                <li><a href="shop.aspx"><i class="fas fa-shopping-cart"></i> Shop</a></li>
                 <li runat="server" id="profileListItem"><a id="profileLink" runat="server" href="profile.aspx"><i class="fas fa-user" class="active"></i> Profile</a></li>
            </ul> 
        </div>

    <div class="main_content">
        <div class="profilemain">
            <div class="avatardv">
                
                <button class="editbtn" onclick="toggleAvatarForm()">edit</button>
                <div class="selected-avatar" id="selectedAvatar">
                   
                    <img src="Content/images/avatarboy1.png" alt="Selected Avatar"/>
                </div>
            </div>

            <div class="rank">
                <div class="rkdv">
                    <p id="ctr">Current Rank</p>
                </div>
            </div>
            <h2 id="name">name</h2>
            <p id="username">username</p>
            <p id="datejoin">joined date </p>


            <h2 id="statistics"></h2>
            <div class="daystreak">
                <div class="streak-sts">
                    <p id="tsp">Total Streak</p>
                </div>
                <p id="tspdb">get from database</p>
            </div>

            <div class="account">
                <h2 id="acct">Account</h2>
                <div class="lbusername"> <label id="usernameLabel">Username</label></div>
                <div class="lbname"> <label id="nameLabel">Name</label></div>
                <div class="lbemail"> <label id="emailLabel">Email</label></div>
                   
                <input type="text" id="p-username"/>
                <input type="text" id="p-name"/>
                <input type="text" id="p-email"/>
                <button id="savebtn">Save</button>
                    
                <form action="#" runat="server" method="post"> 
                    <asp:Button ID="logoutbtn" runat="server" Text="Log out" OnClick="logoutbtn_Click" />>

                </form>
            </div>
        
            <div class="modal-overlay" id="modalOverlay">
                <div class="modal-content">
                    <h2>Select Avatar</h2>
                    <form id="avatarForm" onsubmit="return updateAvatar()">
                        <div id="avatarOptions">
                            <img src="Content/images/avatarboy1.png" alt="Fox" class="avatar-option selected" onclick="selectOption(this)"/>
                            <img src="Content/images/avatarboy2.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatarboy3.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatarboy4.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatarboy5.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatargirl1.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatargirl2.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatargirl3.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatargirl4.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <img src="Content/images/avatargirl5.png" alt="CAIEL" class="avatar-option" onclick="selectOption(this)"/>
                            <button id="closebtn" type="submit">close</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>        
</div>   

    <script>

          // Retrieve the selected avatar URL from local storage
          var selectedAvatarUrl = localStorage.getItem('selectedAvatarUrl');

// Set the initial avatar image
if (selectedAvatarUrl) {
    document.getElementById('selectedAvatar').innerHTML = '<img src="' + selectedAvatarUrl + '" alt="Selected Avatar">';
}
        var selectedOption = document.querySelector('.avatar-option.selected');

        function selectOption(option) {
            if (selectedOption) {
                selectedOption.classList.remove('selected');
            }
            selectedOption = option;
            selectedOption.classList.add('selected');
            updateSelectedAvatar(); // Update the selected avatar when an option is clicked
        }

        function updateSelectedAvatar() {
            var selectedAvatar = document.getElementById('selectedAvatar');
            var selectedImageUrl = selectedOption.src;
            selectedAvatar.innerHTML = '<img src="' + selectedImageUrl + '" alt="Selected Avatar">';
        }

        function updateAvatar() {
            if (!selectedOption) {
                alert('Please select an avatar.');
                return false;
            }
            updateSelectedAvatar(); // Update the selected avatar when form is submitted
            hideAvatarForm(); // Hide the modal after updating avatar
            return false; // Prevent form submission
        }

        function toggleAvatarForm() {
            var modal = document.getElementById('modalOverlay');
            modal.style.display = 'flex'; // Show the modal overlay
        }

        function hideAvatarForm() {
            var modal = document.getElementById('modalOverlay');
            modal.style.display = 'none'; // Hide the modal overlay
        }

        document.addEventListener('DOMContentLoaded', function() {
    var lis = document.querySelectorAll('.wrapper .sidebar ul li');
    lis.forEach(function(li) {
        li.addEventListener('click', function() {
            lis.forEach(function(item) {
                item.classList.remove('active');
            });
            this.classList.add('active');
        });
    });
});

        window.addEventListener('scroll', function() {
    var container1 = document.querySelector('.text_container');
    var container2 = document.querySelector('.text_container_2');
    var rect1 = container1.getBoundingClientRect();
    var rect2 = container2.getBoundingClientRect();
    if (rect2.top < 0) {
        container2.style.position = 'sticky';
        container2.style.top = '15px';
    } else {
        container2.style.position = 'relative';
    }
});

    </script>
</body>
</html>
