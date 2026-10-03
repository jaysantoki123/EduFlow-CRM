using System;

namespace EduCRM
{
    public partial class InquiryDetails : System.Web.UI.Page
    {
        public string InquiryId { get; set; }
        public string StudentName { get; set; }
        public string Phone { get; set; }
        public string Course { get; set; }
        public string Source { get; set; }
        public string Status { get; set; }
        public string Priority { get; set; }
        public string Counselor { get; set; }
        public string InquiryDate { get; set; }

        public string StatusClass { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string inquiryId = Request.QueryString["id"];

                if (string.IsNullOrEmpty(inquiryId))
                {
                    Response.Redirect("~/Admin/Inquiries.aspx");
                    return;
                }

                LoadInquiryDetails(inquiryId);
            }
        }

        private void LoadInquiryDetails(string inquiryId)
        {
            if (inquiryId == "INQ-2024-001")
            {
                InquiryId = "INQ-2024-001";
                StudentName = "Rajesh Kumar";
                Phone = "+91 98765 43210";
                Course = "B.Tech CSE";
                Source = "Website";
                Status = "New";
                Priority = "High";
                Counselor = "Sarah Patel";
                InquiryDate = "Dec 15, 2024";

                StatusClass = "status-new";
            }

            else if (inquiryId == "INQ-2024-002")
            {
                InquiryId = "INQ-2024-002";
                StudentName = "Priya Sharma";
                Phone = "+91 98765 43211";
                Course = "MBA Finance";
                Source = "Referral";
                Status = "Contacted";
                Priority = "Medium";
                Counselor = "Rahul Gupta";
                InquiryDate = "Dec 14, 2024";

                StatusClass = "status-contacted";
            }

            else if (inquiryId == "INQ-2024-003")
            {
                InquiryId = "INQ-2024-003";
                StudentName = "Amit Verma";
                Phone = "+91 98765 43212";
                Course = "BCA";
                Source = "Social Media";
                Status = "Qualified";
                Priority = "High";
                Counselor = "Meera Patel";
                InquiryDate = "Dec 14, 2024";

                StatusClass = "status-qualified";
            }

            else if (inquiryId == "INQ-2024-004")
            {
                InquiryId = "INQ-2024-004";
                StudentName = "Sneha Kapoor";
                Phone = "+91 98765 43213";
                Course = "B.Sc Data Science";
                Source = "Walk-in";
                Status = "Converted";
                Priority = "Low";
                Counselor = "Sarah Patel";
                InquiryDate = "Dec 13, 2024";

                StatusClass = "status-converted";
            }

            else
            {
                Response.Redirect("~/Admin/Inquiries.aspx");
            }
        }
    }
}