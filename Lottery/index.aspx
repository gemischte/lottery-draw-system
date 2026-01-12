<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Lottery.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lottery Login</title>
    <style>
        body {
            background-color: #000;
            color: white;
            font-family: Arial, sans-serif;
        }

        .container {
            text-align: center;
            margin-top: 100px;
        }

        .logo {
            width: 200px;
            height: auto;
            margin-bottom: 30px;
        }

        .btn {
            display: block;
            width: 150px;
            margin: 10px auto;
            padding: 12px;
            font-size: 16px;
            background-color: #fff;
            color: #000;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- 圖片 -->
            <img src="https://png.pngtree.com/png-vector/20221222/ourmid/pngtree-super-cute-cartoon-vector-bear-png-image_6504049.png" alt="Logo" class="logo" />

            <!-- 登入與註冊按鈕 垂直排列 -->
            <asp:Button ID="btnLogin" runat="server" Text="登入" CssClass="btn" PostBackUrl="~/login.aspx" OnClick="btnLogin_Click" />
            <asp:Button ID="btnRegister" runat="server" Text="註冊"  PostBackUrl="~/register.aspx" CssClass="btn" />
        </div>
    </form>
</body>
</html>
