<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Lottery.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>科技感註冊頁面</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #0f0f0f;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #00ffff;
            overflow: hidden;
        }

        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 350px;
            transform: translate(-50%, -50%);
            padding: 40px;
            background-color: rgba(20, 20, 30, 0.9);
            box-shadow: 0 0 20px #00ffff;
            border-radius: 12px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #00ffff;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #111;
            border: 1px solid #00ffff;
            border-radius: 5px;
            color: #00ffff;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #00ffff;
            color: #000;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #00bbbb;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            color: #ff4081;
        }

        /* 滑鼠跟隨光點 */
        #cursor {
            position: fixed;
            width: 15px;
            height: 15px;
            background-color: #00ffff;
            border-radius: 50%;
            pointer-events: none;
            box-shadow: 0 0 20px #00ffff;
            z-index: 9999;
        }
    </style>
</head>
<body>
    <div id="cursor"></div>
    <form id="form1" runat="server">
        <div class="container">
            <h2>會員註冊</h2>

            <asp:Label ID="Account" runat="server" Text="帳號(Account)"></asp:Label>
            <asp:TextBox ID="userid" runat="server" CssClass="textbox" TextMode="SingleLine"></asp:TextBox>

            <asp:Label ID="Username_Label" runat="server" Text="用戶名稱(Username)"></asp:Label>
            <asp:TextBox ID="Username" runat="server" CssClass="textbox" TextMode="SingleLine"></asp:TextBox>

            <asp:Label ID="Password_Label" runat="server" Text="密碼(Password)"></asp:Label>
            <asp:TextBox ID="Password" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>

            <%-- 可加上確認密碼 --%>
            <%--<asp:Label ID="Confirm_Password_Label" runat="server" Text="確認密碼"></asp:Label>
            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>--%>

            <asp:Button ID="Button1" runat="server" Text="註冊" CssClass="btn" OnClick="Button1_Click1" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </div>
    </form>

    <!-- 滑鼠光點跟隨腳本 -->
    <script>
        const cursor = document.getElementById('cursor');
        document.addEventListener('mousemove', (e) => {
            cursor.style.left = e.pageX + 'px';
            cursor.style.top = e.pageY + 'px';
        });
    </script>
</body>
</html>
