using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Pengurusan_Makmal
{
    public partial class ManageInstrument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             
            if(!IsPostBack)
            {
                BindInstrumentDetails("");
            }
        }
        
        protected void BindInstrumentDetails(string tools)
        {
            IbnSina.localhost.Service1 instrumentDetails = new IbnSina.localhost.Service1();
            DataSet dsresult = new DataSet();
            XmlElement exelement = instrumentDetails.GetInstrument(tools);

            if(exelement!=null)
            {
                XmlNodeReader nodereader = new XmlNodeReader(exelement);
                dsresult.ReadXml(nodereader, XmlReadMode.Auto);
                InstrumentDetailsList.DataSource = dsresult;
                InstrumentDetailsList.DataBind();
            }
            else
            {
                InstrumentDetailsList.DataSource = null;
                InstrumentDetailsList.DataBind();   
            }
        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            BindInstrumentDetails(txtInstrument.Text);
        }
        
    }
}