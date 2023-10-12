using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

using System.IO;
using System.Data;

namespace Assignment
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string userId = null;
        public SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }
        public void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new SqlConnection(constr);
            con.Open();

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            Style styleOkay = createStyleForControl(Color.White, Color.Black, true);

            if (!FileUpload1.HasFile)
            {
                lblError.Visible = true;
                lblError.Text = "Please Select Image File";

            }
            else
            {

                String newImageId = Guid.NewGuid().ToString();
                byte[] bytes;
                using (BinaryReader br = new BinaryReader(FileUpload1.PostedFile.InputStream))
                {
                    bytes = br.ReadBytes(FileUpload1.PostedFile.ContentLength);
                }




                //get the user id on the User table using ExecuteScalar
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();

                SqlConnection con,conn;
                con = new SqlConnection(constr);
                con.Open();

                

                SqlCommand cmdSelect = new SqlCommand("Select UserId from aspnet_Users where UserName = @name", con);

                cmdSelect.Parameters.AddWithValue("@name", Session["UserName"]);
                string userId = cmdSelect.ExecuteScalar().ToString();




                //insert all the information needed to UsergalleryPost table (including the userid we get jn)
                conn = new SqlConnection(constr);
                conn.Open();
                SqlCommand cmdInsert = new SqlCommand("insert into UserGalleryPost "
                + "(GalleryPostId,Image,ImageName,ImageDescription,UserId) values (@ImageId,@photo, @name,@photoDescription,@user)", conn);

                cmdInsert.Parameters.AddWithValue("@ImageId", newImageId);
                cmdInsert.Parameters.AddWithValue("@photo", bytes);
                cmdInsert.Parameters.AddWithValue("@name", txtImageName.Text);
                cmdInsert.Parameters.AddWithValue("@photoDescription", txtImageDescription.Text);
                cmdInsert.Parameters.AddWithValue("@user", userId);
                int a = cmdInsert.ExecuteNonQuery();

                if (a > 0)
                {
                    Response.Redirect("Gallery.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Upload failed, please check whether the value inserted is corrected or not')", true);
                }

                con.Close();
                con.Dispose();
                conn.Close();
                conn.Dispose();
                cmdSelect.Dispose();
                cmdInsert.Dispose();
                Response.Redirect("Gallery.aspx");
            }
        }

        protected Style createStyleForControl(Color _forecolor, Color _backcolor, bool _fontbold)
        {
            Style s = new Style();
            s.ForeColor = _forecolor;
            s.BackColor = _backcolor;
            s.Font.Bold = _fontbold;
            return s;
        }
    }
}