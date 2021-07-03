using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Threading.Tasks;

namespace Web_project
{
    public partial class RecoverPass : System.Web.UI.Page
    {
        String GUIDvalue;
        int Uid;
        string type;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
               con.Open();
               GUIDvalue = Request.QueryString["id"];

                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("Select * from tbl_ForgotPassword where Id=@Id", con);
                    
                    cmd.Parameters.AddWithValue("@Id", GUIDvalue);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);

                    sda.Fill(dt);
                    Uid = Convert.ToInt32(dt.Rows[0][1]);
                    
                }
                else
                {
                    Response.Redirect("Admin_login.aspx");
                }
            }
           /* if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    txtPass.Visible = true;
                    txtConfirmPass.Visible = true;

                    btnReset.Visible = true;
                }
                else
                {
                    lblMsg.Text = "Your Password Reset Link is Expired or Invalid...try again";
                    lblMsg.ForeColor = System.Drawing.Color.Red;

                }*/
           lblMsg.Text=type;
        }


        protected void txtReset_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["myCookies"] != null)
            {

               
                string allinfo = Request.Cookies["myCookies"].Value;

                type = allinfo;
                lblMsg.Text = type;

                if (type == "Admin_login")
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Update tbl_Admins set admin_password=@p where Id=@Uid", con);
                        cmd.Parameters.AddWithValue("@p", txtConfirmPass.Text);
                        cmd.Parameters.AddWithValue("@Uid", Uid);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Hello Admin";
                        Response.Write("<script> alert('Password Reset Successfully done');  </script>");




                    }
                }
                if (type == "userLogin")
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Update tbl_Users set user_password=@p where Id=@Uid", con);
                        cmd.Parameters.AddWithValue("@p", txtConfirmPass.Text);
                        cmd.Parameters.AddWithValue("@Uid", Uid);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "Hello User";
                        Response.Write("<script> alert('Password Reset Successfully done');  </script>");




                    }
                }
            }
            else
            {
                lblMsg.Text="Something went wrong";
            }
        }
    }
}