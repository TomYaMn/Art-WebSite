using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace Assignment
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //buy jiu pass price, artid
            Control ctlControl;
            string purchaseType = Request.QueryString["PurchaseType"];
            string price = Request.QueryString["Price"];
            //string purchaseType = "Premium";
            //string price = "150";


            if ((purchaseType.ToUpper()) == "PREMIUM")
            {
                ctlControl = LoadControl("PremiumPurchaseUserControl.ascx");
                plhFeature.Controls.Add(ctlControl);
            }
            else if((purchaseType.ToUpper()) == "ARTITEM")
            {
                ctlControl = LoadControl("ArtItemPurchaseUserControl.ascx");
                plhFeature.Controls.Add(ctlControl);
            }
            else
            {
                Response.Redirect("MainPage.aspx?");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something Wrong happen')", true);
            }

            lblPrice.Text = price;
            txtPrice.Text = price;
        }

        protected void Pay_Click(object sender, EventArgs e)
        {
            String purchaseId = Guid.NewGuid().ToString();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            string purchaseType = Request.QueryString["PurchaseType"];
            string artId = Request.QueryString["ArtId"];

            //Response.Redirect("payment.aspx?PurchaseType=ArtItem&ArtId=" +  +"&Price=" + );
            SqlConnection con;
            con = new SqlConnection(constr);
            con.Open();


            SqlCommand cmdInsert = new SqlCommand("insert into UserPurchase "
            + "(PurchaseId, Name, PurchaseType, ArtId, PurchaseDate, PurchaseAmount, CardType, CreditCardNo, CVV, UserId) values " +
            "(@id,@name, @type,NULL,SYSDATETIME(),@pa,@ct,@ccn,@cvv,@user)", con);
            //"(@id,@name, @type,@aid,SYSDATETIME(),@pa,@ct,@ccn,@cvv,@user)", con);

            cmdInsert.Parameters.AddWithValue("@id", purchaseId);
            cmdInsert.Parameters.AddWithValue("@name", txtName.Text);
            cmdInsert.Parameters.AddWithValue("@type", purchaseType);
            cmdInsert.Parameters.AddWithValue("@aid", artId);
            cmdInsert.Parameters.AddWithValue("@pa", txtAmount.Text);
            cmdInsert.Parameters.AddWithValue("@ct", ddlCardType.SelectedValue);
            cmdInsert.Parameters.AddWithValue("@ccn", txtCreditCardNumber.Text);
            cmdInsert.Parameters.AddWithValue("@cvv", txtCVV.Text);
            cmdInsert.Parameters.AddWithValue("@user", Session["UserId"]);
            int a = cmdInsert.ExecuteNonQuery();
            if (a > 0)
            {
                //SqlConnection conn;
                //conn = new SqlConnection(constr);
                //conn.Open();
                ////Guid rid = new Guid("23346cdf - 3eba - 45a5 - 9cf9 - f28f5bb6b70f");
                //string rid = "23346cdf - 3eba - 45a5 - 9cf9 - f28f5bb6b70f";
                //SqlCommand cmdUpdate = new SqlCommand("UPDATE aspnet_UsersInRoles SET RoleId = CONVERT(uniqueidentifier, @r) WHERE UserId = @uid", conn);
                //cmdUpdate.Parameters.AddWithValue("@r", rid);
                //cmdUpdate.Parameters.AddWithValue("@uid", Session["UserId"]);
                //cmdUpdate.ExecuteNonQuery();



                Response.Redirect("Gallery.aspx");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Payment Successful')", true);

                //conn.Close();
                //conn.Dispose();
                //cmdInsert.Dispose();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Upload failed, please check whether the value inserted is corrected or not')", true);
            }


            con.Close();
            con.Dispose();

            cmdInsert.Dispose();

        }
    }
}