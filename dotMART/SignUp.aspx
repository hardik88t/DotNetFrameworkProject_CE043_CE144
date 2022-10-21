<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="dotMART.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Custome.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container ">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>

                        </button>
                        <a class="navbar-brand" href="/Home.aspx"><span>
                            <img src="icons/dm03.png" alt="dotMART" height="34" width="120" /></span>
                        </a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <l><a href="/Home.aspx">Home</a> </l>
                            <li><a href="/About.aspx">About</a> </li>
                            <li>
                                <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                    Cart&nbsp;<span class="badge " id="pCount" runat="server"></span></button>
                                <li class="active" id="btnSignUP" runat="server"><a href="SignUp.aspx">SignUp</a> </li>
                                <li id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a> </li>
                                <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn " runat="server" Text="Sign Out" OnClick="btnlogout_Click" />
                                <asp:Button ID="btnUser" CssClass="btn btn-link navbar-btn " runat="server" Text="" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <!---signup page--->
            <div class="center-page">
                <br />
                <br />
                <br />
                <br />
                <label class="col-xs-11">UserName:</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="txtUname" runat="server" Class="form-control" placeholder="Enter Your UserName"></asp:TextBox>
                </div>


                <label class="col-xs-11">Password:</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control" placeholder="Enter Your password"></asp:TextBox>
                </div>


                <label class="col-xs-11">Confirm Password:</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="txtCPass" runat="server" TextMode="Password" Class="form-control" placeholder="Enter Your Confirm password"></asp:TextBox>
                </div>

                <label class="col-xs-11">Your Full Name:</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="txtName" runat="server" Class="form-control" placeholder="Enter Your Name"></asp:TextBox>
                </div>


                <label class="col-xs-11">Email:</label>
                <div class="col-xs-11">
                    <asp:TextBox ID="txtEmail" runat="server" Class="form-control" placeholder="Enter Your Email"></asp:TextBox>
                </div>
                <label class="col-xs-11"></label>
                <div class="col-xs-11">
                    <asp:Button ID="txtsignup" Class="btn btn-success" runat="server" Text="SignUP" OnClick="txtsignup_Click" />
                    <br />
                    <br />
                    <asp:Label class="col-xs-11" ID="lblMsg" runat="server" Text="" Font-Size="X-Large"></asp:Label>
                </div>
            </div>
            <!---signup page end--->
            <br />
            <br />
        </div>
        <!---Footer Contents Start here---->
        <hr />
        <footer>
            <div class="container ">
                <p class="pull-right "><a href="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                <p class="pull-right "><a href="AdminHome.aspx">Admin Login  </a></p>
                <p>
                    &copy;2022 Hardik & Yash &middot; 
                <a href="Home.aspx">Home</a>
                    &middot;<a href="About.aspx">About</a>
                </p>
            </div>
        </footer>
        <!---Footer COntents End---->
    </form>
</body>
</html>
