<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Sidebar.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="g2cieloes.shop" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link rel="stylesheet" href="Content/shopiii.css"/>
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
                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="gem" ImageUrl="~/Content/images/getfor.png" style="width:120px; height:25px;" OnClick="ImageButton1_Click"/>

                        
                    </button>
                </div>
            </div>
            
            <hr>
            <div class="heart-container">
                <img class="heart" src="https://d35aaqx5ub95lt.cloudfront.net/images/hearts/4f3842c690acf9bf0d4b06e6ab2fffcf.svg">
                <h4>Discounted Hearts!</h4>
                <p>Buy 10 hearts with a 10% discount!</p><br>
                <div class="box1">
                    <button class="custom-button1">
                        <asp:Button ID="buy10hearts" runat="server" Text="Buy 10 hearts for 45XP!" OnClick="buy10hearts_Click" style="border:none;"/>
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
                        <b><span class="icon">GET FOR: <img class="gem" src="Content/images/icons/exp.svg">  350</span></b>
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
                        <b><span class="icon">GET FOR: <img class="gem" src="Content/images/icons/exp.svg">  350</span></b>
                    </button>
                </div> 
            </div>
        </div>
    </div>
</div>
</asp:Content>
