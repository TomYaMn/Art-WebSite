using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Assignment
{
    public partial class Favourite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string userId = Request.QueryString["UserId"];
            string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;



            if (!this.IsPostBack)
            {

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT UserGalleryPost.Image, aspnet_Users.UserName, UserGalleryLike.GalleryPostId, UserGalleryLike.LikeTime " +
                                                                       "FROM UserGalleryLike INNER JOIN UserGalleryPost " +
                                                                       "ON UserGalleryLike.GalleryPostId = UserGalleryPost.GalleryPostId INNER JOIN " +
                                                                       "aspnet_Users ON aspnet_Users.UserId = UserGalleryPost.UserId " +
                                                                       " WHERE UserGalleryLike.UserId = '" + userId + "' AND UserGalleryLike.LikeStatus = 1 " +
                                                                       " ORDER BY UserGalleryLike.LikeTime DESC;", con))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImage.DataSource = dt;
                        gvImage.DataBind();


                    }
                }
            }
        }


        protected void Item_Command(object source, DataListCommandEventArgs e)
        {

            Label lblGalleryPostId = null;

            gvImage.SelectedIndex = e.Item.ItemIndex;
            if (gvImage.SelectedItem != null)
            {
                lblGalleryPostId = (Label)gvImage.SelectedItem.FindControl("lblGalleryPostId");
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