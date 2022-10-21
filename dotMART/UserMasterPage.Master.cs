using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dotMART
{
    public partial class UserMasterPage : System.Web.UI.MasterPage
    {

        public static String CS = ConfigurationManager.ConnectionStrings["martDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //btnlogout.Visible = false;
            if (Session["Username"] != null)
            {
                if (!this.IsPostBack)
                {
                    //BindProductRepeater();
                    btnSignUp.Visible = false;
                    btnSignIn.Visible = false;
                    btnlogout.Visible = true;
                    btnUser.Text = "Welcome: " + Session["Username"].ToString().ToUpper();
                }
                //    //lblSuccess.Text = "Login Success, Welcome <b>" + Session["Username"].ToString() + "</b>";
                //    btnlogout.Visible = true;
                //    btnSignUp.Visible = false;
                //    btnSignIn.Visible = false;
                //    btnUser.Visible=true;
                //    /*BindCartNumber22();*/
                //    btnUser.Text = "Welcome: " + Session["Username"].ToString().ToUpper();
            }
            else
            {
                btnlogout.Visible = false;
                btnSignUp.Visible = true;
                btnSignIn.Visible = true;
            }
        }

        public void BindCartNumber()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] ProductArray = CookiePID.Split(',');
                int ProductCount = ProductArray.Length;
                pCount.InnerText = ProductCount.ToString();
            }
            else
            {
                pCount.InnerText = 0.ToString();
            }
        }

        public void BindCartNumber22()
        {
            if (Session["USERID"] != null)
            {
                string UserIDD = Session["USERID"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@UserID", UserIDD);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                            pCount.InnerText = CartQuantity;

                        }
                        else
                        {
                            pCount.InnerText = 0.ToString();
                        }
                    }
                }
            }
        }
        //}

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

    }
}
