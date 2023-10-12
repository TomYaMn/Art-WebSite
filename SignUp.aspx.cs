using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Assignment
{
    public partial class SignUp : System.Web.UI.Page
    {
        string nameTextBox;
        protected void Page_Load(object sender, EventArgs e)
        {


            //if (!IsPostBack)
            //{
            //    Roles.CreateRole("user");
            //    Roles.CreateRole("artist");
            //    Roles.CreateRole("premium");
            //    Roles.CreateRole("admin");
            //}
            

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            string role = RadioButtonList1.SelectedValue;
            nameTextBox = CreateUserWizard1.UserName.ToString();
            if (role == "")
            {
                
                lblRoleErrorMessage.Text = "Please select a role for your account";
            }
            else
            {
                Roles.AddUserToRole(nameTextBox, role);
            }
         
            
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
        }
    }
}