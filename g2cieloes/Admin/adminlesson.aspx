<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminSide.Master" AutoEventWireup="true" CodeBehind="adminlesson.aspx.cs" Inherits="g2cieloes.Admin.lessons" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper mt-4" style="margin-left:18%; margin-top:10%; max-width:900px;">
    <div class="main_content">
    <div class="row">
        <div class="col-md-12">
            
            
            <div class="form-group">
                <h2>Add a new lesson.</h2>
                <asp:Label ID="lblMessage" runat="server" Text="Label" CssClass="alert alert-info d-none"></asp:Label>
                <label for="lessonTitle">Lesson Title</label>
                <asp:TextBox ID="lessonTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group" style="padding-bottom:10px;">
                <label for="lessonType">Lesson Type</label>
                <asp:DropDownList ID="lessonType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Colors" Value="colors"></asp:ListItem>
                    <asp:ListItem Text="Fruits" Value="fruits"></asp:ListItem>
                    <asp:ListItem Text="Animals" Value="animals"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="SaveLesson" runat="server" Text="Save Lesson" CssClass="btn btn-primary mb-3" OnClick="SaveLesson_Click" />

            <asp:GridView ID="LessonTable" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" OnRowCommand="LessonTable_RowCommand">
                <Columns>
                    <asp:BoundField DataField="LessonTitle" HeaderText="Lesson Title" />
                    <asp:BoundField DataField="LessonType" HeaderText="Lesson Type" />
                    <asp:BoundField DataField="DateAdded" HeaderText="Date Added" />
                </Columns>
            </asp:GridView>

            <div class="form-group mt-3">
                <label for="question">Add New Question</label>
                <asp:TextBox ID="question" runat="server" CssClass="form-control" placeholder="Add new question"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="getfromdatabasethelessontypethenaddthemhere">Lesson Type</label>
                <asp:DropDownList ID="getfromdatabasethelessontypethenaddthemhere" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <h3>Please enter the choices.</h3>
            <div class="form-group">
                <label for="option1">Option 1</label>
                <asp:TextBox ID="option1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="option2">Option 2</label>
                <asp:TextBox ID="option2" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="option3">Option 3</label>
                <asp:TextBox ID="option3" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group"  style="padding-bottom:10px;">
                <label for="rightanswer">Right Answer</label>
                <asp:TextBox ID="rightanswer" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <asp:Button ID="savequestion" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="savequestion_Click"/>

            <asp:GridView ID="questions" runat="server" CssClass="table table-striped mt-3"></asp:GridView>
        </div>
    </div>
   </div>
</div>
</asp:Content>
