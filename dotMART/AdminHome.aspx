<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="dotMART.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminMasterBody" Runat="Server">

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

    </h2>
         <div class="panel panel-primary">
            <div class="panel-heading">
                Our Products</div>
            <div class="panel-body">
                <div class="row" style="padding-top: 50px">
                    <asp:Repeater ID="rptrProducts" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-3 col-md-3">
                                <a href="ProductEdit.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                    <div class="thumbnail">
                                        <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("PName") %>.jpg"
                                            alt="<%# Eval("PName") %>" onerror="src='Images/ProductImages/<%# Eval("PID") %>/<%# Eval("PName") %>.png'"/>
                                        <div class="caption">
                                            <div class="proName">
                                                <%# Eval("PName") %>
                                            </div>
                                            <div class="proPrice">
                                                <span class="proOgPrice">₹
                                                    <%# Eval("PPrice","{0:00}") %>
                                                    <%# Eval("PPriceDesc") %>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="panel-footer">
                Buy Worth ₹799 to get a amazon gift card worth ₹99</div>
        </div>
    <h2><a href="/AddProduct.aspx">Add Product</a>
    </h2>
    </div>
</asp:Content>

