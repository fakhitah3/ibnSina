<%@ Page Language="C#" Title="Penyelenggaraan" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Maintenance.aspx.cs" Inherits="Admin.Maintenance" %>

<asp:Content ID="maintenanceContent" ContentPlaceHolderID="MainContent" runat="server">
     <h1 class="page-header">Penyelenggaraan Peralatan Program</h1>

    <div class="row">

    </div>
    <!-- /.div for table -->

    <div class="row">
        <div class="col-md-4">
            <asp:Button ID="addBtn" runat="server" Text="Tambah" />
        </div>
        
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="maintainPanel" runat="server" BorderStyle="Solid">
            <div class="form-horizontal">
                <h4>1. Maklumat Peralatan</h4>
                <div class="form-group">
                    <asp:Label ID="toolLabel" runat="server" Text="Nama Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="toolTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <!-- /.div for tools information -->

                <div class="form-group">
                    <asp:Label ID="siriLabel" runat="server" Text="No Siri Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="siriTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <!-- /.div for siri tools -->

                <div class="form-group">
                    <asp:Label ID="companyLabel" runat="server" Text="Syarikat Pengeluar Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="companyTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <!-- /.div for company name -->

                <div class="form-group">
                    <asp:Label ID="yearLabel" runat="server" Text="Tahun Pengeluaran" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="yearTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <!-- /.div for production year -->

                <h4>2. Maklumat Penyelenggaraan</h4>
                <div class="form-group">
                    <asp:Label ID="maintainYearLabel" runat="server" Text="Penyelenggaraan Tahunan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="maintainYearList" runat="server">
                            <asp:ListItem>Pilih Bilangan</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <!-- /.div for yearly maintainace -->

                <div class="form-group">
                    <asp:Label ID="costLabel" runat="server" Text="Kos Penyelenggaraan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="costTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <!-- /.div for cost maintenance -->

                <div class="form-group">
                    <asp:Label ID="dateLabel" runat="server" Text="Tarikh Penyelenggaraan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="dateTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <!-- /.div for date maintenance -->

                <h4>3. Log Penyelenggaraan</h4>
                <div class="form-group">

                </div>
                <!-- /. div for table-->

                <h4>4. Ringkasan Penyelenggaraan</h4>
                <div class="form-group">
                    <asp:Label ID="noteLabel" runat="server" Text="Catatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="noteTxtArea" runat="server" CssClass="form-control" TextMode="MultiLine"  Height="57px" Width="225px"></asp:TextBox>
                    </div>
                </div>
                <!-- /.div for note-->

                <div class="form-group">
                    <div class="col-md-6 col-md-offset-4">
                        <asp:Button ID="sendBtn" runat="server" Text="Hantar" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </asp:Panel>
        </div>
    </div>
</asp:Content>
