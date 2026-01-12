<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Collection.aspx.cs" Inherits="Lottery.Collection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <style>
        .card-container {
            display: inline-block;
            padding: 10px;
            margin: 10px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
            transition: transform 0.2s;
        }

            .card-container:hover {
                transform: scale(1.05);
            }

        .rarity-1 {
            border: 2px solid gray;
        }

        .rarity-2 {
            border: 2px solid blue;
            box-shadow: 0 0 15px blue;
        }

        .rarity-3 {
            border: 2px solid purple;
            box-shadow: 0 0 20px gold;
        }

        .card-image {
            width: 120px;
            height: 160px;
            border-radius: 8px;
        }

        .card-name {
            font-weight: bold;
            margin-top: 5px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

        <asp:TextBox ID="txtSearch" runat="server" placeholder="輸入卡片名稱關鍵字" />
        <asp:Button ID="btnSearch" runat="server" Text="搜尋" OnClick="btnSearch_Click" />

        <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
            <asp:ListItem Text="依抽卡時間" Value="DrawTime" />
            <asp:ListItem Text="依稀有度" Value="Rarity" />
        </asp:DropDownList>
        <asp:Repeater ID="rptCards" runat="server">
            <ItemTemplate>
                <div class='card-container rarity-<%# Eval("Rarity") %>'>
                    <img src='<%# Eval("ImagePath") %>' class="card-image" />
                    <div class="card-name">
                        <%# Eval("Name") %>（R<%#Eval("Rarity") %>）
                    </div>
                    <small><%# Eval("DrawTime", "{0:yyyy/MM/dd HH:mm}")
                    %></small>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </form>

</body>
</html>
