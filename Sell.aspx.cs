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
    public partial class Sell : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
        protected void Upload(object sender, EventArgs e)
        {
            byte[] bytes;
            using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
            {
                bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
            }
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            int Id;
            string strID = "SELECT ArtId FROM UserArtItem ORDER BY ArtId DESC";
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
                string sql = "INSERT INTO UserArtItem VALUES(@ArtId, @ArtName, @ArtData, @ArtPrice, @UserId, @PostDate)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@ArtId", Id);
                    cmd.Parameters.AddWithValue("@ArtName", ArtName.Text);
                    cmd.Parameters.AddWithValue("@ArtData", bytes);
                    cmd.Parameters.AddWithValue("@ArtPrice", price.Text);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                    cmd.Parameters.Add("@PostDate", SqlDbType.DateTime).Value = DateTime.Now;


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}