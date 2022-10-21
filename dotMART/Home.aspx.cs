using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dotMART
{
    public partial class Home : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["martDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Request.QueryString["UserLogin"] == "YES")
            //{
            //    Response.Redirect("Home.aspx?UserLogin=YES");
            //}

            if (Session["Username"] != null)
            {
                //lblSuccess.Text = "Login Success, Welcome <b>" + Session["Username"].ToString() + "</b>";

                if (!this.IsPostBack)
                {
                    BindProductRepeater();
                    btnSignUp.Visible = false;
                    btnSignIn.Visible = false;
                    btnlogout.Visible = true;
                    btnUser.Text = "Welcome: " + Session["Username"].ToString().ToUpper();
                }

            }
            else
            {
                BindProductRepeater();
                btnSignUp.Visible = true;
                btnSignIn.Visible = true;
                btnlogout.Visible = false;
                //Response.Redirect("Default.aspx");
                //Response.Write("<script type='text/javascript'>alert('Login plz')</script>");

            }
        }
        //public void BindCartNumber()
        //{
        //    if (Request.Cookies["CartPID"] != null)
        //    {
        //        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        //        string[] ProductArray = CookiePID.Split(',');
        //        int ProductCount = ProductArray.Length;
        //        pCount.InnerText = ProductCount.ToString();
        //    }
        //    else
        //    {
        //        pCount.InnerText = 0.ToString();
        //    }
        //}
        protected void btnUser_Click(object sender, EventArgs e)
        {
            if(Session["LoginType"].ToString() == "Admin"){
                Response.Redirect("~/AdminHome.aspx");
            }

        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Session.RemoveAll();
            Response.Redirect("~/Home.aspx");
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Signup.aspx");
        }

        private void BindProductRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                    }
                }

            }
        }

        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;
            base.InitializeCulture();
        }
    }
}
