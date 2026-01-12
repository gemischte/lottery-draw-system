<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Lottery.login" %>




<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Signin Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin">
  <form id="form1" runat="server" class="form-signin">
 <img class="mb-4" src="./assets/brand/bootstrap-logo.svg" alt="" width="72" height="57" />
 <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
 <div class="form-floating mb-3">
 <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
placeholder="name@example.com"></asp:TextBox>
 <label for="txtEmail">Email address</label>
 </div>
 <div class="form-floating mb-3">
 <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
placeholder="Password"></asp:TextBox>
 <label for="txtPassword">Password</label>
 </div>
 <div class="checkbox mb-3">
 <label>
 <asp:CheckBox ID="chkRemember" runat="server" /> Remember me
 </label>
 </div>
 <asp:Button ID="btnLogin" runat="server" Text="Sign in" CssClass="w-100 btn btn-lg btn-primary" OnClick="btnLogin_Click1" />
 <p class="mt-5 mb-3 text-muted">&copy; 2017–2025</p>
 </form>
</main>


    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <asp:Literal ID="Msg" runat="server"></asp:Literal>
<%--      <script>
          Swal.fire({
              title: "Custom width, padding, color, background.",
              width: 600,
              padding: "3em",
              color: "#716add",
              background: "#fff url(/images/trees.png)",
              backdrop: `
                        rgba(0,0,123,0.4)
                        url("/images/nyan-cat.gif")
                        left top
                        no-repeat
                        `
          });
      </script>--%>

  </body>
</html>
    

