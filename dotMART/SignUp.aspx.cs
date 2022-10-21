using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace dotMART
{
    public partial class SignUp : System.Web.UI.Page
    {
        public static String ConnStr = ConfigurationManager.ConnectionStrings["martDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            btnSignUP.Visible = false;
        }

        protected void txtsignup_Click(object sender, EventArgs e)
        {

            if (isformvalid())
            {
                using (SqlConnection con = new SqlConnection(ConnStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblUsers(Username,Password,Email,Name,Usertype) Values('" + txtUname.Text + "','" + txtPass.Text + "','" + txtEmail.Text + "','" + txtName.Text + "','User')", con);
                    cmd.ExecuteNonQuery();

                    Response.Write("<script> alert('Registration Successful');  </script>");
                    clr();
                    con.Close();
                    //lblMsg.Text = "Registration Successfully done";
                    //lblMsg.ForeColor = System.Drawing.Color.Green;
                }
                Response.Redirect("~/SignIn.aspx");
            }
            else
            {
                Response.Write("<script> alert('Registration failed');  </script>");
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }

        }

        private bool isformvalid()
        {
            if (txtUname.Text == "")
            {
                Response.Write("<script> alert('username not valid');  </script>");
                txtUname.Focus();

                return false;
            }
            else if (txtPass.Text == "")
            {
                Response.Write("<script> alert('Password not valid');  </script>");
                txtPass.Focus();
                return false;
            }
            else if (txtPass.Text != txtCPass.Text)
            {
                Response.Write("<script> alert('confirm Password not valid');  </script>");
                txtCPass.Focus();
                return false;
            }
            else if (txtEmail.Text == "")
            {
                Response.Write("<script> alert('Email not valid');  </script>");
                txtEmail.Focus();
                return false;
            }
            else if (txtName.Text == "")
            {
                Response.Write("<script> alert('Name not valid');  </script>");
                txtName.Focus();
                return false;
            }

            return true;
        }

        private void clr()
        {
            txtName.Text = string.Empty;
            txtPass.Text = string.Empty;
            txtUname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtCPass.Text = string.Empty;
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Session.RemoveAll();
            Response.Redirect("~/Home.aspx");
        }
    }
}