using System;

namespace EduCRM
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                lblMessage.Text = "Please enter your full name.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "Please enter your email address.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                lblMessage.Text = "Please enter your phone number.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            lblMessage.Text = "Profile updated successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}