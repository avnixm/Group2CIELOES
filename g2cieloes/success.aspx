<%@ Page Title="Registration Success" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="success.aspx.cs" Inherits="g2cieloes.success" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
                <h2>Registration Success!</h2>
                <p>Congratulations, your account has been successfully created.</p>
                <asp:Button ID="gotologinbtn" class="gotologin-btn" runat="server" Text="Continue" OnClick="gotologinbtn_Click" />
            </div>
        </div>
    </div>
</asp:Content>