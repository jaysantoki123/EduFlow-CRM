using System;

namespace EduCRM
{
    public partial class NewApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtApplicationDate.Text =
                    DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtStudentName.Text))
            {
                lblMessage.Text = "Please enter student name.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "Please enter email address.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(txtPhone.Text))
            {
                lblMessage.Text = "Please enter phone number.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(ddlQualification.SelectedValue))
            {
                lblMessage.Text = "Please select qualification.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            if (string.IsNullOrWhiteSpace(ddlCourse.SelectedValue))
            {
                lblMessage.Text = "Please select a course.";
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
                return;
            }

            lblMessage.Text =
                "Application submitted successfully.";

            lblMessage.ForeColor =
                System.Drawing.Color.Green;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Applications.aspx");
        }
    }
}