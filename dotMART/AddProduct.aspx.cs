using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dotMART
{
    public partial class AddProduct : System.Web.UI.Page
    {

        public static String CS = ConfigurationManager.ConnectionStrings["martDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                //when page first time run then this code will execute
                BindCategory();
                //BindGridview1();

            }
        }       

        private void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_InsertProduct", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
                cmd.Parameters.AddWithValue("@PPriceDesc", txtPriceDesc.Text);
                cmd.Parameters.AddWithValue("@PQuantity", txtQuantity.Text);
                cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
                //Quantity Check
                if (txtQuantity.Text != null)
                {
                    cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
                }
                else
                {
                    Response.Write("<script> alert('Enter Valid Quantity !!!');  </script>");
                }
                //if (con.State == ConnectionState.Closed) 
                //{ 
                //    con.Open(); 
                //}
                //cmd.ExecuteNonQuery();
                try
                {
                    Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());


                    //Insert and upload images
                    if (fuImg01.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                        fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + Extention);
                        fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);

                        //SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "01" + "','" + Extention + "')", con);
                        SqlCommand cmd3 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                        cmd3.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                        //cmd3.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim());
                        cmd3.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "01");
                        cmd3.Parameters.AddWithValue("@Extention", Extention);
                        cmd3.ExecuteNonQuery();
                    }
                    //2nd fileupload
                    if (fuImg02.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);
                        }
                        string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                        fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                        //SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                        SqlCommand cmd4 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                        cmd4.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                        cmd4.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "02");
                        cmd4.Parameters.AddWithValue("@Extention", Extention);
                        cmd4.ExecuteNonQuery();
                    }

                    ////3rd file upload 
                    if (fuImg03.HasFile)
                    {
                        string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                        if (!Directory.Exists(SavePath))
                        {
                            Directory.CreateDirectory(SavePath);

                        }
                        string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                        fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                        //SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                        SqlCommand cmd5 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                        cmd5.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                        cmd5.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "03");
                        cmd5.Parameters.AddWithValue("@Extention", Extention);
                        cmd5.ExecuteNonQuery();
                    }

                }
                catch(Exception ex)
                {
                    Response.Write("<script> alert('Some Problem Occurred');  </script>");
                    Response.Redirect("~/AddProduct.aspx");

                }

                ////4th file upload control
                //if (fuImg04.HasFile)
                //{
                //    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                //    if (!Directory.Exists(SavePath))
                //    {
                //        Directory.CreateDirectory(SavePath);

                //    }
                //    string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                //    fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extention);

                //    //SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "04" + "','" + Extention + "')", con);
                //    SqlCommand cmd6 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                //    cmd6.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                //    cmd6.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "04");
                //    cmd6.Parameters.AddWithValue("@Extention", Extention);
                //    cmd6.ExecuteNonQuery();
                //}

                ////5th file upload
                //if (fuImg05.HasFile)
                //{
                //    string SavePath = Server.MapPath("~/Images/ProductImages/") + PID;
                //    if (!Directory.Exists(SavePath))
                //    {
                //        Directory.CreateDirectory(SavePath);

                //    }
                //    string Extention = Path.GetExtension(fuImg05.PostedFile.FileName);
                //    fuImg05.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "05" + Extention);

                //    //SqlCommand cmd7 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "05" + "','" + Extention + "')", con);
                //    SqlCommand cmd7 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                //    cmd7.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                //    cmd7.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "05");
                //    cmd7.Parameters.AddWithValue("@Extention", Extention);
                //    cmd7.ExecuteNonQuery();

                //    //BindGridview1();
                //    Response.Redirect("AddProduct.aspx");
                //}

            }
            Response.Redirect("~/AdminHome.aspx");
            Response.Write("<script> alert('Product Added Successful');  </script>");
        }

        //protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int MainCategoryID = Convert.ToInt32(ddlCategory.SelectedItem.Value);

        //    using (SqlConnection con = new SqlConnection(CS))
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("Select * from tblSubCategory where MainCatID='" + ddlCategory.SelectedItem.Value + "'", con);
        //        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        sda.Fill(dt);
        //        if (dt.Rows.Count != 0)
        //        {
        //            //ddlSubCategory.DataSource = dt;
        //            //ddlSubCategory.DataTextField = "SubCatName";
        //            //ddlSubCategory.DataValueField = "SubCatID";
        //            //ddlSubCategory.DataBind();
        //            //ddlSubCategory.Items.Insert(0, new ListItem("-Select-", "0"));

        //        }
        //    }
        //}

        //private void BindGridview1()
        //{
        //    SqlConnection con = new SqlConnection(CS);
        //    SqlCommand cmd = new SqlCommand(" select distinct t1.PID,t1.PName,t1.PPrice,t1.Description,t3.CatName,t1.Quantity from tblProducts " +
        //        //"as t1  inner join tblBrands as t2 on t2.BrandID=t1.PBrandID  inner join tblCategory as t3 on t3.CatID=t1.PCategoryID  inner join tblSubCategory as t4 on t4.SubCatID=t1.PSubCatID   inner join tblGender as t5 on t5.GenderID =t1.PGender   inner join tblSizes as t6 on t6.SubCategoryID=t1.PSubCatID  inner join tblProductSizeQuantity as t8 on t8.PID=t1.PID order by t1.PName", con);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    if (dt.Rows.Count > 0)
        //    {
        //        GridView1.DataSource = dt;
        //        GridView1.DataBind();
        //    }
        //    else
        //    {
        //        GridView1.DataSource = null;
        //        GridView1.DataBind();
        //    }


        //}
        protected void btnAdminlogout_Click(object sender, EventArgs e)
        {
            Session["Username"] = null;
            Session.RemoveAll();
            Response.Redirect("~/Home.aspx");
        }
    }
}