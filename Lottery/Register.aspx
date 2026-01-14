<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Lottery.Register" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Register</title>
    <link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <form id="form1" runat="server">
        <section class="py-3 py-md-5 py-xl-8">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="mb-5">
                            <h2 class="display-5 fw-bold text-center">Register</h2>

                            <p class="text-center m-0">
                                Have an account? 
              <asp:HyperLink
                  runat="server"
                  NavigateUrl="~/login.aspx"
                  CssClass="link-primary text-decoration-none">
                  Sign in
              </asp:HyperLink>
                            </p>

                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12 col-lg-10 col-xl-8">
                        <div class="row gy-5 justify-content-center">
                            <div class="col-12 col-md-8 col-lg-6 mx-auto">

                                <div class="row gy-3 overflow-hidden">

                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="userid" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Account"></asp:TextBox>
                                            <label for="userid">Account</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="Username" runat="server" CssClass="form-control" TextMode="SingleLine" placeholder="Username"></asp:TextBox>
                                            <label for="Username">Username</label>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                                            <label for="Password">Password</label>
                                        </div>
                                    </div>

                                    <%--<div class="col-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="ConfirmPassword"></asp:TextBox>
                                            <label for="ConfirmPassword">Confirm Password</label>
                                        </div>
                                    </div>--%>

                                    <div class="col-12">
                                        <div class="d-grid">
                                            <asp:Button ID="Button1" runat="server" Text="Register" CssClass="w-100 btn btn-lg btn-primary"
                                                OnClick="btnRegister_Click" />
                                        </div>
                                    </div>

                                    <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
