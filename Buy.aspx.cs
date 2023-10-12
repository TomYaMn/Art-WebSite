using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

namespace Assignment
{
    public partial class Buy : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        string userId;
        char CartStatus;



        protected void Page_Load(object sender, EventArgs e)
        {
            string artId = Request.QueryString["ArtId"];

            if (!this.IsPostBack)
            {

                string postArtId = null;
                string strSearch = "SELECT * FROM UserArtItem WHERE ArtId = '" + artId + "'";

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

                SqlConnection conn;
                conn = new SqlConnection(constr);
                conn.Open();


                SqlCommand cmdSelectArt = new SqlCommand(strSearch, conn);

                SqlDataReader dtrBuyArt = cmdSelectArt.ExecuteReader();

                if (dtrBuyArt.HasRows)// has record(s)
                {
                    while (dtrBuyArt.Read())
                    {



                        lblImageName.Text = dtrBuyArt["ArtName"].ToString();

                        lblPrice.Text = dtrBuyArt["ArtPrice"].ToString();

                        postArtId = dtrBuyArt["ArtId"].ToString();
                    }

                }

                SqlConnection connn;

                connn = new SqlConnection(constr);

                connn.Open();


                SqlCommand cmdSelectMemberShip = new SqlCommand("SELECT MS.Email, U.UserName, R.RoleName,AI.PostDate, AI.ArtPrice FROM aspnet_MemberShip MS " +
                                                                " INNER JOIN aspnet_Users U ON MS.UserId = U.UserId INNER JOIN aspnet_UsersInRoles UIR " +
                                                                " ON UIR.UserId = MS.UserId INNER JOIN aspnet_Roles R ON U.UserId = UIR.UserId " +
                                                                " INNER JOIN UserArtItem AI ON AI.UserId = U.UserId " +
                                                                " WHERE AI.ArtId = " + artId + " AND UIR.RoleId = R.RoleId; ", connn);

                SqlDataReader dtrMemberShip = cmdSelectMemberShip.ExecuteReader();
                if (dtrMemberShip.HasRows)// has record(s)
                {
                    while (dtrMemberShip.Read())
                    {
                        lblEmail.Text = dtrMemberShip["Email"].ToString();

                        lblUserName.Text = dtrMemberShip["UserName"].ToString();

                        lblPostDate.Text = dtrMemberShip["PostDate"].ToString();

                        lblRole.Text = dtrMemberShip["RoleName"].ToString();
                    }

                }
                cmdSelectArt.Dispose();
                cmdSelectMemberShip.Dispose();

                dtrBuyArt.Close();
                dtrBuyArt.Dispose();
                conn.Close();
                conn.Dispose();
                connn.Close();
                connn.Dispose();


            }

            SqlConnection connnn;
            connnn = new SqlConnection(constr);
            connnn.Open();
            SqlCommand cmdSelectLike = new SqlCommand("SELECT UAIC.CartStatus,U.UserId FROM UserArtItemCart UAIC " +
                                                      " INNER JOIN aspnet_Users U ON U.UserId = UAIC.UserId " +
                                                      " INNER JOIN UserArtItem UAI ON UAI.ArtId = UAIC.ArtId " +
                                                      " WHERE U.UserName = @name " + "  AND UAI.ArtId = @postId", connnn);

            cmdSelectLike.Parameters.AddWithValue("@name", Session["UserName"]);
            cmdSelectLike.Parameters.AddWithValue("@postId", artId);
            SqlDataReader dtrUserLike = cmdSelectLike.ExecuteReader();
            if (dtrUserLike.HasRows)// has record(s)
            {
                while (dtrUserLike.Read())
                {
                    userId = dtrUserLike["UserId"].ToString();

                    CartStatus = Convert.ToChar(dtrUserLike["CartStatus"]);


                }

            }
            dtrUserLike.Close();
            dtrUserLike.Dispose();
            connnn.Close();
            connnn.Dispose();

            switch (CartStatus)
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
            SqlCommand cmdSelectLikeCount = new SqlCommand("SELECT COUNT(CartStatus) FROM UserArtItemCart " +
                                                            "WHERE ArtId = '" + artId +
                                                            "' AND CartStatus = '1';", connnnn);

            lblLikeCount.Text = cmdSelectLikeCount.ExecuteScalar().ToString();

            connnnn.Close();
            connnnn.Dispose();

        }
        protected void AddToCart(object sender, EventArgs e)
        {

        }
        protected void AddToCart(String p_postedImageFileName, String e)
        {
            string artId = Request.QueryString["ArtId"];

            string strSearch = "SELECT * FROM UserArtItem WHERE ArtId = '" + artId + "'";


            //this is to select to get the picture from the GalleryPost table
            using (SqlConnection conn = new SqlConnection(constr))
            {

                using (SqlDataAdapter sda = new SqlDataAdapter(strSearch, conn))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    gvImages.DataSource = dt;
                    gvImages.DataBind();


                }


            }

