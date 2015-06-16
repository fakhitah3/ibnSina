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

namespace ibnusina
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            String conn = WebConfigurationManager.ConnectionStrings["ibnuSinaDBConnectionStringOutsource"].ConnectionString;

            string insertSQL = "SELECT * FROM authentication WHERE username='" + usernameTxtBox.Text + "' AND password='" + passwordTxtBox.Text + "'";

            SqlConnection con = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand(insertSQL, con);


            con.Open();
            //to execute command of select and get the row of result
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                /* to read each row result
                 * while (reader.Read())
                {
                    testLabel.Text = reader.GetString(6)
                }*/
                Session.Add("currentUserID", usernameTxtBox.Text);
                Response.Redirect("Default.aspx");
            }

            con.Close();

        }
    }
}