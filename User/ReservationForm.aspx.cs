using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;

namespace Pengurusan_Makmal
{
    public partial class ReservationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void sendBtn_Click(object sender, EventArgs e)
        {

            String programListValue = programList.SelectedValue;

            if (!programListValue.Equals("select"))
            {
                DateTime dateToday = DateTime.UtcNow.Date;

                String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;


                string insertSQL = "INSERT INTO " + programListValue + " "
                    + "(username, "
                    + "sampleQuantity, "
                    + "sampleDetails, "
                    + "output, "
                    + "toolsType, "
                    + "dateReservation) "

                    + "VALUES ('"

                    + Session["currentUserID"] + "', '"
                    + amountTxtBox.Text + "', '"
                    + detailTxtBox.Text + "', '"
                    + resultTxtBox.Text + "', '"
                    + instrumentList.SelectedValue + "', '"
                    + dateTxtBox.Text + "')";

                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand(insertSQL, con);


                con.Open();
                cmd.ExecuteNonQuery();
                
                con.Close();
            }
        }

        
    }
}