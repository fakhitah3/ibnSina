<%@ Page Title="Pengurusan Tempahan" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="Admin.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="page-header">Pengurusan Tempahan Peralatan Program</h1>
    
    <div class="row">

    </div>
    <!-- /. div for table -->

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="panelManage" runat="server" BorderStyle="Solid">
                <div class="row">
                    <div class="col-md-6">
                        <h4>1. Maklumat Pengguna</h4>
                    </div>
                    <!-- /.div for user information -->

                    <div class="col-md-6">
                        <h4>2. Maklumat Penyelidikan</h4>
                    </div>
                    <!-- /.div for research information -->
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <h4>3. Maklumat Tempahan</h4>
                    </div>
                    <!-- /.div for reservation -->

                    <div class="col-md-6">
                        <h4>4. Status Tempahan</h4>
                    </div>
                    <!-- /.div for status -->
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <h4>5. SMS Status Tempahan</h4>

                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:Label ID="phoneLabel" runat="server" Text="No. Telefon Pengguna" CssClass="col-sm-4 control-label"></asp:Label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="phoneTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <!-- /.div for phone number -->

                            <div class="form-group">
                                <asp:Label ID="msgLabel" runat="server" Text="Mesej" CssClass="col-sm-4 control-label"></asp:Label>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="msgTxtBox" runat="server" CssClass="form-control" TextMode="MultiLine" Height="57px" Width="225px"></asp:TextBox>
                                </div>
                            </div>
                            <!-- /.div for message -->

                            <div class="form-group">
                                <div class="col-sm-6 col-md-offset-4">
                                    <asp:Button ID="sendBtn" runat="server" Text="Hantar" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div> <!-- /.div for position the panel --->
    </div>
</asp:Content>
