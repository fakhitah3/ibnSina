<%@ Page Title="Borang Tempahan" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="ReservationForm.aspx.cs" Inherits="Pengurusan_Makmal.ReservationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="reservationContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
    <h2>Borang Tempahan Penggunaan Peralatan</h2>
</div>

<div class="row">
    <form runat="server" class="form-horizontal">
        <div class="row">
            <div class="col-md-6">
                <h4>1. Maklumat Peribadi Pengguna:</h4>
                <asp:Panel ID="panelPersonalInfo" runat="server">
                    <asp:DetailsView CssClass="table" ID="DetailsView1" runat="server" Height="50px" Width="300px" AutoGenerateRows="False" DataSourceID="GetUserData">
                        <Fields>
                            <asp:BoundField DataField="fName" HeaderText="First Name" SortExpression="fName" />
                            <asp:BoundField DataField="lName" HeaderText="Last Name" SortExpression="lName" />
                            <asp:BoundField DataField="icNum" HeaderText="No. IC" SortExpression="icNum" />
                            <asp:BoundField DataField="address" HeaderText="Alamat" SortExpression="address" />
                            <asp:BoundField DataField="phone" HeaderText="No. Telefon" SortExpression="phone" />
                            <asp:BoundField DataField="dateRegister" HeaderText="Tarikh Pendaftaran" SortExpression="dateRegister" />
                            <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                            <asp:BoundField DataField="dateEndStudies" HeaderText="Tarikh Tamat Pengajian" SortExpression="dateEndStudies" />
                            <asp:BoundField DataField="agencyName" HeaderText="Nama Agensi" SortExpression="agencyName" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="GetUserData" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>" SelectCommand="SELECT [fName], [lName], [icNum], [address], [phone], [dateRegister], [status], [dateEndStudies], [agencyName] FROM [authentication] WHERE ([username] = @username)">
                        <SelectParameters>
                            <asp:SessionParameter Name="username" SessionField="currentUserID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
            <!-- /.div for personal information -->

            <div class="col-md-6">
            <h4>3. Maklumat Tempahan:</h4>
                <div class="form-group">
                <asp:Label ID="programLabel" runat="server" Text="Pilih Program" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="programList" runat="server" AutoPostBack="true">
                        <asp:ListItem runat="server" Text="---Pilih Program---" Value="select"></asp:ListItem>
                        <asp:ListItem runat="server" Text="Chemistry" Value="chemistry"></asp:ListItem>
                        <asp:ListItem runat="server" Text="Physics" Value="physic"></asp:ListItem>
                        <asp:ListItem runat="server" Text="Mathematics" Value="mathematic"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <!-- /. div for type of reservation math/physic/chemistry -->

            <div class="form-group">
                <asp:Label ID="dateLabel" runat="server" Text="Tarikh" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="dateTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- /.div for date -->

            <div class="form-group">
                <asp:Label ID="amountLabel" runat="server" Text="Bilangan Sampel" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="amountTxtBox" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>                
                </div>
                <asp:RangeValidator ID="amountValidate" runat="server" ErrorMessage="*Tidak boleh melebihi 3 sampel" Type="Integer" MaximumValue="3" ControlToValidate="amountTxtBox" MinimumValue="0"></asp:RangeValidator>
            </div>
            <!-- /. div for amount -->

            <div class="form-group">
                <asp:Label ID="detailLabel" runat="server" Text="Butiran Sampel" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="detailTxtBox" runat="server" TextMode="MultiLine" Height="57px" Width="225px" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- /. div for details -->

            <div class="form-group">
                <asp:Label ID="resultLabel" runat="server" Text="Hasil Jangkaan" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="resultTxtBox" runat="server" TextMode="MultiLine" Height="57px" Width="225px" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <!-- /. div for result -->

            <div class="form-group">
                <asp:Label ID="instrumentLabel" runat="server" Text="Jenis Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="instrumentList" runat="server" DataSourceID="listInstrument" DataTextField="tools" DataValueField="tools">

                    </asp:DropDownList>
                    <asp:SqlDataSource ID="listInstrument" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>" SelectCommand="SELECT [tools] FROM [tools] WHERE ([program] = @program)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="programList" Name="program" PropertyName="SelectedValue" Type="String" DefaultValue="Chemistry"/>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!-- /. div for instrument -->
        
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="sendBtn" runat="server" Text="Hantar" CssClass="btn btn-primary" OnClick="sendBtn_Click" /> &nbsp;
                    <asp:Button ID="resetBtn" runat="server" Text="Batal" CssClass="btn btn-primary" />
                </div>
           </div>
           </div>
           <!-- /.div for reservation -->
        </div>
</div>

<div class="row">
    <div class="col-md-6">
        <h4>2. Maklumat Penyelidikan:</h4>
        <asp:Panel ID="panelResearch" runat="server">
            <asp:DetailsView ID="DetailsView2" CssClass="table" runat="server" Height="50px" Width="300px" AutoGenerateRows="False" DataSourceID="GetUserResearchData">
                <Fields>
                    <asp:BoundField DataField="program" HeaderText="Program" SortExpression="program" />
                    <asp:BoundField DataField="projectTitle" HeaderText="Tajuk Kajian" SortExpression="projectTitle" />
                    <asp:BoundField DataField="projectLeader" HeaderText="Ketua Projek" SortExpression="projectLeader" />
                    <asp:BoundField DataField="projectSupervisor" HeaderText="Projek Penyelia" SortExpression="projectSupervisor" />
                    <asp:BoundField DataField="votNumber" HeaderText="No. VOT" SortExpression="votNumber" />
                    <asp:BoundField DataField="votBalance" HeaderText="Baki VOT" SortExpression="votBalance" />
                    <asp:BoundField DataField="votExpiryDate" HeaderText="Tarikh Tamat VOT" SortExpression="votExpiryDate" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="GetUserResearchData" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>" SelectCommand="SELECT [program], [projectTitle], [projectLeader], [projectSupervisor], [votNumber], [votBalance], [votExpiryDate] FROM [authentication] WHERE ([username] = @username)">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="currentUserID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        
    </form>
    </div>
</div>
</asp:Content>
