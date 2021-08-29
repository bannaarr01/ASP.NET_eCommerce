<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Website.ProductDetails" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>

<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">

    <div>
        <asp:DataList ID="dlProduct" runat="server" RepeatColumns="2" Height="810px" Width="612px">
        <ItemTemplate>
            <table>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageFile") %>' Width="500px" Height="500px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" style="text-align:right">Name:</td>
                    <td class="auto-style5">
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" style="text-align:right">Price:</td>
                    <td class="auto-style5">
                        $<asp:Label ID="lblPrice" runat="server" Text='<%# string.Format("{0:#.00}", Eval("UnitPrice")) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">Description:</td>
                    <td class="auto-style8">
                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("LongDescription") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center">
                        <asp:Button ID="btnShowCart" runat="server" Text="Add to Cart" OnClick="btnShowCart_Click" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    </div>
</asp:content>
