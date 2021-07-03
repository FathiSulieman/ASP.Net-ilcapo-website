using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class RegisterAdmin : System.Web.UI.Page
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
            String Phone = txt_phone.Text.ToString();
            string selectedCity = Request.Form.Get("countryCode");
            testLabel.Text = Email;
            String sql = "insert into tbl_Admins (admin_email,admin_password,admin_fName,admin_lName,admin_Phone,admin_PhoneCode) values(@e,@p,@f,@l,@m,@c)";
            String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);

            sqlCnx.Open();
            SqlCommand sqlCommand = new SqlCommand(sql, sqlCnx);
            sqlCommand.Parameters.AddWithValue("@e", Email);
            sqlCommand.Parameters.AddWithValue("@p", Password);
            sqlCommand.Parameters.AddWithValue("@f", Fname);
            sqlCommand.Parameters.AddWithValue("@l", Lname);
            sqlCommand.Parameters.AddWithValue("@m", Int32.Parse(Phone));
            sqlCommand.Parameters.AddWithValue("@c", selectedCity);

            sqlCommand.ExecuteNonQuery();
            sqlCnx.Close();

            Response.Redirect("Admin_login.aspx");

        }
    }
}