<%@ Page Title="" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Pengurusan_Makmal.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="reportContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
        <h2>Aduan Kerosakan</h2>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <asp:Panel ID="panelComplaintForm" runat="server" BorderStyle="Solid">
            <h4 align="center"> Sila isikan butiran aduan anda dengan lengkap</h4>
            
               <form runat="server" class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="dateLabel" runat="server" Text="Tarikh Aduan" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="dateTxtBox" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <!-- /.div for date -->

            <div class="form-group">
                <asp:Label ID="typeLabel" runat="server" Text="Jenis Kerosakan" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="typeList" runat="server">
                        <asp:ListItem>Pilih Jenis Aduan</asp:ListItem>
                        <asp:ListItem>Makmal Kimia</asp:ListItem>
                        <asp:ListItem>Makmal Fizik</asp:ListItem>
                        <asp:ListItem>Makmal Matematik</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Pilih Jenis Aduan" ControlToValidate="typeList" ValueToCompare="Pilih Jenis Aduan" Operator="NotEqual"></asp:CompareValidator>
            </div>
            <!-- /.div for type of complain -->

            <div class="form-group">
                <asp:Label ID="describeLabel" runat="server" Text="Butiran Aduan" CssClass="col-sm-4 control-label"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="describeTxtBox" runat="server" TextMode="MultiLine" Height="57px" Width="225px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredDescribe" runat="server" ErrorMessage="Comment is blank" Text="*Required" ControlToValidate="describeTxtBox"></asp:RequiredFieldValidator>
                
                </div>
            </div>
            <!-- /.div for description of complaint -->

            <div class="form-group">
                <div class="col-sm-offset-5 col-sm-10">
                    <asp:Button ID="sendBtn" runat="server" Text="Hantar" CssClass="btn btn-primary" OnClick="sendBtn_Click" /> &nbsp;
                    <asp:Button ID="resetBtn" runat="server" Text="Batal" CssClass="btn btn-primary" />
                </div>
                
            </div>
        </form>
        </asp:Panel>
        </div>
    </div>
</asp:Content>
