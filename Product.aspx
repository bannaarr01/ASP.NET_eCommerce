<%@ Page Title="Product" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Website.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="style.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <%--Welcome <%=Session["Email"].ToString() %>--%>
        <%--<div style="text-align: right">
           <asp:HyperLink ID="Logout" runat="server"
                NavigateUrl="~/Logout.aspx" Visible="true">Logout</asp:HyperLink>
        </div>--%>

        <asp:TextBox ID="txtProSearch" runat="server" CssClass="btnSearch"></asp:TextBox>
        <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" CssClass="btn" Width="150px" Height="30px"/>
        <asp:DataList ID="DL1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">

            <ItemTemplate>

                <table style="background-color: #F1F1F1; border-radius:12px; width:300px">
                    <tr>
                        <td style="text-align:center">
                            <asp:Image ID="imgProduct" runat="server"
                                ImageUrl='<%# Eval("ImageFile") %>' Height="220px" Width="250px" ImageAlign="Middle" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-size: large">
                            <asp:Label ID="lblName" runat="server"
                                Text='<%# Eval("Name") %>' />

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-size: x-large; color: green">$<asp:Label ID="lblPrice" runat="server"
                            Text='<%# String.Format("{0:#.00}",Eval("UnitPrice")) %>' />


                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; font-size: x-large; color: green">
                            <asp:HyperLink ID="hlProdDetail" runat="server" NavigateUrl='<%# "ProductDetails.aspx?ID="+Eval("ProductID") %>' Text='<%# Eval("ShortDescription") %>'></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>

                        <td>&nbsp;</td>
                    </tr>

                </table>
                <br />

            </ItemTemplate>

        </asp:DataList>

    </div>
</asp:Content>
