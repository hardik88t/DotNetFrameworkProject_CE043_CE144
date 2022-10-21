using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dotMART
{
    public partial class AdminMasterPage : System.Web.UI.MasterPage
    {

        private const string userName = "admin";
        private const string uName = "Username";
        public static String CS = ConfigurationManager.ConnectionStrings["martDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {

                if (!this.IsPostBack)
                {
                    if (Session["Usertype"] == "Admin") { };
                }
                else
                {
                    Response.Redirect("~/Home.aspx");
                }

            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }

        protected void btnAdminlogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Session.RemoveAll();
            Response.Redirect("~/Home.aspx");
        }
    }
}