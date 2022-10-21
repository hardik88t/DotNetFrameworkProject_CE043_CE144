<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="dotMART.Home" %>
<%--<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="dotMART.Home" %>--%>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="HomeBody" ContentPlaceHolderID="UserMasterBody" runat="server">
    <br />
    <br /><br /><br />
    <asp:Label ID="lblSuccess" runat="server" CssClass="text-success">HEY</asp:Label>

    <!---Footer COntents Start here---->
    <hr />
    <br />
    <br />
    <br />
</asp:Content>--%>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>dotMART</title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

    </script>
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
                        <li class="active"><a href="/Home.aspx">Home</a> </li>
                        <li><a href="/About.aspx">About</a> </li>
                        <li>
                            <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Cart&nbsp;<span class="badge " id="pCount" runat="server"></span></button>
                            <li id="btnSignUp" runat="server"><a href="SignUp.aspx">SignUp</a> </li>
                            <li id="btnSignIn" runat="server"><a href="SignIn.aspx">SignIn</a> </li>
                            <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn " runat="server" Text="Sign Out" OnClick="btnlogout_Click" />
                            <asp:Button ID="btnUser" CssClass ="btn btn-link navbar-btn " runat="server" Text="" OnClick="btnUser_Click"/>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <!---image slider---->
        <div class="container">
            <br /><br /><br />
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="ImgSlider/s01.jpg" alt="Los Angeles" style="width: 100%;">
                        <div class="carousel-caption" style="background: hsla(0, 11%, 89%, 0.5);border:solid 2px white;border-radius:15px 15px">
                            <h3>
                                Freash Vegetables & Fruits</h3>
                            <p>
                                Amazon Coupon worth 100rs</p>
                            <p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="ImgSlider/s02.jpg" alt="Chicago" style="width: 100%;">
                        <div class="carousel-caption" style="background: hsla(0, 11%, 89%, 0.5);border:solid 2px white;border-radius:15px 15px">
                            <h3>
                                Mordern Kitchen/Home Tools</h3>
                            <p>
                                Coupon worth 55rs</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="ImgSlider/s03.jpg" alt="New york" style="width: 100%;">
                        <div class="carousel-caption" style="background: hsla(0, 11%, 89%, 0.5);border:solid 2px white;border-radius:15px 15px">
                            <h3>
                                New Offers On Many Products</h3>
                            <p>
                                upto 33% Off</p>
                        </div>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left">
                </span><span class="sr-only">Previous</span> </a><a class="right carousel-control"
                    href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                    </span><span class="sr-only">Next</span> </a>
            </div>
        </div>
        <!---image slider End---->
    </div>


    <!---Middle Contents start---->
    <hr />
    <div class="container center ">
        <div class="row ">
            <div class="col-lg-4">
                <img class="img-circle " src="Images/vegs.jpg" alt="thumb" width="140" height="140" />
                <h2>
                    Vegetables</h2>
                <p>
                    Our Store Supplies Freash and Healthy Vegetables Directly From The Farm.</p>
                <p>
                    <a class="btn btn-default " href="#" role="button">View More &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-circle " src="Images/kitchen.jpg" alt="thumb" width="140" height="140" />
                <h2>
                    Kitchen Tools</h2>
                <p>
                    Our Store Supplies Daily Necessary Tools with Great Quality. We ensure of Quality of our Products.</p>
                <p>
                    <a class="btn btn-default " href="#" role="button">View More &raquo;</a></p>
            </div>
            <div class="col-lg-4">
                <img class="img-circle " src="Images/other.jpg" alt="thumb" width="140" height="140" />
                <h2>
                    Other</h2>
                <p>
                    Our Store Supplies Other Necessary Things for kitchen and daily needs. We ensure of Quality of our Products.
                </p>
                <p>
                    <a class="btn btn-default " href="#" role="button">View More &raquo;</a></p>
            </div>
        </div>



        <div class="panel panel-primary">
            <div class="panel-heading">
                Our Products</div>
            <div class="panel-body">
                <div class="row" style="padding-top: 50px">
                    <asp:Repeater ID="rptrProducts" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-3 col-md-3">
                                <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                    <div class="thumbnail">
                                        <%--<img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("PName") %>.jpg %>"
                                        --%>
                                        <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("PName") %>.jpg"
                                            alt="<%# Eval("PName") %>" onerror="src='Images/ProductImages/<%# Eval("PID") %>/<%# Eval("PName") %>.png'"/>
                                        <div class="caption">
                                            <div class="proName">
                                                <%# Eval("PName") %>
                                            </div>
                                            <div class="proPrice">
                                                <span class="proOgPrice">₹
                                                    <%# Eval("PPrice","{0:00}") %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                        <%--<ItemTemplate>
                            <div class="col-sm-3 col-md-3">
                                <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                    <div class="thumbnail">
                                        <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention")" %>"
                                            alt="<%# Eval("ImageName") %>" />
                                        <div class="caption">
                                            <div class="probrand">
                                                <%# Eval ("BrandName") %>
                                            </div>
                                            <div class="proName">
                                                <%# Eval ("PName") %>
                                            </div>
                                            <div class="proPrice">
                                                <span class="proOgPrice">
                                                    <%# Eval ("PPrice","{0:0,00}") %>
                                                </span>
                                                <%# Eval ("PSelPrice","{0:c}") %>
                                                <span class="proPriceDiscount">(<%# Eval("DiscAmount","{0:0,00}") %>
                                                    off) </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>--%>
                    </asp:Repeater>
                </div>
            </div>
            <div class="panel-footer">
                Buy Worth ₹799 to get a amazon gift card worth ₹99</div>
        </div>
    </div>
    </div>
    <!---Middle COntents End---->

    <!---Footer COntents Start here---->
    <hr />
     <footer>
        <div class="container ">
            <p class="pull-right "><a href="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
            <p class="pull-right "><a href="AdminHome.aspx">Admin Login  </a></p>
            <p>&copy;2022 Hardik & Yash &middot; 
                <a href="Home.aspx">Home</a>
                &middot;<a href="About.aspx">About</a>
            </p>
        </div>
     </footer>
    <!---Footer COntents End---->
    </form>
</body>
</html>
