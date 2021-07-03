using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Web_project
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        String GUIDvalue;

        int Uid;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {

                GUIDvalue = Request.QueryString["id"];

                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("Select * from tbl_ForgotPassword where Id=@Id", con);
                    con.Open();
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
            if (!IsPostBack)
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

                }

            }
        }

        protected void txtReset_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Update tbl_Admins set admin_password=@p where Id=@Uid", con);
                cmd.Parameters.AddWithValue("@p", txtConfirmPass.Text);
                //cmd.Parameters.AddWithValue("@Uid", Uid);
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('Password Reset Successfully done');  </script>");
            }
        }
    }
}