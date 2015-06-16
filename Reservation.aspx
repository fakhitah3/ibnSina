<%@ Page Title="Jadual Tempahan" Language="C#" MasterPageFile="~/AdminSite.Master" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="Admin.Contact" %>

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
    <h1 class="page-header">Jadual Tempahan Peralatan Program
    </h1>
    
    <div class="row">
        <div class="col-md-offset-4">
            Nama Program<asp:DropDownList ID="programList" runat="server" AutoPostBack="true" CssClass="btn btn-default">
                <asp:ListItem Value="chemistry">Chemistry</asp:ListItem>
                <asp:ListItem Value="physic">Physics</asp:ListItem>
                <asp:ListItem Value="mathematic">Mathematics</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="nameLabel" runat="server" Text="Nama Peralatan"></asp:Label>
            <asp:DropDownList ID="toolNameList" runat="server" DataSourceID="ListOfItem" DataTextField="tools" DataValueField="tools" AutoPostBack="True"  CssClass="btn btn-default dropdown-toggle">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="ListOfItem" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>" SelectCommand="SELECT [tools] FROM [tools] WHERE ([program] = @program)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="programList" Name="program" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="LabelSQL" runat="server" Text="LabelSQL"></asp:Label>
        </div>
    </div>
    <!-- /.div for select tools -->

    <div class="row">

        <div class="col-md-4">
            <asp:Calendar ID="calendarDate" runat="server" OnSelectionChanged="calendarDate_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>
        </div>
        <!-- /.AJAX for calendar --->

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-md-offset-4">
            <asp:UpdatePanel ID="UpdatePanelSchedule" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                <ContentTemplate>
                    <DayPilot:DayPilotCalendar ID="reserveSchedule" runat="server" DataResourceField="tools" DataStartField="eventStart" DataTextField="username" DataValueField="Id" Days="7" EventMoveHandling="CallBack" OnEventMove="reserveSchedule_EventMove" BackColor="#FFFFD5" BorderColor="#000000" CssClassPrefix="calendar_default" DataIdField="Id" DataSourceID="SqlDbEventS" DayFontFamily="Tahoma" DayFontSize="10pt" DurationBarColor="Blue" EventBackColor="#FFFFFF" EventBorderColor="#000000" EventClickHandling="PostBack" EventFontFamily="Tahoma" EventFontSize="8pt" EventHoverColor="#DCDCDC" HourBorderColor="#EAD098" HourFontFamily="Tahoma" HourFontSize="16pt" HourHalfBorderColor="#F3E4B1" HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899" HoverColor="#FFED95" NonBusinessBackColor="#FFF4BC" ScrollPositionHour="9" StartDate="2015-06-10" style="top: 0px; left: 0px" DataEndField="eventEnd" OnEventClick="reserveSchedule_EventClick" OnTimeRangeSelected="reserveSchedule_TimeRangeSelected" TimeRangeSelectedHandling="PostBack"></DayPilot:DayPilotCalendar>
                    <asp:SqlDataSource ID="SqlDbEventS" runat="server" ConnectionString="<%$ ConnectionStrings:ibnuSinaDBConnectionStringOutsource %>" SelectCommand="SELECT [Id], [username], [tools], [eventStart], [eventEnd] FROM [chemistryExerciseSchedule] WHERE NOT (([eventEnd] &lt;= @start) OR ([eventStart] &gt;= @end + 1))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="reserveSchedule" Name="start" PropertyName="StartDate" />
                            <asp:ControlParameter ControlID="reserveSchedule" Name="end" PropertyName="EndDate" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>           
        </div>
        <!-- /. AJAX for schedule -->

        <ajaxtoolkit:modalpopupextender ID="ModalPopup" runat="server" TargetControlID="HideField" PopupControlID="pnlPopup" BackgroundCssClass="modalBackground" CancelControlID="cancelBtn" />
        <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup modal-content">
            <asp:UpdatePanel ID="UpdatePanelDetail" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title">Tempahan Baru</h4>
                    </div>
                    <!-- /.div for modal header -->

                                <divs class="modal-body">
                                    <div class="container-fluid">
                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="usernameLabel" runat="server" Text="Nama Pengguna" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                            <!--    <asp:DropDownList ID="usernameList" runat="server">
                                                    <asp:ListItem></asp:ListItem>
                                                </asp:DropDownList> -->
                                                <asp:TextBox ID="testNameTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div> <!-- /.div for username -->
                                    
                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="toolsNameLabel" runat="server" Text="Nama Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                         <!--       <asp:DropDownList ID="toolsNameList" runat="server">
                                                    <asp:ListItem></asp:ListItem>
                                                </asp:DropDownList> -->
                                                 <asp:TextBox ID="testToolsTxtBox" runat="server" CssClass="form-control"></asp:TextBox>                             
                                            </div>
                                        </div> <!-- /.div for tools name -->

                                        <div class="col-xs-4 col-sm-6">
                                             <asp:Label ID="startLabel" runat="server" Text="Sesi Mula" CssClass="col-sm-4 control-label"></asp:Label>
                                             <div class="col-sm-6">
                                                <asp:TextBox ID="startTimeTxtBox" runat="server" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                                                <asp:Label ID="ex" runat="server" Text="cth: 20/03/2012 08:00:00" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div> <!-- /.div for start time -->

                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="endLabel" runat="server" Text="Sesi Akhir" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="endTimeTxtBox" runat="server" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                                                <asp:Label ID="ez" runat="server" Text="cth: 20/03/2012 08:00:00" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div><!-- /.div for end time -->
                                        
                                  </div>
                                 </divs>
                </ContentTemplate>
            </asp:UpdatePanel>            
                <div class="modal-footer">
                    <asp:HiddenField ID="HideField" runat="server"></asp:HiddenField>
                    <asp:Button ID="saveBtn" runat="server" Text="Simpan" CssClass="btn btn-primary" OnClick="saveBtn_Click" />
                    <asp:Button ID="cancelBtn" runat="server" Text="Tutup"  CssClass="btn btn-default" />
                </div>
        </asp:Panel>
    <!-- /. AJAX Control Toolkit ModalPopup Create New -->

        <ajaxtoolkit:modalpopupextender ID="ModalPopupEdit" runat="server" TargetControlID="editBtn" PopupControlID="pnlPopupEdit" BackgroundCssClass="modalBackground" CancelControlID="cancelEditBtn" />
        <asp:Panel ID="pnlPopupEdit" runat="server" CssClass="modalPopup modal-content">
            <asp:UpdatePanel ID="UpdatePanelEdit" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-header">
                        <h4 class="modal-title">Penukaran Tempahan</h4>
                    </div>
                    <!-- /.div for modal header -->

                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="editUsernameLabel" runat="server" Text="Nama Pengguna" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                            <!--    <asp:DropDownList ID="editUsernameList" runat="server">
                                                    <asp:ListItem></asp:ListItem>
                                                </asp:DropDownList> -->
                                                <asp:TextBox ID="editUsernameTxtBox" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div> <!-- /.div for username -->
                                    
                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="editToolsNameLabel" runat="server" Text="Nama Peralatan" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                                <asp:DropDownList ID="editToolsNameList" runat="server" CssClass="dropdown form-control"></asp:DropDownList>                         
                                            </div>
                                        </div> <!-- /.div for tools name -->

                                        <div class="col-xs-4 col-sm-6">
                                             <asp:Label ID="editStartLabel" runat="server" Text="Sesi Mula" CssClass="col-sm-4 control-label"></asp:Label>
                                             <div class="col-sm-6">
                                                <asp:TextBox ID="editStartTxtBox" runat="server" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                                                <asp:Label ID="exStart" runat="server" Text="cth: 20/03/2012 08:00:00" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div> <!-- /.div for start time -->

                                        <div class="col-xs-4 col-sm-6">
                                            <asp:Label ID="editEndLabel" runat="server" Text="Sesi Akhir" CssClass="col-sm-4 control-label"></asp:Label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="editEndTxtBox" runat="server" TextMode="DateTime" CssClass="form-control"></asp:TextBox>
                                                <asp:Label ID="exEnd" runat="server" Text="cth: 20/03/2012 08:00:00" ForeColor="Red"></asp:Label>
                                            </div>
                                        </div><!-- /.div for end time -->

                                        <asp:HiddenField ID="HiddenEditID" runat="server"></asp:HiddenField>

                                  </div>
                                 </div>
                </ContentTemplate>
            </asp:UpdatePanel>            
                <div class="modal-footer">
                    <asp:Button ID="deleteBtn" runat="server" Text="Padam" CssClass="btn btn-danger"/>
                    <asp:Button ID="editBtn" runat="server" Text="Ubah" CssClass="btn btn-primary" OnClick="editBtn_Click" />
                    <asp:Button ID="cancelEditBtn" runat="server" Text="Tutup"  CssClass="btn btn-default" />
                </div>
        </asp:Panel>
    <!-- /. AJAX Control Toolkit ModalPopup Edit -->
        
    </div>
    <!-- /.div for database schedule -->

</asp:Content>
