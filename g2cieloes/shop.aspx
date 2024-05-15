<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Sidebar.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="g2cieloes.shop" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Content/shop.css"/>
    <div class="wrapper">
        <div class="xp_hearts">
            <div class="xp">
                <img src="Content/images/icons/exp.svg">
                <h2>1100</h2>
            </div>
            <div class="hearts">
                <img src="Content/images/icons/hearts.svg">
                <h2>3</h2>
            </div>
        </div>
        <div class="main_content">
        <div class="content">
            <h2>Hearts</h2><br>
            <hr>
            <div class="heart-container">
                <img class="heart" src="https://d35aaqx5ub95lt.cloudfront.net/images/hearts/547ffcf0e6256af421ad1a32c26b8f1a.svg">
                <h4>Refill Hearts</h4>
                <p>Get full hearts so you can worry less about making mistakes in a lesson</p>
                <div class="box1">
                    <button class="custom-button">
                        <b><span class="icon">GET FOR: <img class="gem" src="https://d35aaqx5ub95lt.cloudfront.net/images/icons/f05a8cf23d961f0a220dec75b1dea1cf.svg">  350</span></b>
                    </button>
                </div>
            </div>
            
            <hr>
            <div class="heart-container">
                <img class="heart" src="https://d35aaqx5ub95lt.cloudfront.net/images/hearts/4f3842c690acf9bf0d4b06e6ab2fffcf.svg">
                <h4>Unlimited Hearts</h4>
                <p>Never run out of hearts with Super!</p><br>
                <div class="box1">
                    <button class="custom-button1">
                        <b><span class="icon">FREE TRIAL</span></b>
                    </button>
                </div>
            </div>
            <h2>Power-Ups</h2><br>
            <hr>
            <div class="heart-container">
                <img class="heart" src="https://d35aaqx5ub95lt.cloudfront.net/images/icons/216ddc11afcbb98f44e53d565ccf479e.svg">
                <h4>Streak Freeze</h4>
                <p>Streak Freeze allows your streak to remain in place for one full day of inactivity.</p>
                <div class="box1">
                    <button class="custom-button2">
                        <b><span class="icon">GET FOR: <img class="gem" src="https://d35aaqx5ub95lt.cloudfront.net/images/gems/45c14e05be9c1af1d7d0b54c6eed7eee.svg">  350</span></b>
                    </button>
                </div> 
            </div>
            <br>
            <hr>
            <div class="heart-container">
                <img class="heart" src="https://d35aaqx5ub95lt.cloudfront.net/images/icons/47112600732328e46768927036578c8b.svg">
                <h4>Double or Nothing</h4>
                <p>Double your 50 gem wager by maintaining a 7 day streak.</p>
                <div class="box1">
                    <button class="custom-button3">
                        <b><span class="icon">GET FOR: <img class="gem" src="https://d35aaqx5ub95lt.cloudfront.net/images/gems/45c14e05be9c1af1d7d0b54c6eed7eee.svg">  350</span></b>
                    </button>
                </div> 
            </div>
        </div>
    </div>
</div>

</asp:Content>
