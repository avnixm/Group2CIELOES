<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="resetsuccess.aspx.cs" Inherits="g2cieloes.resetsuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="success.css" />
    <div class="success-modal" id="success-modal">
        <div class="success-container">
            <div class="successclose-btn" onclick="redirectToPageIndex()">&times</div>
            <script>
                        function redirectToPageIndex() {
                            window.location.href = 'default.aspx';
                        }
            </script>

            <div class="success-details">
    <h2>Password Reset Success!</h2>
    <p>Your password has been successfully reset.</p>
    <asp:Button ID="gotologinbtn" class="gotologin-btn" runat="server" Text="Continue" OnClick="gotologinbtn_Click" />
</div>
        </div>
    </div>
</asp:Content>
