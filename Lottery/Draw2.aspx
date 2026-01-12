<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Draw2.aspx.cs" Inherits="Lottery.Draw2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server" class="form-signin">

        <h1>Lottery</h1>
        <p class="lead"></p>

        <br />
        <br />
        <asp:Image ID="imgCard" runat="server" Width="200px" Visible="false" />
        <br />
        <asp:Label ID="lblCardName" runat="server" Font-Bold="true" />

        <p class="lead">
            <asp:Button ID="btnDraw" runat="server" Text="抽卡！" OnClick="btnDraw_Click" CssClass="btn btn-lg btn-secondary fw-bold border-white bg-white" />
        </p>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentJS" runat="server">
</asp:Content>
