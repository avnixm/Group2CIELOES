<%@ Page Title="Leaderboards" Language="C#" MasterPageFile="~/Sidebar.Master" AutoEventWireup="true" CodeBehind="leaderboards.aspx.cs" Inherits="g2cieloes.leaderboards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Content/leaderboard1.css" />
    <section class="leaderboard">
    <div class="wrapper">
        <div class="xp_hearts">
            <div class="xp">
                <img src="Content/images/icons/exp.svg">
                <asp:Label ID="userxplabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
            </div>
            <div class="hearts">
                <img src="Content/images/icons/hearts.svg">
                <asp:Label ID="userheartslabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
            </div>
        </div>
        <div class="main_content">
        <h1>Leaderboard</h1>  
        
            <div class="table-responsive">
            <asp:GridView ID="leaderboardsgridview" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="user_fname" HeaderText="First Name" />
                    <asp:BoundField DataField="user_xp" HeaderText="XP" />
                </Columns>
            </asp:GridView>
           </div>
        </div> 
        </div>
         
</section>

</asp:Content>
