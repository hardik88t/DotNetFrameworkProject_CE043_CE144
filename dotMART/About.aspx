<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="dotMART.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <title>About Us</title>
    <style>
        #repo {
            border: solid 3px red;
            border-radius: 4px 4px;
            /*color:black;*/
            font-size: 18px;
            background-color: ivory;
            margin: 2px;
            padding: 3px;
        }

            #repo:hover {
                background-color: honeydew;
            }

        .jumbotron {
            background-color: #f4511e;
            color: #fff;
            padding: 100px 25px;
        }

        .container-fluid {
            padding: 60px 50px;
        }

        .bg-grey {
            background-color: #f6f6f6;
        }

        .logo-small {
            color: #f4511e;
            font-size: 50px;
        }

        .logo {
            color: #f4511e;
            font-size: 200px;
        }

        @media screen and (max-width: 768px) {
            .col-sm-4 {
                text-align: center;
                margin: 25px 0;
            }
        }
        #hero{
            margin-top:70px;
        }
    </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[



// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="UserMasterBody" runat="server">

    <br />
    <br />
    <br />

    <div id="hero" class="jumbotron text-center">
        <h1>My Online Grocery Website</h1>
        <p></p>
        <form class="form-inline">
            <div class="input-group">
            </div>
        </form>
    </div>

    <!-- Container (About Section) -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-8">
                <h2>About Us 😄</h2>
                <h4>dotMART</h4>
                <p>
                    We are a Online Store which sell Grocery and 
          Other essentials to our customer by Internet.
          Our focus is towards provideing best quality experience and healthy,
          quality products to our customers.
                </p>
                <p>We deliver in most part of Gujarat and Maharashtra.</p>
                <%--<button  id="btn11" runat="server" onclick="btn11_onclick()">Get in Touch</button>--%>
                <p><a id="repo" href="https://github.com/hardik88t/dotMART" title="dotMART" target="_blank">dotMART</a></p>

            </div>
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-signal logo"></span>
            </div>
        </div>
    </div>

    <div class="container-fluid bg-grey">
        <div class="row">
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-globe logo"></span>
            </div>
            <div class="col-sm-8">
                <h2>Our Values</h2>
                <h4><strong>MISSION:</strong> Our mission lorem ipsum..</h4>
                <p><strong>VISION:</strong> Our vision Lorem ipsum..</p>
            </div>
        </div>
    </div>

    <!-- Container (Services Section) -->
    <div class="container-fluid text-center">
        <h2>SERVICES</h2>
        <h4>What we offer</h4>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-off logo-small"></span>
                <h4>POWER</h4>
                <p>Lorem ipsum dolor sit amet..</p>
            </div>
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-heart logo-small"></span>
                <h4>LOVE</h4>
                <p>Lorem ipsum dolor sit amet..</p>
            </div>
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-lock logo-small"></span>
                <h4>JOB DONE</h4>
                <p>Lorem ipsum dolor sit amet..</p>
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-leaf logo-small"></span>
                <h4>GREEN</h4>
                <p>Lorem ipsum dolor sit amet..</p>
            </div>
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-certificate logo-small"></span>
                <h4>CERTIFIED</h4>
                <p>Lorem ipsum dolor sit amet..</p>
            </div>
            <div class="col-sm-4">
                <span class="glyphicon glyphicon-wrench logo-small"></span>
                <h4 style="color: #303030;">HARD WORK</h4>
                <p>Lorem ipsum dolor sit amet..</p>
            </div>
        </div>
    </div>

    <footer class="container-fluid text-center">
        <a href="#hero" title="To Top">
            <span class="glyphicon glyphicon-chevron-up"></span>
        </a>
        <p>
            Made By <a href="https://github.com/hardik88t" title="hardik88t" target="_blank">hardik88t</a> &
            <a href="https://github.com/yash-255" title="hardik88t" target="_blank">yash</a>
        </p>
    </footer>
</asp:Content>



