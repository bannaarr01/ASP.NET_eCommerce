<%@ Page Title="Login" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Website.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LOGIN</title>
    <link rel="stylesheet" href="style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        .auto-style2 {
            background: #fff;
            width: 300px;
            height: 400px;
            position: relative;
            text-align: center;
            padding: 20px 0;
            margin: auto;
            box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            left: 0px;
            top: 0px;
            border-radius: 7px;
        }

        .auto-style7 {
            width: 80%;
            height: 254px;
            margin-left: 27px;
            margin-right: 40px;
            text-align: center;
        }

        .auto-style10 {
            width: 72px;
            height: 40px;
        }

        .auto-style11 {
            width: 136px;
            height: 40px;
        }

        .auto-style12 {
            width: 72px;
            height: 30px;
        }

        .auto-style13 {
            width: 136px;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="accout-page">
        <div class="container">

            <div class="row">

                <div class="col-2">
                    <asp:Image ID="imgBackgroundReg" runat="server" ImageUrl="~/images/supermarket.svg" Width="100%" />
                </div>

                <div class="col-2">
                    <div class="auto-style2">
                        <div class="form-btn">

                            <h3>Login</h3>
                        </div>
                        <div id="LoginForm" runat="server">

                            <table class="auto-style7">

                                <tr>
                                    <td class="auto-style10">Email:</td>
                                    <td class="auto-style11">

                                        <asp:TextBox ID="txtUsernam" runat="server"></asp:TextBox>




                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style12">Password:</td>
                                    <td class="auto-style13">
                                        <asp:TextBox ID="txtPasswd" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="btnLogin" runat="server" Font-Bold="true" CssClass="btn" Text="Login" OnClick="btnLogin_Click" />
                                        <asp:Button ID="btnregister" runat="server" CssClass="btn" Font-Bold="true" OnClick="Button1_Click" Text="Register Now" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">





                                        <asp:Label ID="lblMssg" runat="server" ForeColor="Red"></asp:Label>





                                        <asp:RequiredFieldValidator
                                            Display="Dynamic"
                                            EnableClientScript="false"
                                            ForeColor="Red"
                                            ID="emailValidate1"
                                            runat="server"
                                            ErrorMessage="*Please Enter Email"
                                            ControlToValidate="txtUsernam">
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator
                                            Display="Dynamic"
                                            EnableClientScript="false"
                                            ForeColor="Red"
                                            ID="emailValidate2"
                                            runat="server"
                                            ErrorMessage="*Invalid Email"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ControlToValidate="txtUsernam">
                                        </asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RequiredFieldValidator
                                            Display="Dynamic"
                                            EnableClientScript="false"
                                            ForeColor="Red"
                                            ID="passwordValidate"
                                            runat="server"
                                            ErrorMessage="*Please Enter Password"
                                            ControlToValidate="txtPasswd">
                                        </asp:RequiredFieldValidator>

                                        <br />





                                    </td>
                                </tr>
                            </table>
                            <hr id="indicator" />
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
