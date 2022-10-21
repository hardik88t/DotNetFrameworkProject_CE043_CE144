using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace dotMART
{
    public partial class ProductEdit : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["martDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    divSuccess.Visible = false;
                    BindProductImage();
                    BindProductDetails();
                    //BindCartNumber();
                }
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }

        }

        private void BindProductDetails()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindProductDetails", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@PID", PID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProductDetails.DataSource = dt;
                    rptrProductDetails.DataBind();
                    Session["CartPID"] = Convert.ToInt32(dt.Rows[0]["PID"].ToString());
                    Session["myPName"] = dt.Rows[0]["PName"].ToString();
                    Session["myPPrice"] = dt.Rows[0]["PPrice"].ToString();
                    //Session["myPSelPrice"] = dt.Rows[0]["PSelPrice"].ToString();
                }

            }
        }
        private void BindProductImage()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindProductImages", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@PID", PID);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrImage.DataSource = dt;
                    rptrImage.DataBind();
                }
            }
        }

        protected string GetActiveImgClass(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";

            }
        }

        protected void btnDelete_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminHome.aspx");
        }
        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminHome.aspx");

        }
        private void AddToCartProduction() { }
        public void BindCartNumber() { }
        protected void btnAddtoCart_Click(object sender, EventArgs e) { }
        protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e) { }


    }
}