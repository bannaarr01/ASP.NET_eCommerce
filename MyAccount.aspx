<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteMaster.master" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Account</title>
    <link rel="stylesheet" href="styleHome.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        .svgFixer {
            outline: none;
            border: none;
        }

        .rounditAll {
            border-radius: 10px;
        }

        .paddingR {
            margin-right: 20px;
            border-radius: 12px;
        }

        .auto-style11 {
            height: 48px;
        }

        .auto-style12 {
            width: 389px;
        }

        .auto-style13 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <h1 style="background-color: blueviolet; color: white; text-align: center">MY ACCOUNT</h1>
        <br />
        <div class="container">
            <div class="col-2" style="float: left">
                <br />
            </div>


            <table style="border-radius: 20px">
                <tr style="background-color: antiquewhite">
                    <td style="text-align: center" colspan="3">
                        <h3 class="title">Customization</h3>
                    </td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td rowspan="3" style="padding-left: 50px">
                        <asp:Image ID="imgCheck" runat="server" CssClass="svgFixer" Width="200px" Height="200px" />
                    </td>
                    <td colspan="2">

                        <asp:FileUpload ID="fuImg" runat="server" Width="200px" />
                        &nbsp;&nbsp;
                                    <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn" Width="100px" Height="40px" Font-Bold="true" OnClick="btnUpload_Click" />
                        <asp:Label ID="lblStatus" runat="server" Text="Upload Status:" />
                        <br />
                    </td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td colspan="2"></td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite;">
                    <td>
                        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn" Width="241px" Height="40px" Font-Bold="true" CausesValidation="False" OnClick="btnChangePassword_Click" />
                    </td>
                    <td class="auto-style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnChangeAddress" runat="server" Text="Change Address" CssClass="btn" Width="229px" Height="40px" Font-Bold="true" CausesValidation="False" OnClick="btnChangeAddress_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnChangePhone" runat="server" Text="Change Phone Number" CssClass="btn" Width="227px" Height="40px" Font-Bold="true" CausesValidation="False" OnClick="btnChangePhone_Click" />
                    </td>
                </tr>
                <tr style="background-color: antiquewhite;">
                    <td>&nbsp;</td>
                    <td class="auto-style12">
                        <asp:MultiView ID="mvCustomization" runat="server">
                            <asp:View ID="vChangePassword" runat="server">

                                <table class="auto-style13">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Password is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Password Dont Match" ForeColor="Red"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnUpdatePassword" runat="server" CssClass="btn" Font-Bold="true" Height="40px" Text="Update Password" Width="241px" OnClick="btnUpdatePassword_Click" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>

                            </asp:View>
                            <asp:View ID="vChangeAddress" runat="server">

                                <table class="auto-style13">
                                    <tr>
                                        <td>Address</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Width="300px" Height="250px"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="EVAdd" runat="server" ControlToValidate="txtAddress" ErrorMessage="Must be between 20 to 200 characters" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{20,200}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnUpdateAddress" runat="server" CssClass="btn" Font-Bold="true" Height="40px" Text="Update Address" Width="241px" OnClick="btnUpdateAddress_Click" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>

                            </asp:View>
                            <asp:View ID="vChangePhone" runat="server">

                                <table class="auto-style13">
                                    <tr>
                                        <td>Phone Number</td>
                                        <td>
                                            <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="[0]\d{9-10}">Please Enter Malaysian Phone Number</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:Button ID="btnUpdatePhoneNumber" runat="server" CssClass="btn" Font-Bold="true" Height="40px" Text="Update Phone Number" Width="241px" OnClick="btnUpdatePhoneNumber_Click" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>

                            </asp:View>
                        </asp:MultiView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite;">
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite;">
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite;">
                    <td>&nbsp;</td>
                    <td class="auto-style12">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite;">
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style11" colspan="2">&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td>&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr style="background-color: antiquewhite">
                    <td style="text-align: center">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">&nbsp;</td>
                    <td class="fa-pull-left" style="text-align: center" colspan="2">&nbsp;</td>
                </tr>


                <tr>
                    <td colspan="3">&nbsp;</td>
                </tr>
            </table>


        </div>
    </div>
</asp:Content>
