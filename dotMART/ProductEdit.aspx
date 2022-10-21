<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ProductEdit.aspx.cs" Inherits="dotMART.ProductEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminMasterBody" runat="server">
 <br />
    <br />
    <br />
    <br />
    <div class="text-center">

    <h2>Welcome Admin
    </h2>
    <h2>
        <a href="/Home.aspx">Home</a>&nbsp;&nbsp;
        <a href="/AdminHome.aspx">AdminHome</a>&nbsp;&nbsp;
        <a href="/AddProduct.aspx">AddProduct</a>&nbsp;&nbsp;
        <a href="/About.aspx">About</a>
        ____________________________________________
    </h2>
    </div>
    <%--    <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
        Cart <span id="CartBadge" runat="server" class="badge">0</span>
    </button>--%>
    <button id="btnDelete" runat="server" class="btn btn-danger navbar-btn pull-right" onserverclick="btnSave_ServerClick" type="button">
        Delete
    </button>
    <button id="btnSave" runat="server" class="btn btn-primary navbar-btn" onserverclick="btnDelete_ServerClick" type="button">
        Save
    </button>
    <br />
    <div style="padding-top: 50px">


        <!--- Success Alert --->
        <div id="divSuccess" runat="server" class="alert alert-success alert-dismissible fade in h4">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Success! </strong>Item successfully added to cart.&nbsp;<a href="Cart.aspx">View Cart</a>
        </div>
        <!--- Success Alert --->

        <div class="col-md-5">
            <div style="max-width: 320px" class="thumbnail">

                <%--   for proImage slider--%>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <%--<li data-target="#carousel-example-generic" data-slide-to="3"></li>--%>
                        <%--<li data-target="#carousel-example-generic" data-slide-to="4"></li>--%>

                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <asp:Repeater ID="rptrImage" runat="server">
                            <ItemTemplate>
                                <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
                                    <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Images/ImageNotAvailable.png'">
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <%--  for proimage slider ending--%>
            
            </div>
        </div>
        <div class="col-md-5">
            <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound">
                <ItemTemplate>
                    <div class="divDet1">
                        <h1 class="proNameView"><%# Eval("PName") %> </h1>                        

                        <span class="proOgPriceView">Rs.<%#Eval("PPrice","{0:c}") %> <b>&nbsp;<%# Eval("PPriceDesc") %></b> </span>
                    </div>
                   <br /> 
                    <div class="divDet1">
                        <asp:Button ID="btnAddtoCart" CssClass="mainButton" runat="server" Text="ADD TO CART" OnClick="btnAddtoCart_Click" />
                        <asp:Label ID="lblError" CssClass="text-danger " runat="server"></asp:Label>

                    </div>
                    <div class="divDet1">
                        <h5 class="h5size"><b>Product Description</b></h5>
                        <p><%#Eval("PDescription") %>          </p>
                    </div>

                    <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PcategoryID") %>' />

                </ItemTemplate>
            </asp:Repeater>

        </div>

    </div>
</asp:Content>
