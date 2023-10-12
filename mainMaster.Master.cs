using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Assignment
{
    public partial class mainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;



            //SqlConnection conMaster = new SqlConnection(constr);
            //conMaster.Open();
            //SqlCommand cmdSelectUserIdMaster = new SqlCommand("SELECT UserId FROM aspnet_Users where UserName = @name", conMaster);

            //cmdSelectUserIdMaster.Parameters.AddWithValue("@name", Session["UserName"]);
            //userId = cmdSelectUserIdMaster.ExecuteScalar().ToString();


            //cmdSelectUserIdMaster.Dispose();
            //conMaster.Close();
            //conMaster.Dispose();
            string userId;
            
            try
            {
                userId = Session["UserId"].ToString();
                Response.Redirect("Favourite.aspx?UserId=" + userId);
            }
            catch (NullReferenceException)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Make sure to have already log in to your accout ;)')", true);
            }
            
            
        }

        protected void ImageButtonCart_Click(object sender, ImageClickEventArgs e)
        {

            string userId;
            try
            {
                userId = Session["UserId"].ToString();
                Response.Redirect("Cart.aspx?UserId=" + userId);
            }
            catch (NullReferenceException)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Make sure to have already log in to your accout ;)')", true);
            }
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Clear();
        }
    }
}