<%@ Page Title="Registration" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Registeration.aspx.cs" Inherits="Registeration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registeration for new user Budged Food!</title>
    <link rel="stylesheet" href="styleReg.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        .auto-style2 {
            text-align: left;
            width: 479px;
            padding-left: 100px;
        }


        .auto-style10 {
            background: #fff;
            width: 620px;
            height: 1150px;
            position: relative;
            text-align: center;
            padding: 20px 0;
            margin: auto 100px;
            box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            left: 0px;
            top: 0px;
            border-radius: 7px;
        }

        .auto-style11 {
            padding-right: 100px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="accout-page">
        <div class="container">

            <div class="row">

                <div class="col-2">
                    <%--<asp:Image ID="imgBackgroundReg" runat="server" ImageUrl="~/images/image1.png" Width="100%" />--%>
                    <asp:AdRotator ID="arAds" runat="server" AdvertisementFile="~/Ad.xml" Height="400px" Width="700px" />
                </div>

                <div class="col-2">
                    <div class="auto-style10">

                        <div id="RegForm" runat="server">
                            <h3>Register
                            </h3>
                            <hr id="indicator" />
                            <table>
                                <tr>
                                    <td class="auto-style2">Email:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtEmailReg" runat="server" TextMode="Email" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ControlToValidate="txtEmailReg" ErrorMessage="You must enter an email*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="EmailChecker" runat="server" ControlToValidate="txtEmailReg" ErrorMessage="Please enter valid email*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Password:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtPasswordReg" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" ControlToValidate="txtPasswordReg" ErrorMessage="You must enter password*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegExpPassword" runat="server"
                                            ErrorMessage="Password length must be at least 8 characters"
                                            ForeColor="Red"
                                            ControlToValidate="txtPasswordReg"
                                            ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,30}$" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Confirm Password:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtCpassword" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredPassConfirm" runat="server" ControlToValidate="txtCpassword" ErrorMessage="You have to confirm your password*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="passwordValid" runat="server" ControlToValidate="txtCpassword" ControlToCompare="txtPasswordReg" ErrorMessage="YOUR PASSWORD DEOSN'T MATCH!" ForeColor="Red" Operator="Equal" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Phone number:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Number" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredPhone" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="You cannot register without your phone number*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="ValidPhone" runat="server"
                                            ForeColor="Red"
                                            ErrorMessage="Please enter valid phone number*"
                                            ControlToValidate="txtPhoneNumber"
                                            ValidationExpression="[0]\d{9,10}$" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">First Name:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtFirstName" runat="server" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFirstname" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Your firstname is required*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="compareNameEmail" runat="server" ControlToValidate="txtFirstName" ControlToCompare="txtEmailReg" ErrorMessage="Your firstname must not same like your email*" ForeColor="Red" Operator="NotEqual" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Last Name:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtLastName" runat="server" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Your lastname is required*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareLnameFname" runat="server" ControlToValidate="txtLastName" ControlToCompare="txtFirstName" ErrorMessage="Your lastname must not same like your firstname*" ForeColor="Red" Operator="NotEqual" Display="Dynamic" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">Address:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtAddress" runat="server" Height="90px" MaxLength="200" TextMode="MultiLine" Width="250px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ErrorMessage="Your address must be between 20 characters to 200 characters"
                                            ControlToValidate="txtAddress"
                                            ValidationExpression="^[a-zA-Z0-9'@&#.\s]{20,200}$" Display="Dynamic" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">State:</td>
                                    <td class="auto-style11">
                                        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" Width="250px" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">City:</td>
                                    <td class="auto-style11">
                                        <asp:DropDownList ID="ddlCity" runat="server" Width="250px">
                                            <asp:ListItem>George Town</asp:ListItem>
                                            <asp:ListItem>Seberang Perai</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">ZipCode:</td>
                                    <td class="auto-style11">
                                        <asp:TextBox ID="txtZCode" runat="server" TextMode="Number" Width="250px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredZIP" runat="server" ControlToValidate="txtZCode" ErrorMessage="Please enter you*" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="text-align: center">
                                        <asp:CheckBox ID="cbTerms" runat="server" AutoPostBack="true" Text="I accept to the FOODBUDGET Terms and Condition" ForeColor="#993399" OnCheckedChanged="cbTerms_CheckedChanged" />
                                    </td>
                                    <td>
                                        <asp:CustomValidator ID="cvUnderstood" runat="server" ForeColor="Red" EnableClientScript="true" ErrorMessage="You must to accept the terms" OnServerValidate="cvUnderstood_ServerValidate"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                                        <asp:Button ID="btnRegister" runat="server" CssClass="btn" Text="Register" Height="40px" Width="150px" OnClick="btnRegister_Click" />
                                    </td>
                                    <td class="auto-style11">
                                        <asp:Button ID="btnClear" runat="server" CssClass="btn" Height="40px" Text="Clear" Width="150px" OnClick="btnClear_Click" />
                                    </td>
                                </tr>
                            </table>
                            <asp:ValidationSummary ID="ValidationSummaryforErrors" runat="server"
                                EnableClientScript="true"
                                DisplayMode="BulletList"
                                ShowMessageBox="True"
                                ShowSummary="false"
                                ForeColor="Red"
                                HeaderText="You must correct these errors:" OnLoad="ValidationSummaryforErrors_Load" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
