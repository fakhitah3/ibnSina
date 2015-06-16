<%@ Page Title="" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="SearchInstrument.aspx.cs" Inherits="Pengurusan_Makmal.ManageInstrument" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style4
    {
        color: #0033CC;
    }
    .style5
    {
        width: 210px;
    }
    .style6
    {
        width: 485px;
    }
        .auto-style1 {
            width: 153px;
            height: 63px;
        }
        .auto-style2 {
            width: 485px;
            height: 63px;
        }
        .auto-style3 {
            height: 63px;
        }
        .auto-style4 {
            width: 153px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 align="center" class="style4">
        Search Instrument</h2>
<p align="center" class="style4">
</p>
<asp:Panel ID="Panel1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
                </td>
            <td class="auto-style2">
                Search :
                <asp:TextBox ID="txtInstrument" runat="server" Height="20px" Width="133px"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Go" OnClick="Button1_Click1" />
            </td>
            <td class="auto-style3">
                </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="style6">
                <asp:GridView ID="InstrumentDetailsList" runat="server">
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Panel>
</asp:Content>
