<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Admin._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="page-header">Pengurusan Peralatan Program</h1>

    <div class="row">
       
    </div>
    <!-- /.div for table -->

    <div class="row">
        <asp:Button ID="addBtn" runat="server" Text="Tambah" />
        
        <div class="col-md-10">
            <h4>1. Maklumat Peribadi</h4>

            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="nameLabel" runat="server" Text="Nama Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="nameTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for name -->

                <div class="form-group">
                    <asp:Label ID="siriLabel" runat="server" Text="No. Siri Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="siriTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for no. siri -->

                <div class="form-group">
                    <asp:Label ID="yearLabel" runat="server" Text="Tahun Keluaran" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="yearTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for production year -->

                <div class="form-group">
                    <asp:Label ID="manageLabel" runat="server" Text="Pengurus" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="manageTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for management -->

                <div class="form-group">
                    <asp:Label ID="locationLabel" runat="server" Text="Lokasi Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="locationTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for location -->

                <div class="form-group">
                    <asp:Label ID="describeLabel" runat="server" Text="Butiran Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="describeTxtArea" runat="server" CssClass="form-control" TextMode="MultiLine" Height="57px" Width="225px"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for description -->

                <div class="form-group">
                    <asp:Label ID="distrubeLabel" runat="server" Text="Pengedar" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="distrubeTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for distrubutor -->

                <div class="form-group">
                    <asp:Label ID="cajUtmLabel" runat="server" Text="Caj Penggunaan (UTM)" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="cajUtmTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for caj UTM -->

                <div class="form-group">
                    <asp:Label ID="cajGovLabel" runat="server" Text="Caj Penggunaan (Kerajaan)" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="cajGovTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for caj Government -->

                <div class="form-group">
                    <asp:Label ID="cajPrivateLabel" runat="server" Text="Caj Penggunaan (Swasta)" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="cajPrivateTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>                    
                </div>
                <!-- /.div for caj Private -->

                <div class="form-group">
                    <div class="col-sm-offset-5 col-sm-10">
                        <asp:Button ID="storeBtn" runat="server" Text="Simpan" CssClass="btn btn-primary" />
                    </div>
                </div>
             </div>
        </div>      
    </div>

</asp:Content>
