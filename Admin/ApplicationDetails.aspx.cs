using System;

namespace EduCRM
{
    public partial class ApplicationDetails : System.Web.UI.Page
    {
        public string ApplicationId { get; set; }
        public string ApplicationDate { get; set; }
        public string Course { get; set; }
        public string Status { get; set; }

        public string StudentName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string DateOfBirth { get; set; }

        public string Qualification { get; set; }
        public string PassingYear { get; set; }
        public string Percentage { get; set; }
        public string Institution { get; set; }

        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Pincode { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string applicationId = Request.QueryString["id"];

                if (string.IsNullOrEmpty(applicationId))
                {
                    Response.Redirect("~/Admin/Applications.aspx");
                    return;
                }

                LoadApplicationDetails(applicationId);
            }
        }

        private void LoadApplicationDetails(string applicationId)
        {
            if (applicationId == "APP-10254")
            {
                // AARAV SHAH

                ApplicationId = "APP-10254";
                ApplicationDate = "28 Sep 2026";
                Course = "Computer Engineering";
                Status = "Approved";

                StudentName = "Aarav Shah";
                Email = "aarav@example.com";
                Phone = "+91 98765 43210";
                DateOfBirth = "15 May 2007";

                Qualification = "12th Standard";
                PassingYear = "2026";
                Percentage = "88%";
                Institution = "ABC Higher Secondary School";

                Address = "123 Main Road";
                City = "Rajkot";
                State = "Gujarat";
                Pincode = "360001";
            }
            else if (applicationId == "APP-10253")
            {
                // PRIYA SHAH

                ApplicationId = "APP-10253";
                ApplicationDate = "27 Sep 2026";
                Course = "Information Technology";
                Status = "Under Review";

                StudentName = "Priya Shah";
                Email = "priya@example.com";
                Phone = "+91 98765 43211";
                DateOfBirth = "22 July 2007";

                Qualification = "12th Standard";
                PassingYear = "2026";
                Percentage = "91%";
                Institution = "XYZ Higher Secondary School";

                Address = "45 University Road";
                City = "Rajkot";
                State = "Gujarat";
                Pincode = "360005";
            }
            else if (applicationId == "APP-10252")
            {
                // RAHUL MEHTA

                ApplicationId = "APP-10252";
                ApplicationDate = "26 Sep 2026";
                Course = "Data Science";
                Status = "Pending";

                StudentName = "Rahul Mehta";
                Email = "rahul@example.com";
                Phone = "+91 98765 43212";
                DateOfBirth = "10 March 2007";

                Qualification = "12th Standard";
                PassingYear = "2026";
                Percentage = "85%";
                Institution = "PQR Higher Secondary School";

                Address = "78 Raiya Road";
                City = "Rajkot";
                State = "Gujarat";
                Pincode = "360007";
            }
            else if (applicationId == "APP-10251")
            {
                // NEHA KAPOOR

                ApplicationId = "APP-10251";
                ApplicationDate = "25 Sep 2026";
                Course = "Business Management";
                Status = "Rejected";

                StudentName = "Neha Kapoor";
                Email = "neha@example.com";
                Phone = "+91 98765 43213";
                DateOfBirth = "18 January 2007";

                Qualification = "12th Standard";
                PassingYear = "2026";
                Percentage = "79%";
                Institution = "LMN Higher Secondary School";

                Address = "56 Kalawad Road";
                City = "Rajkot";
                State = "Gujarat";
                Pincode = "360008";
            }
            else
            {
                Response.Redirect("~/Admin/Applications.aspx");
            }
        }
    }
}