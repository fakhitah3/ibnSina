<%@ Page Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="ComplaintAdmin.aspx.cs" Inherits="Admin.ComplaintAdmin" Title="Aduan"%>

<asp:Content ID="complainContent" ContentPlaceHolderID="MainContent" runat="server">
     <h1 class="page-header">Pengurusan Aduan Program</h1>

    <div class="row">

    </div>
    <!-- /.div for table -->

    <div class="row">
        <h4>1. Maklumat Pengguna</h4>
    </div>
    <!-- /.div for user information -->

    <div class="row">
        <h4>2. Maklumat Aduan</h4>
    </div>
    <!-- /.div for complaint information -->

    <div class="row">
        <h4>3. Status Tempahan</h4>
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="statusLabel" runat="server" Text="Status" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="statusList" runat="server">
                        <asp:ListItem>Jenis Aduan</asp:ListItem>
                    </asp:DropDownList>                    
                </div>
            </div>
            <!-- /.div for status -->

            <div class="form-group">
                <asp:Label ID="noteLabel" runat="server" Text="Catatan" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-md-6">
                    <asp:TextBox ID="noteTxtArea" runat="server" TextMode="MultiLine"  Height="57px" Width="225px" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- /.div for note -->
        </div>
    </div>
</asp:Content>
