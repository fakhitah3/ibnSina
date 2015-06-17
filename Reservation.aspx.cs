using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
using System.Drawing;
using DayPilot.Utils;
using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Enums;
using DayPilot.Web.Ui.Events;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;



namespace Admin
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            testToolsTxtBox.Text = toolNameList.SelectedValue;
            SqlDbEventS.SelectCommand = "SELECT [Id], [username], [tools], [eventStart], [eventEnd] FROM " + programList.SelectedValue + "ExerciseSchedule WHERE NOT (([eventEnd] <= @start) OR ([eventStart] >= @end + 1))";
            
            //dbUpdateEvent(e.Value, e.NewStart, e.NewEnd);
            //reserveSchedule.DataSource = dbGetEvents(reserveSchedule.StartDate, reserveSchedule.Days);
            reserveSchedule.DataBind();
            reserveSchedule.Update();
        }

        //EventMove DayPilot Calendar
        protected void reserveSchedule_EventMove(object sender, EventMoveEventArgs e)
        {
            dbUpdateEvent(e.Value, e.NewStart, e.NewEnd);
            reserveSchedule.DataSource = dbGetEvents(reserveSchedule.StartDate,reserveSchedule.Days);
            reserveSchedule.DataBind();
            reserveSchedule.Update();
        }

        //Load the data
        private DataTable dbGetEvents(DateTime start, int days)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT [Id],[username], [eventStart], [eventEnd] FROM ["+ programList.SelectedValue +"ExerciseSchedule] WHERE NOT (([eventEnd] <= @start) OR ([eventStart] >= @end))", ConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days));
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        //Updating an Event
        private void dbUpdateEvent(String id, DateTime start, DateTime end)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE ["+ programList.SelectedValue +"ExerciseSchedule] SET [eventStart] = @start, [eventEnd] = @end WHERE [Id] = @id", con);
                cmd.Parameters.AddWithValue("id",id);
                cmd.Parameters.AddWithValue("start", start);
                cmd.Parameters.AddWithValue("end", end);
                cmd.ExecuteNonQuery();
            }
        }

        // Select Tools for Dropdown List
        private DataTable dbSelectTools()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT [tools] FROM [tools] WHERE program = '" + programList.SelectedValue + "'", ConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString);
            DataTable dt = new DataTable();
            da.Fill(dt);


            

            return dt;
        }

        // Insert into database
        private void dbInsertEvent(DateTime start, DateTime end, String username, String tools)
        {
            /*using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO ["+ programList.SelectedValue +"ExerciseSchedule] (username, tools, eventStart, eventEnd) VALUES('ahmad tahfiz', 'ahmad fauzi', 'pembaris', @start, @end)", con);
                cmd.Parameters.AddWithValue("start", start);
                cmd.Parameters.AddWithValue("end", end);
                cmd.Parameters.AddWithValue("username", username);
                cmd.ExecuteNonQuery();
            }*/
        }

        //Select full week in Calender control
        protected void calendarDate_SelectionChanged(object sender, EventArgs e)
        {
            reserveSchedule.StartDate = DayPilot.Utils.Week.FirstDayOfWeek(calendarDate.SelectedDate);
            for (int i = 0; i < 7; i++)
            {
                DateTime selected = reserveSchedule.StartDate.AddDays(i);
                calendarDate.SelectedDates.Add(selected);
            }
            reserveSchedule.DataBind();
        }

        // Event Click Exisitng data
        protected void reserveSchedule_EventClick(object sender, EventClickEventArgs e)
        {
            editUsernameTxtBox.Text = e.Text;
            editStartTxtBox.Text = e.Start.ToString("MM/dd/yyyy HH:mm");
            editEndTxtBox.Text = e.End.ToString("MM/dd/yyyy HH:mm");
            editToolsNameList.DataSource = dbSelectTools();
            editToolsNameList.DataTextField = "tools";
            editToolsNameList.DataValueField = "tools";
            //editToolsNameList.SelectedValue = "tools";
            editToolsNameList.DataBind();
            HiddenEditID.Value = e.Value;
            

            UpdatePanelEdit.Update();
            ModalPopupEdit.Show();
        }

        // Insert Event according time range selected
        protected void reserveSchedule_TimeRangeSelected(object sender, TimeRangeSelectedEventArgs e)
        {
            startTimeTxtBox.Text = e.Start.ToString("MM/dd/yyyy HH:mm");
            endTimeTxtBox.Text = e.End.ToString("MM/dd/yyyy HH:mm");
            
            UpdatePanelDetail.Update();
            ModalPopup.Show();
        }

        // Save Button in modalpoup extender
        protected void saveBtn_Click(object sender, EventArgs e)
        {
            DateTime start = DateTime.ParseExact(startTimeTxtBox.Text, "MM/dd/yyyy HH:mm", Thread.CurrentThread.CurrentCulture);
            DateTime end = DateTime.ParseExact(endTimeTxtBox.Text, "MM/dd/yyyy HH:mm", Thread.CurrentThread.CurrentCulture);
            String name = testNameTxtBox.Text;
            String tools = testToolsTxtBox.Text;

            //dbInsertEvent(start, end, name, tools);
            

            //start example from invoice registrar

            //DateTime dateToday = DateTime.UtcNow.Date;

            String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;

            string insertSQL = "INSERT INTO " + programList.SelectedValue + "ExerciseSchedule "
                + "(username, "
                + "tools, "
                + "eventStart, "
                + "eventEnd) "

                + "VALUES ('"

                + testNameTxtBox.Text + "', '"
                + testToolsTxtBox.Text + "', '"
                + start + "', '"
                + end + "')";

            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LabelSQL.Text = insertSQL;
            //end of example from invoice registrar

            ModalPopup.Hide();

           // reserveSchedule.DataSource = dbGetEvents(reserveSchedule.StartDate, reserveSchedule.Days);
            reserveSchedule.DataBind();
            UpdatePanelSchedule.Update();
        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            DateTime start = DateTime.ParseExact(editStartTxtBox.Text, "MM/dd/yyyy HH:mm", Thread.CurrentThread.CurrentCulture);
            DateTime end = DateTime.ParseExact(editEndTxtBox.Text, "MM/dd/yyyy HH:mm", Thread.CurrentThread.CurrentCulture);
            String name = testNameTxtBox.Text;
            String tools = testToolsTxtBox.Text;

            String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;

            string insertSQL = "UPDATE " + programList.SelectedValue + "ExerciseSchedule SET "
                + "username="
                + "'" + editUsernameTxtBox.Text + "', "
                + "tools="
                + "'" + toolNameList.SelectedValue + "', "
                + "eventStart="
                + "'" + start + "', "
                + "eventEnd="
                + "'" + end + "'"
                + " WHERE "
                + "Id = '" + HiddenEditID.Value + "'";

            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LabelSQL.Text = insertSQL;

            reserveSchedule.DataBind();
            UpdatePanelSchedule.Update();
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            DateTime start = DateTime.ParseExact(editStartTxtBox.Text, "MM/dd/yyyy HH:mm", Thread.CurrentThread.CurrentCulture);
            DateTime end = DateTime.ParseExact(editEndTxtBox.Text, "MM/dd/yyyy HH:mm", Thread.CurrentThread.CurrentCulture);
            String name = testNameTxtBox.Text;
            String tools = testToolsTxtBox.Text;

            String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;

            string insertSQL = "DELETE FROM " + programList.SelectedValue + "ExerciseSchedule "
                + " WHERE "
                + "Id = '" + HiddenEditID.Value + "'";

            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            LabelSQL.Text = insertSQL;

            reserveSchedule.DataBind();
            UpdatePanelSchedule.Update();
        }
   }
}