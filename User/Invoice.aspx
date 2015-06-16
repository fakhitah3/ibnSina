<%@ Page Title="" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="IbnSina.Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style4
        {
            color: #0033CC;
        }
        .style5
        {
            height: 33px;
            font-size: medium;
        }
        .style6
        {
            height: 29px;
        }
        .style7
        {
            width: 312px;
            height: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="invoiceContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div class="page-header">
            <h2>Invois Tempahan</h2>
    </div>

    <asp:Panel ID="Panel1" runat="server" Width="919px">
        <table style="width:100%;" align="center">
            <tr>
                <td align="center">
                    <strong>1. USER INFORMATION<br /> </strong>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="UserInfoSql" Height="50px" Width="125px">
                        <Fields>
                            <asp:BoundField DataField="fName" HeaderText="First Name" SortExpression="fName" />
                            <asp:BoundField DataField="lName" HeaderText="Last Name" SortExpression="lName" />
                            <asp:BoundField DataField="icNum" HeaderText="IC Number" SortExpression="icNum" />
                            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                            <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                            <asp:BoundField DataField="dateEndStudies" HeaderText="Date End Studies" SortExpression="dateEndStudies" />
                            <asp:BoundField DataField="dateRegister" HeaderText="Date Register" SortExpression="dateRegister" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="UserInfoSql" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionString2 %>" SelectCommand="SELECT [fName], [lName], [icNum], [address], [phone], [status], [dateEndStudies], [dateRegister] FROM [user] WHERE ([username] = @username)">
                        <SelectParameters>
                            <asp:SessionParameter Name="username" SessionField="CurrentSessionID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <strong>2. RESERVATION INFORMATION<br /> </strong>
                    <asp:DetailsView ID="DetailsView2" runat="server" DataSourceID="ReservationInfoSql" Height="50px" Width="125px">
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="ReservationInfoSql" runat="server"></asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <strong>3. INVOICE INFORMATION</strong><br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <strong>4. PAYMENT DETAILS<br /> </strong><br />
                </td>
            </tr>
            <tr>
                <td align="center" class="style6">
                    <asp:Button ID="Button1" runat="server" Text="Print" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    </form>
</asp:Content>
