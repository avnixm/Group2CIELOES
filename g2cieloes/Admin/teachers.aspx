<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminSide.Master" AutoEventWireup="true" CodeBehind="teachers.aspx.cs" Inherits="g2cieloes.Admin.teachers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main_content" style="margin-left:25%; margin-top:4%; max-width:970px;">
        <div class="table-responsive">
            <asp:GridView ID="teacher" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="admin_fname" HeaderText="First Name" />
                    <asp:BoundField DataField="admin_lname" HeaderText="Last Name" />
                    <asp:BoundField DataField="admin_email" HeaderText="Email" />
                    <asp:BoundField DataField="RegistrationDate" HeaderText="Registration Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="LastLogin" HeaderText="Last Login" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
