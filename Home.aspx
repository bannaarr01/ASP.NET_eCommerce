<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BudgetFood | Ecommerce Groecery Store</title>
    <link href="flexslider.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="styleHome.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="JavaScript/modernizr.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="JavaScript/jquery.flexslider.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            InitializeImageSlider();
        });
        function InitializeImageSlider() {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: true,
                directionNav: true,
                itemWidth: "100%",
                itemHeight: 400
            });
        }
    </script>
    <style>
        .txtbox {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
        }

        .auto-style2 {
            width: 401px;
        }

        .auto-style3 {
            width: 395px;
            height: 207px;
        }

        .auto-style4 {
            width: 395px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="header">
        <div class="container">
            <div class="navbar23">
                <div class="row">
                    <div class="col-2">

                        <h1>Your Groceries in
                                <br />
                            A New Style!</h1>
                        <p>
                            From the supermarket to your doorstep.
                        </p>
                        <asp:Button ID="btnExplore" runat="server" CssClass="btn" Text="Explore &#8594;" Width="400px" Font-Size="Larger" Height="40px" />
                    </div>
                    <div class="col-2">
                        <asp:Image ID="ImgHome" runat="server" ImageUrl="~/images/HomeImage.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="categories">
        <div id="main" role="main">
            <div class="container">
                <section class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <asp:Image ID="imgSlide1" runat="server" ImageUrl="~/SliderImages/Slide1.jpg" />
                            </li>
                            <li>
                                <asp:Image ID="imgSlide2" runat="server" ImageUrl="~/SliderImages/Slide2.jpg" />
                            </li>
                            <li>
                                <asp:Image ID="imgSlide3" runat="server" ImageUrl="~/SliderImages/Slide3.jpg" />
                            </li>
                            <li>
                                <asp:Image ID="imgSlide4" runat="server" ImageUrl="~/SliderImages/Slide4.jpg" />
                            </li>
                            <li>
                                <asp:Image ID="imgSlide5" runat="server" ImageUrl="~/SliderImages/Slide5.jpg" />
                            </li>
                            <li>
                                <asp:Image ID="imgSlide6" runat="server" ImageUrl="~/SliderImages/Slide6.jpg" />
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <div class="small-container">

        <h2 class="title">Featured Products</h2>
        <table>
            <tr>
                <td>Categories:
                <asp:DropDownList ID="ddlCategory" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                </asp:DropDownList>
                </td>
            </tr>
        </table>
        <div class="row">

            <asp:DataList ID="dlFP" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table style="background-color: #F1F1F1; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px; box-shadow: initial;">
                        <tr>
                            <td>
                                <asp:Image ID="imgProduct" runat="server"
                                    ImageUrl='<%# Eval("ImageFile") %>' Height="220px" Width="250px" ImageAlign="Middle" />
                            </td>
                        </tr>
                        <tr>
                            <td style="float: left; font-size: large">
                                <asp:Label ID="lblName" runat="server"
                                    Text='<%# Eval("Name") %>' />

                            </td>
                        </tr>
                        <tr>
                            <td style="float: left; font-size: x-large; color: green">$<asp:Label ID="lblPrice" runat="server"
                                Text='<%# String.Format("{0:#.00}",Eval("UnitPrice")) %>' />


                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; align-content: center;">
                                <asp:Button ID="btnPurchase" CssClass="btn" Width="100px" Font-Bold="true" runat="server" Text="Buy" OnClick='<%# "ProductDetails.aspx?ID=" + Eval("ProductID") %>'></asp:Button>

                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                    </table>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <h2 class="title">Budged Foods Survey</h2>

            <table>
                <tr>
                    <td>
                        <h3>How do you find Budged Foods?</h3>
                    </td>
                    <td style="font-size: larger">
                        <asp:RadioButtonList ID="rdlRate" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" Font-Bold="True" OnSelectedIndexChanged="rdlRate_SelectedIndexChanged">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:MultiView ID="mvRate" runat="server">
                            <asp:View ID="vBad" runat="server">

                                <table style="text-align: center; background-color: #FC6099; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <h3>Hi 👋 We will try our best to improve the website!
                                            <br />
                                                What is your name?</h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">First Name:

                                            <asp:TextBox ID="txtFname" runat="server" CssClass="txtbox" Width="300px" AutoPostBack="True" OnTextChanged="txtFname_TextChanged"></asp:TextBox>


                                        </td>
                                        <td style="text-align: center">Last Name:
                                            <asp:TextBox ID="txtLname" runat="server" CssClass="txtbox" Width="300px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <h3>
                                                <asp:Label ID="lblFnameSurvey" runat="server" Visible="False"></asp:Label>
                                            </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <asp:Label ID="lblEmail" runat="server" Visible="False" Text="Email Address"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="txtbox" Width="400px" TextMode="Email" Visible="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <br />
                                            <h3>
                                                <asp:Label ID="lblProblemChoose" runat="server" Visible="False">Please choose the problems that you facing</asp:Label>

                                            </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center; font-size: smaller; align-content: center;">
                                            <asp:CheckBoxList ID="cblProblems" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" Visible="False" OnSelectedIndexChanged="cblProblems_SelectedIndexChanged"></asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Label ID="lblOthers" runat="server" Visible="False">Decripe what problem you are facing:</asp:Label>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:TextBox ID="txtDescPro" runat="server" CssClass="txtbox" Width="400px" TextMode="MultiLine" Rows="4" Visible="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <h3>Do you want to subscribe to our Newsletter?
                                            </h3>
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="rdlNewsletterB" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">

                                                <asp:ListItem>Yes</asp:ListItem>
                                                <asp:ListItem>No</asp:ListItem>

                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:ImageButton ID="imgbtnSendB" runat="server" CssClass="btnsend" ImageUrl="~/images/send.svg" Height="80px" Width="150px" />
                                        </td>
                                    </tr>
                                </table>

                            </asp:View>

                            <asp:View ID="vGood" runat="server">

                                <table style="background-image: url('images/good.png'); width: 620px; height: 400px; margin: 0px auto">
                                    <tr>
                                        <td style="text-align: center" class="auto-style3"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="auto-style2" style="text-align: center">
                                            <h3>Do you want to subscribe to our Newsletter? </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center" class="auto-style4">
                                            <asp:TextBox ID="txtEmailG" runat="server" CssClass="txtbox" Width="300px" TextMode="Email"></asp:TextBox>

                                        </td>
                                        <td style="text-align: center">
                                            <asp:Button ID="btnSendG" runat="server" CssClass="btn" Text="Send" Width="120px" />
                                        </td>
                                    </tr>

                                </table>
                            </asp:View>

                            <asp:View ID="vExcellent" runat="server">
                                <table style="background-image: url('images/Excellent.png'); width: 620px; height: 400px; margin: 0px auto">
                                    <tr>
                                        <td style="text-align: center" class="auto-style3"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="auto-style2" style="text-align: center">
                                            <h3>Do you want to subscribe to our Newsletter? </h3>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center" class="auto-style4">
                                            <asp:TextBox ID="txtEmailE" runat="server" CssClass="txtbox" Width="300px" TextMode="Email"></asp:TextBox>

                                        </td>
                                        <td style="text-align: center">
                                            <asp:Button ID="btnSendE" runat="server" CssClass="btn" Text="Send" Width="120px" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>

                        </asp:MultiView>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</asp:Content>
