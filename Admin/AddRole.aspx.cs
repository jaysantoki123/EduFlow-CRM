using System;

namespace EduCRM
{
    public partial class AddRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtRoleName.Text))
            {
                lblMessage.Text = "Please enter role name.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            lblMessage.Text = "Role created successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}