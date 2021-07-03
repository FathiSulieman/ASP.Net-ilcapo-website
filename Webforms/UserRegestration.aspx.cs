using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class UserRegestration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            String Fname = txtName.Text.ToString();
            String Lname = txtLastName.Text.ToString();
            String Email = txtEmail.Text.ToString();
            String Password = txtPassword.Text.ToString();
           
            String sql = "insert into tbl_Users (user_email,user_Fname,user_Lname,user_password) values(@e,@f,@l,@p)";
            String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);

            sqlCnx.Open();
            SqlCommand sqlCommand = new SqlCommand(sql, sqlCnx);
            sqlCommand.Parameters.AddWithValue("@e", Email);
            sqlCommand.Parameters.AddWithValue("@p", Password);
            sqlCommand.Parameters.AddWithValue("@f", Fname);
            sqlCommand.Parameters.AddWithValue("@l", Lname);
    

            sqlCommand.ExecuteNonQuery();
            sqlCnx.Close();

            Response.Redirect("userLogin.aspx");
        }
    }
}