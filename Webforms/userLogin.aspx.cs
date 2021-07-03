using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class userLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String User_Email = txtEmail.Text.ToString();
            String User_Passwrod = txtPassword.Text.ToString();

            String sql = "select count(*) from tbl_Users where user_email = @e and user_password = @p";
            String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(connectionString);

            sqlCnx.Open();

            SqlCommand sqlCommand = new SqlCommand(sql, sqlCnx);
            sqlCommand.Parameters.AddWithValue("@e", User_Email);
            sqlCommand.Parameters.AddWithValue("@p", User_Passwrod);

            int count = 0;

            SqlDataReader sdr = sqlCommand.ExecuteReader();
            while (sdr.Read())
            {
                count = sdr.GetInt32(0); //retrieving 1st column  

            }
            if (count == 1)
            {
                if (Session["checkoutbutton"] !=null)
                {
                    Session["user"] = User_Email;
                    Response.Redirect("checkout.aspx");
                }
                else
                {
                    Session["user"] = User_Email;
                    Response.Redirect("userHome.aspx");
                }
                
            }
            else
            {
                lblError.Text = "Invalid email or password";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegestration.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx?type=userLogin");
        }
    }
}