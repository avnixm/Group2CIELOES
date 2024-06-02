<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" EnableEventValidation="false" Inherits="g2cieloes.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link rel="stylesheet" href="Content/homepage.css" />
    <link rel="stylesheet" href="Content/profile1.css" />
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="~/faks.svg" rel="shortcut icon" type="image/x-icon" />
    <title>Profile</title>
</head>

<body>
    <form id="mainForm" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="wrapper">
            <div class="xp_hearts">
                <div class="xp">
                    <img src="Content/images/icons/exp.svg"/>
                    <asp:Label ID="userxplabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
                </div>
                <div class="hearts">
                    <img src="Content/images/icons/hearts.svg"/>
                    <asp:Label ID="userheartslabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
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
                    <li><a href="practice.aspx"><i class="fas fa-pen"></i> Practice</a></li>
                    <li><a href="leaderboards.aspx" id="leaderboard-btn"><i class="fas fa-trophy"></i> Leaderboards</a></li>
                    <li><a href="shop.aspx"><i class="fas fa-shopping-cart"></i> Shop</a></li>
                    <li runat="server" id="profileListItem"><a id="profileLink" runat="server" href="profile.aspx"><i class="fas fa-user" class="active"></i> Profile</a></li>
                </ul> 
            </div>

            <div class="main_content">
                <div class="profilemain">
                    <div class="avatardv">
                        <button class="editbtn" type="button" onclick="toggleAvatarForm()">edit</button>
                        <div class="selected-avatar" id="selectedAvatar">
                            <img src="Content/images/avatarboy1.png" alt="Selected Avatar"/>
                        </div>
                    </div>

                    <div class="rank">
                        <div class="rkdv">
                        <div class="trophy-container">
                            <i class="fas fa-trophy"></i>
                            <asp:Label ID="ctr" runat="server" Text="" Font-Size="X-Large" Font-Bold="True"></asp:Label>
                        </div>
                    </div>

                    </div>
                    <br />
                    <asp:Label ID="firstnamelabel" runat="server" Text="Name" Font-Bold="True" style="margin-top: 10%;font-size: 2rem;"></asp:Label>
                    <br />
                    <asp:Label ID="datejoinedlabel" runat="server" Text="Date Joined" style="margin-top:10%;"></asp:Label>

                    <h2 id="statistics"></h2>

                    <div class="account">
                        <h2 id="acct">Account</h2>
                          <label class="lbusername" for="p_username">Email</label>
                         <asp:TextBox ID="p_username" runat="server" CssClass="custom-textbox" />

                         <label class="lbname" for="p_name">Name</label>
                         <asp:TextBox ID="p_name" runat="server" CssClass="custom-textbox" />
                        <asp:Button ID="savebtn" runat="server" Text="Save" OnClick="SaveChanges" />
                    </div>

                    <asp:Button ID="logoutbtn" runat="server" Text="Log out" OnClick="logoutbtn_Click" />

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
    </form>

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
            updateSelectedAvatar();
        }

        function updateSelectedAvatar() {
            var selectedAvatar = document.getElementById('selectedAvatar');
            var selectedImageUrl = selectedOption.src;
            selectedAvatar.innerHTML = '<img src="' + selectedImageUrl + '" alt="Selected Avatar">';
            localStorage.setItem('selectedAvatarUrl', selectedImageUrl); // Save selected avatar URL to local storage
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

        document.addEventListener('DOMContentLoaded', function () {
            var lis = document.querySelectorAll('.wrapper .sidebar ul li');
            lis.forEach(function (li) {
                li.addEventListener('click', function () {
                    lis.forEach(function (item) {
                        item.classList.remove('active');
                    });
                    this.classList.add('active');
                });
            });
        });

        window.addEventListener('scroll', function () {
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

        function saveChanges() {
            var newEmail = $('#<%= p_username.ClientID %>').val();
            var newName = $('#<%= p_name.ClientID %>').val();
            $.ajax({
                type: "POST",
                url: "profile.aspx/SaveChanges",
                data: JSON.stringify({ newEmail: newEmail, newName: newName }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d.success) {
                        $('#<%= firstnamelabel.ClientID %>').text(response.d.newName);
                        alert('Changes saved successfully!');
                    } else {
                        alert('Error saving changes: ' + response.d.errorMessage);
                    }
                },
                error: function (xhr, status, error) {
                    alert('AJAX error: ' + error);
                }
            });
            return false; // Prevent the default postback
        }
    </script>
</body>
</html>
