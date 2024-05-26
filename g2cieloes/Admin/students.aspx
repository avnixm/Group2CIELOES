<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminSide.Master" AutoEventWireup="true" CodeBehind="students.aspx.cs" Inherits="g2cieloes.Admin.students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrapper">

        <div class="main_content" style="margin-left:25%; margin-top:4%; max-width:970px;">
            <div class="table-responsive" >
            <asp:GridView ID="student" runat="server" OnSelectedIndexChanged="student_SelectedIndexChanged" CssClass="table table-striped"></asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
