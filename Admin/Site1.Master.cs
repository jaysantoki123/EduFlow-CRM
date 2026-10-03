using System;

namespace EduFlow
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string AdminName
        {
            get
            {
                if (Session["AdminName"] != null)
                    return Session["AdminName"].ToString();

                return "Admin User";
            }
        }

        public string AdminRole
        {
            get
            {
                if (Session["AdminRole"] != null)
                    return Session["AdminRole"].ToString();

                return "System Administrator";
            }
        }

        public string AdminInitials
        {
            get
            {
                string name = AdminName.Trim();

                if (string.IsNullOrEmpty(name))
                    return "AD";

                string[] parts = name.Split(' ');

                if (parts.Length >= 2)
                {
                    return (
                        parts[0].Substring(0, 1) +
                        parts[parts.Length - 1].Substring(0, 1)
                    ).ToUpper();
                }

                return name.Substring(
                    0,
                    Math.Min(2, name.Length)
                ).ToUpper();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminName"] == null)
                Session["AdminName"] = "Admin User";

            if (Session["AdminRole"] == null)
                Session["AdminRole"] = "System Administrator";

            if (Session["AdminUsername"] == null)
                Session["AdminUsername"] = "admin";

            if (Session["AdminEmail"] == null)
                Session["AdminEmail"] = "admin@educrm.com";

            if (Session["AdminPhone"] == null)
                Session["AdminPhone"] = "+91 98765 43210";
        }
    }
}