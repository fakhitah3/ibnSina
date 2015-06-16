<%@ Page Title="Pendaftaran" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ibnusina.register" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-header">
    <h2>Pendaftaran Pengguna</h2>
</div>
<asp:Panel ID="panelForm" runat="server" BorderStyle="Solid">
    <form runat="server" class="form-horizontal">
        <div class="row">
            <div class="col-md-6">

            <h4>1. Maklumat Peribadi:</h4>
            <div class="form-group">
                <asp:Label ID="fnameLabel" runat="server" CssClass="col-sm-4 control-label" Text="First Name"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="fNameTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="fNameRequired" runat="server" ErrorMessage="Name is blank" ControlToValidate="fNameTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- /. div for fname -->
                <div class="form-group">
                <asp:Label ID="lNameLabel" runat="server" CssClass="col-sm-4 control-label" Text="Last Name"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="lNameTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="lNameRequired" runat="server" ErrorMessage="Name is blank" ControlToValidate="lNameTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- /. div for lname -->
            <div class="form-group">
                <asp:Label ID="icLabel" runat="server" CssClass="col-sm-4 control-label" Text="No. Kad Pengenalan"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="icTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="icRequired" runat="server" ErrorMessage="I/C is blank" ControlToValidate="icTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="icRegularExpression" runat="server" ControlToValidate="icTxtBox" ErrorMessage="RegularExpressionValidator" Text="Invalid Format" ValidationExpression="^[0-9]{12}$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <!-- /. div for IC -->
            <div class="form-group">
                <asp:Label ID="addressLabel" runat="server" CssClass="col-sm-4 control-label" Text="Alamat"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="addressTxtBox" runat="server" TextMode="MultiLine" Height="57px" Width="225px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="addressRequired" runat="server" ErrorMessage="Address is blank" ControlToValidate="addressTxtBox">*Required</asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- /. div for address -->
            <div class="form-group">
                <asp:Label ID="emailLabel" runat="server" CssClass="col-sm-4 control-label" Text="E-mail"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="emailTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="emailRequired" runat="server" ErrorMessage="*Email is blank" ControlToValidate="emailTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="emailRegular" runat="server" ErrorMessage="Invalid E-mail" ControlToValidate="emailTxtBox" Text="*E-mail invalid" ValidationExpression="^(?(&quot;&quot;)(&quot;&quot;.+?&quot;&quot;@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&amp;'\*\+/=\?\^`\{\}\|~\w])*)(?&lt;=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <!-- /. div for email -->
            <div class="form-group">
                <asp:Label ID="phoneLabel" runat="server" CssClass="col-sm-4 control-label" Text="Telefon"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="phoneTxtBox" runat="server" TextMode="Phone" placeholder="017-211-3433" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="phoneRequired" runat="server" ErrorMessage="*Phone is blank" ControlToValidate="phoneTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="phoneRegular" runat="server" ErrorMessage="Invalid Phone Number" ControlToValidate="phoneTxtBox" Text="*Phone number invalid" ValidationExpression="^\d{3,4}-\d{3}-\d{4}$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <!-- /. div for phone -->
            <div class="form-group">
                <asp:Label ID="registerLabel" runat="server" CssClass="col-sm-4 control-label" Text="Tarikh Pendaftaran"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="registerTxtBox" runat="server"  TextMode="SingleLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="registerRequired" runat="server" ErrorMessage="Date is not chosen yet" ControlToValidate="registerTxtBox">*Required</asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- /. div for registerDate -->
            <div class="form-group">
                <asp:Label ID="statusLabel" runat="server" CssClass="col-sm-4 control-label" Text="Status Pengguna"></asp:Label>
                <div class="col-sm-6">
                    <asp:DropDownList ID="statusList" runat="server">
                        <asp:ListItem>Pilih Status</asp:ListItem>
                        <asp:ListItem Value="0">Staf</asp:ListItem>
                        <asp:ListItem Value="1">Pengerusi</asp:ListItem>
                        <asp:ListItem Value="2">Penolong Pendaftar</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="statusRequired" runat="server" ErrorMessage="Choose one of the following" Text="*Required" ControlToValidate="statusList" InitialValue="Pilih Status"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- /. div for status -->
            <div class="form-group">
                <asp:Label ID="graduateLabel" runat="server" CssClass="col-sm-4 control-label" Text="Tarikh Tamat Pengajian"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="graduateTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="graduateRequired" runat="server" ErrorMessage="Choose date" ControlToValidate="graduateTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- /. div for graduation date -->
            <div class="form-group">
                <asp:Label ID="agentLabel" runat="server" CssClass="col-sm-4 control-label" Text="Nama agensi"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="agentTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="agentRequired" runat="server" ErrorMessage="Agency is blank" ControlToValidate="agentTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!-- /. div for agent -->
            </div>
            <!-- /.div for personal information -->
        
            <div class="col-md-6">
                <h4>2. Maklumat Penyelidikan</h4>
                <div class="form-group">
                    <asp:Label ID="programLabel" runat="server" Text="Jenis Program" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:DropDownList ID="programList" runat="server">
                            <asp:ListItem Value="select">---Pilih Program---</asp:ListItem>
                            <asp:ListItem Value="chemistry">Chemistry</asp:ListItem>
                            <asp:ListItem Value="physic">Physics</asp:ListItem>
                            <asp:ListItem Value="mathematic">Mathematics</asp:ListItem>
                        </asp:DropDownList>    
                        <asp:RequiredFieldValidator ID="programRequired" runat="server" ErrorMessage="Choose one" ControlToValidate="programList" Text="*Required" InitialValue="Pilih Program"></asp:RequiredFieldValidator>                                         
                    </div>
                </div>
                <!-- /.div for type of program -->

                 <div class="form-group">
                    <asp:Label ID="titleLabel" runat="server" Text="Tajuk Kajian" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="titleTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="titleRequired" runat="server" ErrorMessage="Title Project is blank" ControlToValidate="titleTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- /.div for title of research -->

                 <div class="form-group">
                    <asp:Label ID="headLabel" runat="server" Text="Ketua Projek" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="headTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="headRequired" runat="server" ErrorMessage="Head Project is blank" ControlToValidate="headTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- /.div for head of project -->

                 <div class="form-group">
                    <asp:Label ID="svLabel" runat="server" Text="Penyelia Projek" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="svTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="svRequired" runat="server" ErrorMessage="Supervisor Project is blank" ControlToValidate="svTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- /.div for supervisor of project -->

                 <div class="form-group">
                    <asp:Label ID="votLabel" runat="server" Text="No. VOT" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="votTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="votRequired" runat="server" ErrorMessage="VOT number is blank" ControlToValidate="votTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- /.div for VOT number -->

                 <div class="form-group">
                    <asp:Label ID="balanceLabel" runat="server" Text="Baki VOT" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="balanceTxtBox" runat="server" placeholder="RM" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="balanceRequired" runat="server" ErrorMessage="VOT balance is blank" ControlToValidate="balanceTxtBox">*Required</asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- /.div for VOT balance -->

                 <div class="form-group">
                    <asp:Label ID="dueLabel" runat="server" Text="Tarikh Tamat VOT" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="dueTxtBox" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="dueRequired" runat="server" ErrorMessage="Choose one" ControlToValidate="dueTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- /.div for due date VOT -->
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <h4>3. Maklumat Login</h4>
                <div class="form-group">
                    <asp:Label ID="idLabel" runat="server" Text="ID Pengguna" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="idTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="idRequired" runat="server" ErrorMessage="User ID is blank" Text="*Required" ControlToValidate="idTxtBox"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <!-- /.div for ID -->

                <div class="form-group">
                    <asp:Label ID="passwordLabel" runat="server" Text="Kata Laluan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="passwordTxtBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ErrorMessage="Password is blank" ControlToValidate="passwordTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="passwordRegular" runat="server" ErrorMessage="Must more than 6 characters" ControlToValidate="passwordTxtBox" ValidationExpression="^.{6,}$" Text="Must more than 6 charcters"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <!-- /.div for password -->

                <div class="form-group">
                    <asp:Label ID="confirmLabel" runat="server" Text="Pengesahan Kata Laluan" CssClass="col-sm-4 control-label"></asp:Label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="confirmTxtBox" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="confirmRequired" runat="server" ErrorMessage="Confirm Password is blank" ControlToValidate="confirmTxtBox" Text="*Required"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="confirmCompare" runat="server" ErrorMessage="No match" ControlToCompare="confirmTxtBox" ControlToValidate="passwordTxtBox" Text="*Password is not the same"></asp:CompareValidator>
                    </div>
                </div>
                <!-- /.div for confirmation password -->
            </div>
        </div>
        <!-- /.div for login -->

        <div class="row">
            <div class="col-sm-offset-5 col-sm-10">
                <asp:Button ID="registerBtn" runat="server" Text="Daftar" CssClass="btn btn-primary" onClick="registerBtn_Click"/> &nbsp;
                <asp:Button ID="resetBtn" runat="server" Text="Semula" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
</asp:Panel>
</asp:Content>
