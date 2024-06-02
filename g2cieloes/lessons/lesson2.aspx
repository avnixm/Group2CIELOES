<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lesson2.aspx.cs" Inherits="g2cieloes.lessons.lesson2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="lesson.css" />
    <title>Fruit Color Quiz</title>
</head>
<body>
    <form id="form1" runat="server">
    <header>
    <div class="logo">
        <img src="/Content/images/wordwiselogo.png" class="logo-image"/>
        <a class="logo-text">CIELOES</a>
    </div>

    <div class="header-right">
    <div class="xp">
        <img src='<%= ResolveUrl("~/Content/images/icons/exp.svg") %>' alt="Experience Icon" />
        <asp:Label ID="userxpslabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
    </div>
    <div class="hearts">
        <img src='<%= ResolveUrl("~/Content/images/icons/hearts.svg") %>' alt="Hearts Icon" />
        <asp:Label ID="userheartslabel" runat="server" Text="" Font-Bold="True" style="font-size: 2rem"></asp:Label>
    </div>
</div>

</header>

    <div class="container">
            <asp:Label ID="userxptext" runat="server" Text="Label" Visible="false"></asp:Label>
            <asp:Label ID="scoreLabel" runat="server" Text="Label" Visible="false"></asp:Label>
    <div class="question">
        <asp:Label ID="QuestionLabel" runat="server" Font-Bold="true" Font-Size="X-Large"></asp:Label>
        <asp:Image ID="QuestionImage" runat="server" CssClass="fruit-image" />
       
    </div>
    
    <div class="options-buttons">
        <asp:Panel ID="QuestionPanel" runat="server">
            <asp:RadioButtonList ID="OptionsList" runat="server" OnPreRender="OptionsList_PreRender" Font-Bold="true"></asp:RadioButtonList>
        </asp:Panel>
        
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" CssClass="button" />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        <asp:Button ID="donebtn" runat="server" Text="Go to Lessons" Visible="false" OnClick="donebtn_Click" CssClass="button" />
    </div>
</div>
    </form>
</body>
</html>
