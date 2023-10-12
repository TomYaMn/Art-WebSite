using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Prime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Control ctlControl;
            string role = "";//remeber to change this back to ""
            try
            {
                role = Session["Role"].ToString();
            }
            catch (NullReferenceException)
            {
                role = "0";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You Are not a primium user, so will not be able to access our latest props')", true);
            }

            if ((role.ToUpper()) == "PREMIUM")
            {
                ctlControl = LoadControl("PrimeUserControl.ascx");
            }
            else
            {
                ctlControl = LoadControl("NonPrimeUserControl.ascx");
            }

            plhFeature.Controls.Add(ctlControl);
        }
    }
}