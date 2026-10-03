using System;

namespace EduCRM
{
    public partial class CounselingDetails : System.Web.UI.Page
    {
        public string SessionId { get; set; }

        public string Status { get; set; }

        public string StatusClass { get; set; }

        public string StudentName { get; set; }

        public string StudentInitials { get; set; }

        public string Course { get; set; }

        public string SessionDate { get; set; }

        public string SessionTime { get; set; }

        public string Mode { get; set; }

        public string SessionType { get; set; }

        public string CounselorName { get; set; }

        public string CounselorRole { get; set; }

        public string CounselorInitials { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sessionId = Request.QueryString["id"];

                if (string.IsNullOrEmpty(sessionId))
                {
                    Response.Redirect("~/Admin/Counseling.aspx");
                    return;
                }

                LoadSessionDetails(sessionId);
            }
        }


        private void LoadSessionDetails(string sessionId)
        {

            // ==========================================
            // RAJESH
            // ==========================================

            if (sessionId == "COU-2024-0045")
            {
                SessionId = "#COU-2024-0045";

                Status = "Scheduled";

                StatusClass = "status-scheduled";

                StudentName = "Rajesh Kumar";

                StudentInitials = "RK";

                Course = "B.Tech Computer Science";

                SessionDate = "Dec 18, 2024";

                SessionTime = "10:00 AM - 11:00 AM";

                Mode = "Online (Zoom)";

                SessionType = "First Counseling";

                CounselorName = "Sarah Patel";

                CounselorRole = "Senior Counselor";

                CounselorInitials = "SP";
            }


            // ==========================================
            // PRIYA
            // ==========================================

            else if (sessionId == "COU-2024-0044")
            {
                SessionId = "#COU-2024-0044";

                Status = "Ongoing";

                StatusClass = "status-ongoing";

                StudentName = "Priya Sharma";

                StudentInitials = "PS";

                Course = "MBA Finance";

                SessionDate = "Dec 16, 2024";

                SessionTime = "2:00 PM - 3:00 PM";

                Mode = "Office - Room 205";

                SessionType = "Career Guidance";

                CounselorName = "Rahul Gupta";

                CounselorRole = "Counselor";

                CounselorInitials = "RG";
            }


            // ==========================================
            // AMIT
            // ==========================================

            else if (sessionId == "COU-2024-0043")
            {
                SessionId = "#COU-2024-0043";

                Status = "Completed";

                StatusClass = "status-completed";

                StudentName = "Amit Verma";

                StudentInitials = "AV";

                Course = "BCA";

                SessionDate = "Dec 15, 2024";

                SessionTime = "11:00 AM - 12:00 PM";

                Mode = "Online (Meet)";

                SessionType = "Follow-up";

                CounselorName = "Meera Patel";

                CounselorRole = "Senior Counselor";

                CounselorInitials = "MP";
            }


            // ==========================================
            // INVALID ID
            // ==========================================

            else
            {
                Response.Redirect("~/Admin/Counseling.aspx");
            }
        }
    }
}