<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Ranking.aspx.cs" Inherits="Lottery.Ranking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .ranking-table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            text-align: center;
        }

            .ranking-table th, .ranking-table td {
                padding: 10px;
                border: 1px solid #ccc;
            }

            .ranking-table th {
                background-color: #007ACC;
                color: white;
            }

            .ranking-table tr:nth-child(even) {
                background-color: #f2f2f2;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server" class="form-signin">


        <h2>抽卡排行榜</h2>
        <asp:GridView ID="gvRanking" runat="server" AutoGenerateColumns="False"
            CssClass="ranking-table">
            <Columns>
                <asp:BoundField DataField="Rank" HeaderText="排名" />
                <asp:BoundField DataField="UserId" HeaderText="使用者帳號" />
                <asp:BoundField DataField="DrawCount" HeaderText="抽卡次數" />
            </Columns>
        </asp:GridView>

    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentJS" runat="server">
</asp:Content>
