<%@ Page Title="Penjanaan Invois Tempahan" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="Admin.Penolong_Pendaftar.invoice" %>

<asp:Content ID="invoiceContent" ContentPlaceHolderID="MainContent" runat="server">
<form runat="server">
    <h1 class="page-header">Invois Tempahan Program</h1>
    
    <div class="row">
        <div class="col-md-3 col-md-offset-4">
            Pilih Program :
            <asp:DropDownList ID="programList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="programList_SelectedIndexChanged">
                <asp:ListItem runat="server" Text="Chemistry" Value="chemistry"></asp:ListItem>
                <asp:ListItem runat="server" Text="Physics" Value="physic"></asp:ListItem>
                <asp:ListItem runat="server" Text="Mathematics" Value="mathematic"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div> <!-- /.div for dropdownlist -->

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
        <asp:GridView ID="GridView1" class="table table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="ListOfReservation" DataKeyNames="username" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="username" HeaderText="Nama" SortExpression="username" />
                <asp:BoundField DataField="sampleQuantity" HeaderText="Bilangan Sampel" SortExpression="sampleQuantity" />
                <asp:BoundField DataField="output" HeaderText="output" SortExpression="output" />
                <asp:BoundField DataField="toolsType" HeaderText="Jenis Alatan" SortExpression="toolsType" />
                <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="ListOfReservation" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>">
           
        </asp:SqlDataSource>
        </div>
    </div><!-- /.div for table -->

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <asp:Panel ID="invoicePanel" runat="server" BorderStyle="Solid">
            <h4>1. Maklumat Pengguna</h4>

            <div class="row">
                <div class="col-md-6 col-md-offset-1">
                <asp:DetailsView ID="DetailsView1" class="table" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="DetailsViewOfUserInformation">
                    <Fields>
                        <asp:BoundField DataField="fName" HeaderText="First Name" SortExpression="fName" />
                        <asp:BoundField DataField="lName" HeaderText="Last Name" SortExpression="lName" />
                        <asp:BoundField DataField="icNum" HeaderText="No. IC" SortExpression="icNum" />
                        <asp:BoundField DataField="address" HeaderText="Alamat" SortExpression="address" />
                        <asp:BoundField DataField="phone" HeaderText="No. Telefon" SortExpression="phone" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="DetailsViewOfUserInformation" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>" SelectCommand="SELECT [id], [fName], [lName], [icNum], [address], [phone], [dateRegister], [status], [dateEndStudies], [agencyName] FROM [authentication] WHERE ([username] = @username)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="username" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </div>
            </div><!-- /.div for user information -->

            <h4>2. Maklumat Tempahan</h4>
            <div class="row">
                <div class="col-md-6 col-md-offset-1">
                <asp:DetailsView ID="DetailsView2" CssClass="table" runat="server" Height="50px" Width="125px" DataSourceID="DetailsViewOfReservation">
                    <Fields>
                        <asp:BoundField DataField="sampleQuantity" HeaderText="Bilangan Sample" SortExpression="sampleQuantity" />
                        <asp:BoundField DataField="sampleDetails" HeaderText="Details of Sample" SortExpression="sampleDetails" />
                        <asp:BoundField DataField="output" HeaderText="Result Expected" SortExpression="output" />
                        <asp:BoundField DataField="toolsType" HeaderText="Jenis Alat" SortExpression="toolsType" />
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                        <asp:BoundField DataField="review" HeaderText="Review" SortExpression="review" />
                        <asp:BoundField DataField="dateReservation" HeaderText="Reservation Date" SortExpression="dateReservation" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="DetailsViewOfReservation" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>">
                  
                </asp:SqlDataSource>
                </div>
            </div>
            <!-- /.div for reservation information -->

             <h4>3. Maklumat Invois</h4>
            <div class="row">
                <div class="form-horizontal">
                    <div class="form-group">
                        <asp:Label ID="numberLabel" runat="server" Text="No Invois" CssClass="col-sm-4 control-label"></asp:Label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="numberTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <!-- /.div for invois number -->

                    <div class="form-group">
                        <asp:Label ID="dateLabel" runat="server" Text="Tarikh Invois" CssClass="col-sm-4 control-label"></asp:Label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="dateTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <!-- /.div for invois date -->
                </div>
            </div>
            <!-- /.div for invois information -->
        
            <h4>4. Maklumat Pembayaran</h4>
            <div class="row">
                <div class="form-horizontol">
                    <div class="form-group">
                        <asp:Label ID="priceLabel" runat="server" Text="Harga Tempahan Per Sampel" CssClass="col-sm-4 control-label"></asp:Label>
                        <div class="col-sm-6">
                            <asp:TextBox ID="priceTxtBox" AutoPostBack="true" OnTextChanged="priceTxtBox_TextChanged" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <!-- /.div for price -->

                    <div class="form-group">
                        <asp:Label ID="totalLabel" runat="server" Text="Jumlah Yang Perlu Dibayar" CssClass="col-sm-4 control-label"></asp:Label>
                        <div class="col-sm-6">
                             RM <asp:Label runat="server" ID="totalAmountLabel" Text="totalAmountLabel"></asp:Label>
                        </div>
                    </div>
                    <!-- /.div for total amount -->

                    <div class="form-group">
                        <div class="col-sm-6 col-md-offset-4">
                            <asp:Button ID="calculateBtn" runat="server" Text="Kira" OnClick="calculateBtn_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.div for payment -->
        </asp:Panel>
        </div>
    </div>
    <!-- /.div for invoice -->
    </form>
</asp:Content>
