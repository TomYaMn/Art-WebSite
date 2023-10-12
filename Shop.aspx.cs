using System;

using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Assignment
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userId = Request.QueryString["UserId"];
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            if (!this.IsPostBack)
            {

                using (SqlConnection conn = new SqlConnection(constr))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM UserArtItem", conn))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();


                    }
                }
            }

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

            }

        }


        protected void Upload(object sender, EventArgs e)
        {

        }


        protected void Item_Command(object source, DataListCommandEventArgs e)
        {
            Label lblArtId = null;

            gvImages.SelectedIndex = e.Item.ItemIndex;
            if (gvImages.SelectedItem != null)
            {
                lblArtId = (Label)gvImages.SelectedItem.FindControl("lblArtId");
            }
            else
            {
                Response.Redirect("MainPage.aspx");
            }

            Response.Redirect("Buy.aspx?ArtId=" + lblArtId.Text);
        }
        protected void btnImage_Click(object sender, ImageClickEventArgs e)
        {

        }
        protected void gvImages_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}