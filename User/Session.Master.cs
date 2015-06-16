using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pengurusan_Makmal
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetCurrentPage();
            string url = HttpContext.Current.Request.Url.AbsolutePath;
            if (Session["currentUserID"] == null)
            {
                logout.Visible = false;
                username.Visible = false;
                usernameLbl.Visible = false;
                usernameLbl.Text = null;
                login.Visible = true;
                register.Visible = true;
            }
            else
            {
                logout.Visible = true;
                username.Visible = true;
                usernameLbl.Visible = true;
                usernameLbl.Text = Session["currentUserID"].ToString();
                login.Visible = false;
                register.Visible = false;
            }
            
        }

        private void SetCurrentPage()
        {
            var pageName = GetPageName();

            switch (pageName)
            {
                case "Default.aspx":
                    HomeLink.Attributes["class"] = "active";
                    break;

                case "SearchInstrument.aspx":
                    InstrumentLink.Attributes["class"] = "active";
                    break;

                case "ReservationForm.aspx":
                    reserveLink.Attributes["class"] = "active";
                    break;

                case "Schedule.aspx":
                    scheduleLink.Attributes["class"] = "active";
                    break;

                case "Invoice.aspx":
                    invoiceLink.Attributes["class"] = "active";
                    break;

                case "Report.aspx":
                    reportLink.Attributes["class"] = "active";
                    break;
            }
        }

        private String GetPageName()
        {
            return Request.Url.ToString().Split('/').Last();
        }
    }
}
