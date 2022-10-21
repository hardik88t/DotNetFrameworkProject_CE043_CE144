<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="dotMART.AddProduct" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>dotMART Admin</title>
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
            <!---Navbar start--->
            <div class="navbar navbar-default navbar-fixed-top " role="navigation">
                <div class="container ">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>

                        </button>
                        <a class="navbar-brand" href="/Home.aspx"><span>
                            <img src="/icons/dm03.png" alt="dotMART" height="34" width="120" /></span>
                         </a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="/Home.aspx">Home</a> </li>
                            <li><a href="/AdminHome.aspx">AdminHome</a> </li>
                            <li><a href="About.aspx">About</a> </li>
                            <li><a href="AddProduct.aspx">Add Product</a></li>
                            <li>
                                <asp:Button ID="btnAdminlogout" CssClass="btn btn-default navbar-btn " runat="server" Text="Sign Out" OnClick="btnAdminlogout_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!---navbar end--->


            <div class="container ">
                <div class="container">
            <div class="form-horizontal">
                <br />
                <br />
                <br />
                <h2>Add Product</h2>
                <hr />
                <%--Name--%>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Proudct Name *"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass ="text-danger " runat="server" ErrorMessage="*Product Name is Required !!!" ControlToValidate="txtProductName" ForeColor="Red"></asp:RequiredFieldValidator>


                    </div>
                </div>
                <%--price--%>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Price *"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server">0</asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass ="text-danger " runat="server" ErrorMessage="*Price field is Required" ControlToValidate="txtPrice" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:RangeValidator ID="RangeValidator1" CssClass="text-danger" runat="server" ErrorMessage="*Price must be positive !!" ControlToValidate="txtPrice" MinimumValue="0" MaximumValue="999999999"></asp:RangeValidator>

                    </div>
                </div>
                <%--Price description--%>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="PriceDesc"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtPriceDesc" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <%--category--%>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server" ></asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass ="text-danger " runat="server" ErrorMessage="*Select The Category" ControlToValidate="ddlCategory" ForeColor="Red" Height="0"></asp:RequiredFieldValidator>--%>
                        <%--OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"--%>
                    </div>
                </div>
                <%--quantity--%>
                <div class="form-group">
                    <asp:Label ID="Label20" runat="server" CssClass="col-md-2 control-label" Text="Quantity *"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtQuantity" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass ="text-danger " runat="server" ErrorMessage="*Quantity field is Required" ControlToValidate="txtQuantity" ForeColor="Red"></asp:RequiredFieldValidator>

                    </div>
                </div>
                <%--description--%>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Description"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <%--image upload--%>

                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" CssClass="col-md-2 control-label" Text="Upload Image (Primery)"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="fuImg01" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="fuImg02" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label13" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="fuImg03" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <%--<div class="form-group">
                    <asp:Label ID="Label14" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="fuImg04" CssClass="form-control" runat="server" />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label15" runat="server" CssClass="col-md-2 control-label" Text="Upload Image"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="fuImg05" CssClass="form-control" runat="server" />
                    </div>
                </div>--%>

                <%--image upload--%>


                <%--add product--%>
                <div class="form-group">
                    <div class="col-md-2 "></div>
                    <div class="col-md-6 ">

                        <asp:Button ID="btnAdd" CssClass="btn btn-success " runat="server" Text="ADD Product" OnClick="btnAdd_Click" />

                    </div>
                </div>

            </div>

        </div>

        <div class="container">

            <hr />
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2>Product Report</h2>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="table table-responsive">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField DataField="PID" HeaderText="S.No." />
                                        <asp:BoundField DataField="PName" HeaderText="PName" />
                                        <asp:BoundField DataField="PPrice" HeaderText="Price" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                        <asp:BoundField DataField="CatName" HeaderText="Category" />

                                   <%-- <asp:TemplateField HeaderText="Photo">
                                            <ItemTemplate>
                                                <%-- <img src="Images/ProductImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>" style=" height:150px; width:150px;"/> -->
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>

                                        <%-- <asp:CommandField ShowEditButton="true" />  
                            <asp:CommandField ShowDeleteButton="true" />--%>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
            </div>




        </div>
    </form>
    <!---Footer COntents Start here---->
    <hr />
    <footer>
        <div class="container ">
            <p class="pull-right "><a href="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
            <p class="pull-right "><a href="AdminHome.aspx">Admin Login  </a></p>
            <p>&copy;2022 Hardik & Yash &middot; 
                <a href="Home.aspx">Home</a>
                &middot;<a href="AdminHome.aspx">AdminHome</a>
                &middot;<a href="About.aspx">About</a>

            </p>
        </div>
    </footer>

    <!---Footer COntents End---->
</body>
</html>
