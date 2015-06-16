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

//for date

namespace ibnusina
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime dateToday = DateTime.UtcNow.Date;
            registerTxtBox.Text = dateToday.ToString("MM/dd/yyyy");
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            String password1 = passwordTxtBox.Text;
            String password2 = confirmTxtBox.Text;
            //checking to make sure the password is same
            if (password1.Equals(password2))
            {
                DateTime dateToday = DateTime.UtcNow.Date;

                String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;

                string insertSQL = "INSERT INTO authentication "
                    + "(username, "
                    + "password, "
                    + "fName, "
                    + "lName, "
                    + "icNum, "
                    + "address, "
                    + "phone, "
                    + "dateRegister, "
                    + "status, "
                    + "dateEndStudies, "
                    + "agencyName, "
                    + "program, "
                    + "projectTitle, "
                    + "projectLeader, "
                    + "projectSupervisor, "
                    + "votNumber, "
                    + "votBalance, "
                    + "votExpiryDate) "
                    
                    + "VALUES ('" 

                    + idTxtBox.Text + "', '" 
                    + passwordTxtBox.Text + "', '" 
                    + fNameTxtBox.Text + "', '" 
                    + lNameTxtBox.Text + "', '" 
                    + icTxtBox.Text + "', '" 
                    + addressTxtBox.Text + "', '" 
                    + phoneLabel.Text + "', '" 
                    + dateToday.ToString("MM/dd/yyyy") + "', '" 
                    + statusList.Text + "', '" 
                    + graduateTxtBox.Text + "', '" 
                    + agentTxtBox.Text + "', '" 
                    + programList.Text + "', '" 
                    + titleTxtBox.Text + "', '" 
                    + headTxtBox.Text + "', '" 
                    + svTxtBox.Text + "', '" 
                    + votTxtBox.Text + "', '" 
                    + balanceTxtBox.Text + "', '" 
                    + dueTxtBox.Text + "')";

                SqlConnection con = new SqlConnection(conn);
                SqlCommand cmd = new SqlCommand(insertSQL, con);


                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}