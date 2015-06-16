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


namespace Admin.Penolong_Pendaftar
{
    
    public partial class invoice : System.Web.UI.Page
    {
        static String usernameString = null;
        static int quantityOfSampleString;
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dateToday = DateTime.UtcNow.Date;
            dateTxtBox.Text = dateToday.ToString("MM/dd/yyyy");
            invoicePanel.Visible = false;
        }

        protected void programList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListOfReservation.SelectCommand = ("SELECT username, sampleQuantity, output, toolsType, status, dateReservation FROM " + programList.SelectedValue);
            DetailsViewOfReservation.SelectCommand = ("SELECT sampleQuantity, sampleDetails, output, toolsType, status, review, dateReservation FROM " + programList.SelectedValue);

            DataView dv = (DataView)ListOfReservation.Select(DataSourceSelectArguments.Empty);
            DataTable dt = dv.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            foreach (DataRow dr in dv.Table.Rows)
            {
                usernameString = dr["username"].ToString();
                quantityOfSampleString = Convert.ToInt32(dr["sampleQuantity"].ToString());
            }
        }

        protected void calculateBtn_Click(object sender, EventArgs e)
        {
            DateTime dateToday = DateTime.UtcNow.Date;

            String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;

            string insertSQL = "INSERT INTO " + programList.SelectedValue + "Invoice "
                + "(dateInvoice, "
                + "totalAmount, "
                + "username) "

                + "VALUES ('"

                + dateToday.ToString("MM/dd/yyyy") + "', '"
                + totalAmountLabel.Text + "', '"
                + usernameString + "')";

            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(insertSQL, con);


            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void priceTxtBox_TextChanged(object sender, EventArgs e)
        {
            int total = 0;
            int textBoxValue = Convert.ToInt32(priceTxtBox.Text);
            total = quantityOfSampleString * textBoxValue;
            totalAmountLabel.Text = total.ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            invoicePanel.Visible = true;
        }
    }
}