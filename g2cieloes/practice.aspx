<%@ Page Title="" Language="C#" MasterPageFile="~/Sidebar.Master" AutoEventWireup="true" CodeBehind="practice.aspx.cs" Inherits="g2cieloes.practice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="Content/practice.css" />
    <div class="wrapper">  
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
                <img src="Content/images/icons/exp.svg"/>
                <asp:Label ID="userxplabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
            </div>
            <div class="hearts">
                <img src="Content/images/icons/hearts.svg"/>
                <asp:Label ID="userheartslabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
            </div>
        </div>
        </div>

</asp:Content>
