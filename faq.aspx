<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="faq.aspx.cs" Inherits="faq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="CSS/siteFaq.css" rel="stylesheet" />
    <link href="CSS/bootstrap.min%20-%20Copy.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="Script/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".Answer").hide();

            $(".Question").click(function () {
                $(this).siblings(".Answer").toggle(300);
            });

        });

    </script>
    <style type="text/css">
        .auto-style1 {
            height: 46px;
            width: 50%;
            table-layout: fixed;
            text-align: center;
            background-color: lightpink;
        }



        .auto-style2 {
            height: 46px;
            width: 50%;
            /*background-image:url('/Images/faq.svg');*/
            table-layout: fixed;
            text-align: center;
            background-color: lightsalmon;
        }

        .auto-style3 {
            width: 100%;
            height: 333px;
            table-layout: fixed;
        }

        .faqImag {
            height: 250px;
            width: 250px;
            /*margin-left:50px;*/
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>



        <table cellpadding="0" cellspacing="0" class="auto-style3">
            <tr>
                <td class="auto-style2">
                    <%-- <asp:Image  ImageUrl="~/Images/faq.svg" Height="200px" Width="200px"  />--%>
                    <img src="Images/faq.svg" class="faqImag" />

                </td>
                <td class="auto-style1">
                    <img src="Images/faq2.svg" class="faqImag" />
                </td>
            </tr>
        </table>


        <br />


        <div>
            <ol>
                <asp:Repeater ID="rpFaq" runat="server">
                    <ItemTemplate>
                        <div>
                            <div class="Question" style="background-color: #eee">
                                <button type="button" class="btn"><%# Eval("Question") %></button></div>
                            <%--<div class ="Question" ><%# Eval("Question") %></div>--%>


                            <div class="Answer"><%# Eval("Answer") %></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </ol>
        </div>



        <br />

        <%--    CONTACT FORM--%>

        <div class="container" id="contactBox">
            <div class="card-header">
                <h2>Contact US</h2>
                <asp:Label ID="lblMssg" runat="server" Text=""></asp:Label>
                <div class="form-group">
                    <label for="txtName">
                        Name:</label>
                    <div>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ForeColor="Red"
                            ID="RequiredName"
                            runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Name is required"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtEmail">
                        Email:</label>
                    <div>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            Display="Dynamic"
                            ForeColor="Red"
                            ID="RequiredEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required"
                            Text="*">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            Display="Dynamic"
                            ForeColor="Red"
                            ID="RegexEmail"
                            runat="server"
                            ErrorMessage="Invalid Email"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail"
                            Text="*">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtSubject">
                        Subject:</label>
                    <div>
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ForeColor="Red"
                            ID="RequiredSubject"
                            runat="server"
                            ControlToValidate="txtSubject"
                            ErrorMessage="Subject is required"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPhone">
                        Phone Number:</label>
                    <div>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ForeColor="Red"
                            ID="RequiredPhone"
                            runat="server"
                            ControlToValidate="txtPhone"
                            ErrorMessage="Phone is required"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtComments">
                        Comment:</label>
                    <div>
                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ForeColor="Red"
                            ID="ReqComment"
                            runat="server"
                            ControlToValidate="txtComments"
                            ErrorMessage="Comment is required"
                            Text="*">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
                <div class="form-row">
                    <asp:Button ID="btnCntact" runat="server" Text="Send" Style="margin-top: 8px"
                        CssClass="btn btn-primary btn-block" OnClick="btnCntact_Click" />
                    <br />
                    <br />

                    <asp:ValidationSummary
                        HeaderText="Please fix the following errors"
                        ForeColor="Red"
                        ID="ValidationSummaryConCat"
                        runat="server" Style="text-align: center" />

                </div>
            </div>
        </div>



    </div>
</asp:Content>
