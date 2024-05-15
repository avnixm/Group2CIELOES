<%@ Page Title="Learn" Language="C#" MasterPageFile="~/Sidebar.Master" AutoEventWireup="true" CodeBehind="Learn.aspx.cs" Inherits="g2cieloes.Learn" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
    <div class="main_content">
            <div class="search_box">
                <input class="search-field" type="text" placeholder="Search for words...">
            </div>
            <div class="lesson_container">
                <div class="spaceholder">
                    
                </div>
                <div class="text_container">
                <h2>Section 1</h2>
                <h2>Use pronouns, make questions.</h2>
                </div>
                <div class="flex_container">
                    <div class="unit_box">
                        <asp:ImageButton ID="Button1" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button2" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button3" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button4" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button5" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button6" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button7" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button8" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                        <asp:ImageButton ID="Button9" CssClass="unit_btn" runat="server" ImageUrl="~/Content/images/icons/star.svg" AlternateText="Star Icon" />
                    </div>
                </div>
            </div>  
        </div>
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
        <div class="container">
            <h3 style="text-align: center; padding: 0px 0px 15px 0px; font-size: 20px;">#WORD-OF-THE-DAY</h3>
            <div class="word" id="word"></div>
            <div class="audio-controls">
                <i class="fas fa-volume-up" id="playButton"></i>
                <audio id="audio" style="display: none;">
                    <source src="" type="audio/mpeg">
                </audio>
            </div>
            <div class="details" id="details">
                <p><span id="textPronunciation"></span></p>
                <p><span id="partOfSpeech"></span></p>
                <p class="italic">Definition:</p>
                <span id="definition"></span>
                <p class="italic" style="margin-top: 10px;">Synonyms:</p>
                <p id="synonymsList"></p>
                <p class="italic">Examples:</p>
                <ul id="examples"></ul>
            </div>              
        </div>
    </div>
    <script src="Scripts/script.js"></script>
    <script src="Scripts/word_of_the_day.js"></script> 

</asp:Content>