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
    public partial class ArtPiece : System.Web.UI.Page
    {

        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string userId;
        char likeStatus;
        protected void Page_Load(object sender, EventArgs e)
        {
            string galleryPostId = Request.QueryString["GalleryPostId"];

            if (!this.IsPostBack)
            {

                
                //string galleryPostId = "d7cd8ae8-c5fb-475d-b42b-0d4217c22fee";

                

                string galleryPostUserId = null;
                string strSearch = "SELECT * FROM UserGalleryPost WHERE GalleryPostId = '" + galleryPostId + "'";
                

                //this is to select to get the picture from the GalleryPost table
                using (SqlConnection con = new SqlConnection(constr))
                {

                    using (SqlDataAdapter sda = new SqlDataAdapter(strSearch, con))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvImages.DataSource = dt;
                        gvImages.DataBind();


                    }


                }


                //this is to select to get the specific data from GalleryPost table (should combine with the upper one)
                SqlConnection conn;
                conn = new SqlConnection(constr);
                conn.Open();
                SqlCommand cmdSelectGalleryPost = new SqlCommand(strSearch, conn);

                SqlDataReader dtrUserGallery = cmdSelectGalleryPost.ExecuteReader();

                if (dtrUserGallery.HasRows)// has record(s)
                {
                    while (dtrUserGallery.Read())
                    {
                        lblImageName.Text = dtrUserGallery["ImageName"].ToString();

                        lblImageDescription.Text = dtrUserGallery["ImageDescription"].ToString();

                        galleryPostUserId = dtrUserGallery["UserId"].ToString();
                    }

                }



                //this to select the user data from the asp_users, and aspnet_membership, role table (should be combine with the upper one)
                SqlConnection connn;

                connn = new SqlConnection(constr);

                connn.Open();

                SqlCommand cmdSelectMemberShip = new SqlCommand("SELECT MS.Email, MS.LastLoginDate, U.UserName, R.RoleName FROM aspnet_MemberShip MS" +
                                                                " INNER JOIN aspnet_Users U ON MS.UserId = U.UserId INNER JOIN aspnet_UsersInRoles UIR" +
                                                                " ON UIR.UserId = MS.UserId INNER JOIN aspnet_Roles R ON U.UserId = UIR.UserId" +
                                                                " WHERE MS.UserId ='" + galleryPostUserId + "' AND UIR.RoleId = R.RoleId;", connn);

                SqlDataReader dtrMemberShip = cmdSelectMemberShip.ExecuteReader();
                if (dtrMemberShip.HasRows)// has record(s)
                {
                    while (dtrMemberShip.Read())
                    {
                        lblEmail.Text = dtrMemberShip["Email"].ToString();

                        lblLastLoginDate.Text = dtrMemberShip["LastLoginDate"].ToString();

                        lblUserName.Text = dtrMemberShip["UserName"].ToString();

                        lblRole.Text = dtrMemberShip["RoleName"].ToString();
                    }

                }

                

                cmdSelectGalleryPost.Dispose();
                cmdSelectMemberShip.Dispose();
                //cmdSelectUser.Dispose();

                dtrUserGallery.Close();
                dtrUserGallery.Dispose();
                conn.Close();
                conn.Dispose();
                connn.Close();
                connn.Dispose();


            }

            SqlConnection connnn;
            connnn = new SqlConnection(constr);
            connnn.Open();
            SqlCommand cmdSelectLike = new SqlCommand("SELECT UGL.LikeStatus,U.UserId FROM UserGalleryLike UGL" +
                                                      " INNER JOIN aspnet_Users U ON U.UserId = UGL.UserId" +
                                                      " INNER JOIN UserGalleryPost UGP ON UGP.GalleryPostId = UGL.GalleryPostId" +
                                                      " WHERE U.UserName = @name" +
                                                      " AND UGP.GalleryPostId = @postId", connnn);

            cmdSelectLike.Parameters.AddWithValue("@name", Session["UserName"]);
            cmdSelectLike.Parameters.AddWithValue("@postId", galleryPostId);
            SqlDataReader dtrUserLike = cmdSelectLike.ExecuteReader();
            if (dtrUserLike.HasRows)// has record(s)
            {
                while (dtrUserLike.Read())
                {
                    userId = dtrUserLike["UserId"].ToString();

                    likeStatus = Convert.ToChar(dtrUserLike["LikeStatus"]);


                }

            }
            dtrUserLike.Close();
            dtrUserLike.Dispose();
            connnn.Close();
            connnn.Dispose();

            switch (likeStatus)
            {
                case '1':
                    ButtonLIke.CssClass = "like";
                    break;

                case '0':
                    ButtonLIke.CssClass = "unlike";
                    break;

                default:
                    ButtonLIke.CssClass = "unlike";
                    break;
            }





            SqlConnection connnnn;
            connnnn = new SqlConnection(constr);
            connnnn.Open();
            SqlCommand cmdSelectLikeCount = new SqlCommand("SELECT COUNT(LikeStatus) FROM UserGalleryLike " +
                                                            "WHERE GalleryPostId = '" + galleryPostId +
                                                            "' AND LikeStatus = '1';", connnnn);

            lblLikeCount.Text = cmdSelectLikeCount.ExecuteScalar().ToString();

            connnnn.Close();
            connnnn.Dispose();
        }

        protected void ButtonLIke_Click(object sender, ImageClickEventArgs e)
        {
            //int intInsertStatus = 0;

            string galleryPostId = Request.QueryString["GalleryPostId"];

            SqlConnection con;
            SqlConnection conn;
            con = new SqlConnection(constr);
            conn = new SqlConnection(constr);
            con.Open();
            conn.Open();
            
            
            SqlCommand cmdInsertOrUpdate;
            SqlCommand cmdSelectUser = new SqlCommand("SELECT UserId FROM aspnet_Users where UserName = @name", con);

            cmdSelectUser.Parameters.AddWithValue("@name", Session["UserName"]);
            userId = cmdSelectUser.ExecuteScalar().ToString();

            switch (likeStatus)
            {
                case '1':
                    cmdInsertOrUpdate = new SqlCommand("UPDATE UserGalleryLike SET LikeStatus = 0, LikeTime = @like_date" + " WHERE UserId ='" + userId +
                                                        "' AND GalleryPostId = '" + galleryPostId + "'", conn);
                    //intInsertStatus
                    cmdInsertOrUpdate.Parameters.Add("@like_date", SqlDbType.DateTime).Value = DateTime.Now;
                    cmdInsertOrUpdate.ExecuteNonQuery();

                    //MessageBoxShow("Removed from favourite!");
                    //Response.Write("<script>alert('" + "Removed from favourite" + "') ; location.href='ArtPiece.aspx'</script>");
                    break;

                case '0':
                    cmdInsertOrUpdate = new SqlCommand("UPDATE UserGalleryLike SET LikeStatus = 1, LikeTime = @like_date" + " WHERE UserId ='" + userId +
                                                        "' AND GalleryPostId = '" + galleryPostId + "'", conn);
                    //intInsertStatus =
                    cmdInsertOrUpdate.Parameters.Add("@like_date", SqlDbType.DateTime).Value = DateTime.Now;
                    cmdInsertOrUpdate.ExecuteNonQuery();

                    //MessageBoxShow("Added to favourite!");
                    //Response.Write("<script>alert('" + "Added to favourite" + "') ; location.href='ArtPiece.aspx'</script>");
                    break;

                default:
                    cmdInsertOrUpdate = new SqlCommand("Insert Into UserGalleryLike(UserId, GalleryPostId, LikeStatus, LikeTime) Values(@uid,@gpid,1,SYSDATETIME())", conn);
                    cmdInsertOrUpdate.Parameters.AddWithValue("@uid", userId);
                    cmdInsertOrUpdate.Parameters.AddWithValue("@gpid", galleryPostId);
                    //intInsertStatus = 
                    cmdInsertOrUpdate.ExecuteNonQuery();

                    //MessageBoxShow("Added to favourite!");
                    //Response.Write("<script>alert('Added to favourite');</script>");
                    break;
            }

            con.Close();
            con.Dispose();
            conn.Close();
            conn.Dispose();

            Response.Redirect("ArtPiece.aspx?GalleryPostId=" + galleryPostId);
        }


        //discarded features
        //private void MessageBoxShow(string message)
        //{
        //    this.AlertBoxMessage.InnerText = message;
        //    this.AlertBox.Visible = true;
        //}
    }
}