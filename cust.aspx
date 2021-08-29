<%@ Page Title="Customer Details" MasterPageFile="~/SiteMaster.master" Language="C#" AutoEventWireup="true" CodeFile="cust.aspx.cs" Inherits="cust" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="CSS/siteFaq.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <asp:HyperLink ID="hlBack" runat="server" Style="float: right; margin-right: 50px"
            Visible="false"
            NavigateUrl="~/cust.aspx">Go Back</asp:HyperLink>
        <table class="auto-style1">
            <tr>
                <td>
                    <h3 style="text-align: center">CUSTOMER DETAILS</h3>
                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <asp:TextBox ID="txtSearch" runat="server" BackColor="GhostWhite"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" BackColor="Tan" ForeColor="black" Font-Bold="True" />
            <asp:Label ID="lblRecord" runat="server"></asp:Label>
        </div>
    </div>

    <br />
    <div>
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSourceCust" DataKeyNames="Email" CellPadding="6"
            ForeColor="Black" GridLines="None" BackColor="LightGoldenrodYellow"
            BorderColor="Tan" BorderWidth="5px"
            AllowPaging="True" OnPageIndexChanging="gvCustomers_PageIndexChanging" Style="margin-left: 70px" Width="90%" OnSelectedIndexChanged="gvCustomers_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>

                <asp:CommandField ShowSelectButton="True" />

                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />

                <asp:BoundField DataField="isAdmin" HeaderText="Permission" SortExpression="isAdmin" />

            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <br />
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCust" runat="server" ConnectionString="<%$ ConnectionStrings:Grocery %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>


    <br />

</asp:Content>
