﻿<%@ Page Title="Leaderboards" Language="C#" MasterPageFile="~/Sidebar.Master" AutoEventWireup="true" CodeBehind="leaderboards.aspx.cs" Inherits="g2cieloes.leaderboards" %>
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
        <div class="table-container leaderboard-container">
            <table style="width: 100%;">
            <thead>
                <tr>
                <th>RANK</th>
                <th>USERNAME</th>
                <th>SCORE</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <td>1</td>
                <td>Zinzu Chan Lee</td>
                <td>5000</td>
                </tr>

                    <tr>
                    <td> 2 </td>
                    <td>Zinzuedere</td>
                    <td> 4500 </td>
                    <td>
                </tr>
                
                <tr>
                    <td> 3 </td>
                    <td>Zinzu Chasq</td>
                    <td> 4000 </td>
                    <td>
                </tr>
            
                <tr>
                <td> 4 </td>
                <td>Zinzu cruz Lee</td>
                <td> 3500 </td>
                <td>
            </tr>
            
            <tr>
                <td> 5 </td>
                <td>Zinzu lim</td>
                <td> 3200 </td>
                <td>
            </tr>
        
            <tr>
            <td> 6 </td>
            <td>Zinzu Chan qew</td>
            <td> 3000 </td>
            <td>
        </tr>
            
            <tr>
                <td> 7 </td>
                <td>Zinzu Chan Ljaksffbee</td>
                <td> 2800 </td>
            <td>
                </tr>
                
                <tr>
                    <td> 8 </td>
                    <td>Zian efr Lee</td>
                    <td> 2700 </td>
                    <td>
                </tr>
                
                    <tr>
                    <td> 9 </td>
                    <td>Zie pask</td>
                    <td> 2600 </td>
                    <td>
                </tr>

                <tr>
                <td> 10 </td>
                <td>Zinzu Chan L ree</td>
                <td> 2500 </td>
                <td>
                </tr>

            <tr>
                <td> 11 </td>
                <td>Zinzu Chae</td>
                <td> 2300 </td>
                <td>
            </tr>

            <tr>
                <td> 12 </td>
                <td>Zinee</td>
                <td> 2200 </td>
                <td>
            </tr>
            <tr>
                <td> 13 </td>
                <td>Zian Lee</td>
                <td> 2100 </td>
                <td>
            </tr>
            <tr>
                <td> 14 </td>
                <td>Zinzu Che</td>
                <td> 2000 </td>
                <td>
            </tr>

            <tr>
                <td> 15 </td>
                <td>Zin Lee</td>
                <td> 1900 </td>
                <td>
            </tr>

            <tr>
                <td> 16 </td>
                <td>Zinzu Chan</td>
                <td> 1700 </td>
                <td>
            </tr>

            <tr>
                <td> 17 </td>
                <td>Zinzu ee</td>
                <td> 1600 </td>
                <td>
            </tr>

            <tr>
                <td> 18 </td>
                <td>Zinze</td>
                <td> 1500 </td>
                <td>
            </tr>

            <tr>
                <td> 19 </td>
                <td>Z Chan Lee</td>
                <td> 1400 </td>
                <td>
            </tr>

            <tr>
                <td> 20 </td>
                <td>Zinzu Lee</td>
                <td> 1200 </td>
                <td>
            </tr>
                            
                    </tbody>
                </table>
           
            </div>
        </div> 
        </div>
         
</section>
</asp:Content>
