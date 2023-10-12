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
    public partial class LogInPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Session["UserName"] = Login1.UserName;

            string constr = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
            string userId = "";
            string role = "";

            SqlConnection conMaster = new SqlConnection(constr);
            conMaster.Open();
            SqlCommand cmdSelectUserIdMaster = new SqlCommand("SELECT aspnet_Users.UserId, aspnet_Roles.RoleName FROM aspnet_Users " +
                                                              " INNER JOIN aspnet_UsersInRoles ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId" +
                                                              " INNER JOIN aspnet_Roles ON aspnet_Roles.RoleId = aspnet_UsersInRoles.RoleId" +
                                                              " WHERE UserName = @name", conMaster);

            cmdSelectUserIdMaster.Parameters.AddWithValue("@name", Session["UserName"]);

            SqlDataReader dtrUser = cmdSelectUserIdMaster.ExecuteReader();

            if (dtrUser.HasRows)// has record(s)
            {
                while (dtrUser.Read())
                {
                    userId = dtrUser["UserId"].ToString();
                    role = dtrUser["RoleName"].ToString();
                }

            }


            dtrUser.Close();
            cmdSelectUserIdMaster.Dispose();
            conMaster.Close();
            conMaster.Dispose();

            Session["UserId"] = userId;
            Session["Role"] = role;
        }
    }
}