<%@ Page Title="Tempahan" Language="C#" MasterPageFile="~/User/Session.Master" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="Pengurusan_Makmal.Schedule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .modalBackground
        {
            background-color:black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup
        {
            min-width:200px;
            min-height:150px;
            background: white;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<form runat="server">
    <h1 class="page-header">Jadual Tempahan Program
    </h1>
    
    <div class="row">
        <div class="col-md-offset-4">
            <asp:Label ID="nameLabel" runat="server" Text="Nama Peralatan"></asp:Label>
            <asp:DropDownList ID="toolNameList" runat="server">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <!-- /.div for select tools -->

    <div class="row">

        <div class="col-md-4">
            <asp:Calendar ID="reserveCalendar" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="reserveCalendar_SelectionChanged">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
        </div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-md-offset-4">
            <asp:UpdatePanel ID="UpdatePanelCalendar" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                <ContentTemplate>
                    <DayPilot:DayPilotCalendar ID="reserveSchedule" runat="server" Days="7" DataStartField="eventStart" DataEndField="eventEnd" DataTextField="fName" DataValueField="Id" AllDayEventBackColor="White" BackColor="#FFFFD5" BorderColor="Black" CellBorderColor="Black" CellSelectColor="#316AC5" Direction="Auto" DurationBarColor="Blue" DurationBarWidth="5" EventBackColor="White" EventBorderColor="Black" EventFontColor="Black" EventSelectColor="Blue" HeaderFontColor="Black" HourBorderColor="#EAD098" HourFontColor="Black" HourHalfBorderColor="#F3E4B1" HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899" NonBusinessBackColor="#FFF4BC" ScrollPositionHour="9" ShowAllDayEventStartEnd="True" ShowEventStartEnd="True" StartDate="2015-05-25" Width="" EventClickHandling="PostBack" OnEventClick="reserveSchedule_EventClick" CellHeight="50" OnEventMove="reserveSchedule_EventMove" DataSourceID="SqlDbSchedule" style="top: 0px; left: 0px" EventMoveHandling="CallBack">
                    </DayPilot:DayPilotCalendar>
                    <asp:SqlDataSource ID="SqlDbSchedule" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>" SelectCommand="SELECT [Id], [fName], [eventStart], [eventEnd], [tools] FROM [chemistryExerciseSchedule] WHERE NOT (([eventEnd] <= @start) OR ([eventStart] >= @end + 1))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="reserveSchedule" Name="start" PropertyName="StartDate" />
                            <asp:ControlParameter ControlID="reserveSchedule" Name="end" PropertyName="EndDate" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <!-- /. AJAX for schedule -->

        <ajaxtoolkit:modalpopupextender ID="ModalPopupEdit" runat="server" TargetControlID="editBtn" PopupControlID="pnlPopupEdit" BackgroundCssClass="modalBackground" CancelControlID="cancelEditBtn" />
        <asp:Panel ID="pnlPopupEdit" runat="server" CssClass="modalPopup modal-content">
            <asp:UpdatePanel ID="UpdatePanelEdit" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title">Permohonan Tempahan</h4>
                    </div>
                    <!-- /.div for modal header -->

                                <divs class="modal-body">
                                    <div class="container-fluid">
                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="editUsernameLabel" runat="server" Text="Nama Pengguna" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="editUsernameTxtBox" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div> <!-- /.div for username -->
                                    
                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="editToolsNameLabel" runat="server" Text="Nama Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                                 <asp:TextBox ID="editToolsNameTxtBox" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>                             
                                            </div>
                                        </div> <!-- /.div for tools name -->

                                        <div class="col-xs-4 col-sm-6">
                                             <asp:Label ID="editStartLabel" runat="server" Text="Sesi Mula" CssClass="col-sm-4 control-label"></asp:Label>
                                             <div class="col-sm-6">
                                                <asp:TextBox ID="editStartTxtBox" runat="server" TextMode="DateTime" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div> <!-- /.div for start time -->

                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="editEndLabel" runat="server" Text="Sesi Akhir" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="editEndTxtBox" runat="server" TextMode="DateTime" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div><!-- /.div for end time -->

                                        <asp:HiddenField ID="HiddenEditID" runat="server"></asp:HiddenField>

                                  </div>
                                 </divs>
                </ContentTemplate>
            </asp:UpdatePanel>            
                <div class="modal-footer">
                    <asp:Button ID="editBtn" runat="server" Text="Ubah" CssClass="btn btn-primary" Style="display: none;"/>
                    <asp:Button ID="cancelEditBtn" runat="server" Text="Tutup"  CssClass="btn btn-default" />
                </div>
        </asp:Panel>
    <!-- /. AJAX Control Toolkit ModalPopup Edit -->
        
    </div>
    <!-- /.div for database schedule -->
</form>
</asp:Content>