            int Id;
            string strID = "SELECT CartArtId FROM cartFiles ORDER BY CartArtId DESC";
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmdID = new SqlCommand(strID, con);
            con.Open();
            if (cmdID.ExecuteScalar() == null)
            {
                Id = 1001;
            }
            else
            {
                Id = (int)cmdID.ExecuteScalar();
                Id++;
            }
            con.Close();


            using (SqlConnection conn = new SqlConnection(constr))
            {
                string sql = "INSERT INTO CartFiles VALUES(@CartArtId, @CartArtName, @CartArtData, @CartArtPrice, @CartArtistName)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@CartArtId", Id);
                    cmd.Parameters.AddWithValue("@CartArtName", lblImageName.Text);
                    cmd.Parameters.AddWithValue("@CartArtData", gvImages.DataSource);
                    cmd.Parameters.AddWithValue("@CartArtPrice", lblPrice.Text);
                    cmd.Parameters.AddWithValue("@CartArtistName", lblUserName.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void ButtonCart_Click(object sender, ImageClickEventArgs e)
        {
            string artId = Request.QueryString["ArtId"];

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

            switch (CartStatus)
            {
                case '1':
                    cmdInsertOrUpdate = new SqlCommand("UPDATE UserArtItemCart SET CartStatus = 0, CartTime = @Cart_date" + " WHERE UserId ='" + userId +
                                                        "' AND ArtId = '" + artId + "'", conn);

                    cmdInsertOrUpdate.Parameters.Add("@Cart_date", SqlDbType.DateTime).Value = DateTime.Now;
                    cmdInsertOrUpdate.ExecuteNonQuery();


                    break;

                case '0':
                    cmdInsertOrUpdate = new SqlCommand("UPDATE UserArtItemCart SET CartStatus = 1, CartTime = @Cart_date" + " WHERE UserId ='" + userId +
                                                        "' AND ArtId = '" + artId + "'", conn);

                    cmdInsertOrUpdate.Parameters.Add("@Cart_date", SqlDbType.DateTime).Value = DateTime.Now;
                    cmdInsertOrUpdate.ExecuteNonQuery();

                    break;

                default:
                    cmdInsertOrUpdate = new SqlCommand("Insert Into UserArtItemCart(UserId, artId, CartStatus, CartTime) Values(@uid,@aid,1,SYSDATETIME())", conn);
                    cmdInsertOrUpdate.Parameters.AddWithValue("@uid", userId);
                    cmdInsertOrUpdate.Parameters.AddWithValue("@aid", artId);

                    cmdInsertOrUpdate.ExecuteNonQuery();

                    break;
            }

            con.Close();
            con.Dispose();
            conn.Close();
            conn.Dispose();

            Response.Redirect("ArtPiece.aspx?ArtId=" + artId);
        }

        protected void BuyNow(object sender, EventArgs e)
        {
            string artId = Request.QueryString["ArtId"];

            Response.Redirect("payment.aspx?PurchaseType=ArtItem&ArtId=" + artId + "&Price=" + lblPrice.Text);
        }

        protected void ButtonCart_Click(object sender, EventArgs e)
        {
            string artId = Request.QueryString["ArtId"];

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

            switch (CartStatus)
            {
                case '1':
                    cmdInsertOrUpdate = new SqlCommand("UPDATE UserArtItemCart SET CartStatus = 0, CartTime = @Cart_date" + " WHERE UserId ='" + userId +
                                                        "' AND ArtId = '" + artId + "'", conn);

                    cmdInsertOrUpdate.Parameters.Add("@Cart_date", SqlDbType.DateTime).Value = DateTime.Now;
                    cmdInsertOrUpdate.ExecuteNonQuery();

                    break;

                case '0':
                    cmdInsertOrUpdate = new SqlCommand("UPDATE UserArtItemCart SET CartStatus = 1, CartTime = @Cart_date" + " WHERE UserId ='" + userId +
                                                        "' AND ArtId = '" + artId + "'", conn);

                    cmdInsertOrUpdate.Parameters.Add("@Cart_date", SqlDbType.DateTime).Value = DateTime.Now;
                    cmdInsertOrUpdate.ExecuteNonQuery();

                    break;

                default:
                    cmdInsertOrUpdate = new SqlCommand("Insert Into UserArtItemCart(UserId, artId, CartStatus, CartTime) Values(@uid,@aid,1,SYSDATETIME())", conn);
                    cmdInsertOrUpdate.Parameters.AddWithValue("@uid", userId);
                    cmdInsertOrUpdate.Parameters.AddWithValue("@aid", artId);

                    cmdInsertOrUpdate.ExecuteNonQuery();

                    break;
            }

            con.Close();
            con.Dispose();
            conn.Close();
            conn.Dispose();

            Response.Redirect("Buy.aspx?ArtId=" + artId);
        }
    }
}