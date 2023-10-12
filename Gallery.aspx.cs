using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

//using System.Drawing;
//using System.ComponentModel;
//using System.Web.UI.HtmlControls;

namespace Assignment
{
    public partial class Gallery : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!this.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM UserGalleryPost", conn))
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
                //DataRowView dr = (DataRowView)e.Row.DataItem;
                //string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Image"]);

            }

        }


        protected void Upload(object sender, EventArgs e)
        {

        }


        protected void Item_Command(object source, DataListCommandEventArgs e)
        {

            Label lblGalleryPostId = null;

            gvImages.SelectedIndex = e.Item.ItemIndex;
            if (gvImages.SelectedItem != null)
            {
                lblGalleryPostId = (Label)gvImages.SelectedItem.FindControl("lblGalleryPostId");
            }
            else
            {
                Response.Redirect("MainPage.aspx");
            }




            Response.Redirect("ArtPiece.aspx?GalleryPostId=" + lblGalleryPostId.Text);
        }
        protected void btnImage_Click(object sender, ImageClickEventArgs e)
        {


        }
    }
 }

