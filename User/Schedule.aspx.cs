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

namespace Pengurusan_Makmal
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Update database event
        private void dbUpdateEvent(String id, DateTime start, DateTime end)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [chemistryExerciseSchedule] SET eventStart = @start, eventEnd = @end WHERE Id = @id", con);
                cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("start", start);
                cmd.Parameters.AddWithValue("end", end);
                cmd.ExecuteNonQuery();
            }
        }

        //Populate the fields
        protected void reserveSchedule_EventClick(object sender, EventClickEventArgs e)
        {
            editUsernameTxtBox.Text = e.Text;
            editToolsNameTxtBox.Text = e.Text;
            editStartTxtBox.Text = e.Start.ToString("MM/dd/yyyy HH:mm");
            editEndTxtBox.Text = e.End.ToString("MM/dd/yyyy HH:mm");
            HiddenEditID.Value = e.Value;

            UpdatePanelEdit.Update();
            ModalPopupEdit.Show();
        }

        protected void reserveCalendar_SelectionChanged(object sender, EventArgs e)
        {
            reserveSchedule.StartDate = DayPilot.Utils.Week.FirstDayOfWeek(reserveCalendar.SelectedDate);
            //Select full week in Calender control
            for (int i = 0; i < 7; i++)
            {
                DateTime selected = reserveSchedule.StartDate.AddDays(i);
                reserveCalendar.SelectedDates.Add(selected);
            }
            reserveSchedule.DataBind();
        }

        protected void reserveSchedule_EventMove(object sender, EventMoveEventArgs e)
        {
            dbUpdateEvent(e.Value, e.NewStart, e.NewEnd);
            reserveSchedule.DataSource = dbGetEvents(reserveSchedule.StartDate, reserveSchedule.Days);
            reserveSchedule.DataBind();
            reserveSchedule.Update();

            
        }

        // Extract the data
        private DataTable dbGetEvents(DateTime start, int days)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT [Id], [fName], [eventStart], [eventEnd] FROM [chemistryExerciseSchedule] WHERE NOT (([eventEnd] <= @start) OR ([eventStart] >= @end))", ConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString);

            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days));

            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

 
    }
}