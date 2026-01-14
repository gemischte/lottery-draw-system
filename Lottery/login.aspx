<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Lottery.login" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Signin</title>
    <link href="./assets/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <form id="form1" runat="server" class="form-signin">
        <section class="py-3 py-md-5 py-xl-8">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="mb-5">
                            <h2 class="display-5 fw-bold text-center">Sign in</h2>

                            <p class="text-center m-0">
                                Don't have an account? 
                  <asp:HyperLink
                      runat="server"
                      NavigateUrl="~/register.aspx"
                      CssClass="link-primary text-decoration-none">
                      Sign up
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
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                                                placeholder="name@example.com"></asp:TextBox>
                                            <label for="txtEmail" class="form-label">Email</label>
                                        </div>

                                    </div>
                                    <div class="col-12">

                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
                                                placeholder="Password">
                                            </asp:TextBox>
                                            <label for="txtPassword">Password</label>
                                        </div>

                                    </div>
                                    <div class="col-12">
                                        <div class="row justify-content-between">
                                            <div class="col-6">
                                                <%--<div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" name="remember_me"
                                                        id="remember_me">
                                                    <label class="form-check-label text-secondary" for="remember_me">
                                                        Remember me
                                                    </label>
                                                </div>--%>
                                            </div>
                                            <div class="col-6">
                                                <div class="text-end">
                                                    <a href="#!" class="link-secondary text-decoration-none">Forgot password?</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="d-grid">
                                            <asp:Button ID="btnLogin" runat="server" Text="Sign in" CssClass="w-100 btn btn-lg btn-primary"
                                                OnClick="btnLogin_Click" />
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <asp:Literal ID="Msg" runat="server"></asp:Literal>
    </form>
</body>
</html>
