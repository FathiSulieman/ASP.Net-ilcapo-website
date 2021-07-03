using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class Admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx?type=Admin_login");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String Admin_Email = txtEmail.Text.ToString();
            String Admin_Passwrod = txtPassword.Text.ToString();

            String sql = "select count(*) from tbl_Admins where admin_email = @e and admin_password = @p";
            String connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(connectionString);

            sqlCnx.Open();

            SqlCommand sqlCommand = new SqlCommand(sql, sqlCnx);
            sqlCommand.Parameters.AddWithValue("@e", Admin_Email);
            sqlCommand.Parameters.AddWithValue("@p", Admin_Passwrod);

            int count = 0;

            SqlDataReader sdr = sqlCommand.ExecuteReader();
            while (sdr.Read())
            {
                count = sdr.GetInt32(0); //retrieving 1st column  

            }
            if (count == 1)
            {
                Response.Redirect("AdminHomePage.aspx");
            }
            else
            {
                lblError.Text = "Invalid email or password";
            }


            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterAdmin.aspx");
          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           //google api SCRAPPED

                //your client id  
                string clientid = "993224392261-s1v79k7qpahd2asg675i1lhknmnpuao6.apps.googleusercontent.com";
                //your client secret  
                string clientsecret = "-AdCCjR-PWg3Tk1Jw9I9pyM2";
                //your redirection url  
                string redirection_url = "https://localhost:44358/index";
                string url = "https://accounts.google.com/o/oauth2/v2/auth?scope=profile&include_granted_scopes=true&redirect_uri=" + redirection_url + "&response_type=code&client_id=" + clientid + "";
                Response.Redirect(url);
            
        }
    }
}