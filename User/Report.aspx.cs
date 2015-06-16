using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pengurusan_Makmal
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dateToday = DateTime.UtcNow.Date;
            dateTxtBox.Text = dateToday.ToString("MM/dd/yyyy");
        }

        protected void sendBtn_Click(object sender, EventArgs e)
        {
            DateTime dateToday = DateTime.UtcNow.Date;

                String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;

                string insertSQL = "INSERT INTO report"
                    + "(dateReport, "
                    + "type, "
                    + "description) "

                    + "VALUES ('"

                    + dateToday.ToString("MM/dd/yyyy") + "', '"
                    + typeList.SelectedValue + "', '"
                    + describeTxtBox.Text + "')";

                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand(insertSQL, con);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            
        }
    }
}