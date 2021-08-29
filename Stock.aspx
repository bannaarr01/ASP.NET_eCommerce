<%@ Page Title="Management" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Stock.aspx.cs" Inherits="Stock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Stock management for Budged Food</title>
    <link rel="stylesheet" href="styleHome.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        .auto-style10 {
            background: #fff;
            width: 500px;
            height: 250px;
            position: relative;
            text-align: center;
            padding: 20px 0;
            margin: auto 30px;
            box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            left: 0px;
            top: 0px;
            border-radius: 15px;
        }

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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <h1 style="background-color: blueviolet; color: white; text-align: center">Stock Management</h1>
        <br />
        <div class="container">
            <div class="col-2" style="float: left">
                <div class="auto-style10" style="background-image: linear-gradient(to bottom right, #000099 22%, #6600cc 69%);">
                    <h2 style="color: white">Products Management</h2>
                    <asp:ImageButton ID="imgbtnProMan" runat="server" Width="200px" Height="150px" ImageUrl="~/images/productMan.svg" CssClass="svgFixer" OnClick="imgbtnProMan_Click" />
                </div>
                <br />
            </div>

            <div class="col-2" style="float: right">
                <div class="auto-style10" style="background-image: linear-gradient(to bottom right, #000099 22%, #6600cc 69%);">
                    <h2 style="color: white">Users Management</h2>
                    <asp:ImageButton ID="imgbtnUsrMan" runat="server" Width="200px" Height="150px" ImageUrl="~/images/UsersMan.svg" CssClass="svgFixer" OnClick="imgbtnUsrMan_Click" />
                </div>
                <br />
            </div>
            <div class="container">
            <div class="col-2" style="float: left">
                <div class="auto-style10" style="background-image: linear-gradient(to bottom right, #000099 22%, #6600cc 69%);">
                    <h2 style="color: white">Manage FAQ</h2>
                    <asp:ImageButton ID="ImgbtnFAQ" runat="server" Width="200px" Height="150px" ImageUrl="~/images/question.svg" CssClass="svgFixer"  OnClick="ImgbtnFAQ_Click" />
                </div>
                <br />
            </div>
            <asp:MultiView ID="mvStockOpt" runat="server">
                <asp:View ID="vProMan" runat="server">
                    <table style="border-radius: 20px">
                        <tr style="background-color: antiquewhite">
                            <td style="text-align: center" colspan="2">
                                <h3 class="title">Add new product</h3>
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td rowspan="2" style="padding-left: 50px">
                                <asp:Image ID="imgCheck" runat="server" CssClass="svgFixer" Width="200px" Height="200px" />
                            </td>
                            <td>

                                <asp:FileUpload ID="fuImg" runat="server" Width="200px" />
                                &nbsp;&nbsp;
                                    <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="btn" Width="100px" Height="40px" Font-Bold="true" OnClick="btnUpload_Click" />
                                <asp:Label ID="lblStatus" runat="server" Text="Upload Status:" />
                                <br />
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td></td>
                        </tr>
                        <tr style="background-color: antiquewhite;">
                            <td>Name:</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" Width="200px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="revNAME" runat="server" ControlToValidate="txtName" ErrorMessage="Must be letters only!" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-z\s]+$" />
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td>Short Description:</td>
                            <td>
                                <asp:TextBox ID="txtSDesc" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td>Long Description:</td>
                            <td>
                                <asp:TextBox ID="txtLDesc" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td class="auto-style11">Product Category:</td>
                            <td class="auto-style11">
                                <asp:DropDownList ID="ddlCat" runat="server" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td>Price: </td>
                            <td>
                                <asp:TextBox ID="txtPriceA" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
                                <asp:RangeValidator ID="rvPRICE" runat="server" ControlToValidate="txtPriceA" Type="Integer" MinimumValue="1" MaximumValue="99999" ErrorMessage="Price of products must be between 1 and 99999" ForeColor="Red" Display="Dynamic" />
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td>Quantity: </td>
                            <td>
                                <asp:TextBox ID="txtQtyA" runat="server" Width="200px" TextMode="Number"></asp:TextBox>
                                <asp:RangeValidator ID="rvQTY" runat="server" ControlToValidate="txtQtyA" Type="Integer" MinimumValue="1" MaximumValue="9999" ErrorMessage="Quantity of products must be between 1 and 9999" ForeColor="Red" Display="Dynamic" />
                            </td>
                        </tr>
                        <tr style="background-color: antiquewhite">
                            <td style="text-align: center">
                                <asp:Label ID="lblDupCheck" runat="server" Visible="false"></asp:Label>
                            </td>
                            <td>
                                <asp:ImageButton ID="imgbtnCreateP" runat="server" CssClass="svgFixer" ImageUrl="~/images/Create.svg" Width="70px" Height="70px" OnClick="imgbtnCreateP_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <h3>Search for product</h3>
                            </td>
                            <td class="fa-pull-left" style="text-align: center">
                                <asp:TextBox ID="txtProSearch" runat="server" CssClass="paddingR" Height="40px" Width="319px"></asp:TextBox>
                                <asp:Button ID="btnProSearch" runat="server" CssClass="btn" Font-Bold="true" Height="40px" OnClick="btnProSearch_Click" Text="search" Width="110px" />
                                <asp:Label ID="lblProSearchMessage" runat="server"></asp:Label>
                            </td>
                        </tr>


                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="gvProductMan" runat="server" AllowPaging="true" AutoGenerateColumns="false" BackColor="White"
                                    BorderColor="#336666" BorderStyle="Double" BorderWidth="2px" CellPadding="7" DataKeyNames="ProductID"
                                    GridLines="Horizontal" OnPageIndexChanging="OnPaging" OnRowCancelingEdit="gvProductMan_RowCancelingEdit"
                                    OnRowDeleting="gvProductMan_RowDeleting" OnRowEditing="gvProductMan_RowEditing" OnRowUpdating="gvProductMan_RowUpdating"
                                    ShowHeaderWhenEmpty="true" PageSize="10">
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <%--  <ItemTemplate>
                                                    <asp:LinkButton ID="linkSelected" runat="server" OnClick="linkSelected_Click">Selected</asp:LinkButton>
                                                </ItemTemplate>--%>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product's Image">
                                            <ItemTemplate>
                                                <asp:Image ID="ImgProduct" runat="server" CssClass="rounditAll" ImageUrl='<%# Eval("ImageFile") %>' Width="150px" Height="150px" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Image ID="ImgProduct" runat="server" CssClass="rounditAll" ImageUrl='<%# Eval("ImageFile") %>' Width="150px" Height="150px" />
                                                <br />
                                                <asp:FileUpload ID="fuEdit" runat="server" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Name">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("Name") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <%--<asp:Label runat="server" Text='<%# Eval("Name") %>' />--%>
                                                <asp:TextBox ID="txtProName" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Short Description">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("ShortDescription") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtSDescription" runat="server" Text='<%# Eval("ShortDescription") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Long Description">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("LongDescription").ToString().Substring(0,Math.Min(20,Eval("LongDescription").ToString().Length)) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtLDescription" runat="server" Text='<%# Eval("LongDescription") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Category">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("CategoryID") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <%--<asp:Label ID="lblCat" runat="server" Text='<%# Eval("CategoryID") %>'></asp:Label>--%>
                                                <asp:TextBox ID="txtLCat" runat="server" Text='<%# Eval("CategoryID") %>'></asp:TextBox>

                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("UnitPrice","{0:n2}") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("UnitPrice","{0:n2}") %>'></asp:TextBox>
                                                <asp:RangeValidator ID="rvPRICEedit" runat="server" ControlToValidate="txtPrice" Type="Double" MinimumValue="1.0" MaximumValue="99999.99" ErrorMessage="Price of products must be between 1 and 99999" ForeColor="Red" Display="Dynamic" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Eval("OnHand") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("OnHand") %>'></asp:TextBox>
                                                <asp:RangeValidator ID="rvQTYedit" runat="server" ControlToValidate="txtQty" Type="Integer" MinimumValue="1" MaximumValue="999" ErrorMessage="Quantity of products must be between 1 and 999 and you cannot use fraction number" ForeColor="Red" Display="Dynamic" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Height="32px">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" CommandName="Edit" CssClass="svgFixer" ImageUrl="~/images/edit.svg" ToolTip="Edit" Width="60px" />
                                                <asp:ImageButton runat="server" CommandName="Delete" CssClass="svgFixer" ImageUrl="~/images/delete.svg" ToolTip="Delete" Width="60px" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton runat="server" CommandName="Update" CssClass="svgFixer" ImageUrl="~/images/save.svg" ToolTip="Update" Width="60px" />
                                                <asp:ImageButton runat="server" CommandName="Cancel" CssClass="svgFixer" ImageUrl="~/images/close.svg" ToolTip="Cancel" Width="60px" />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>

                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
