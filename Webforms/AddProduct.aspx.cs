using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Web_project
{
    public class Class1
    {

        public static string GetRandomPassword(int length)
        {
            char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            string password = string.Empty;
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                int x = random.Next(1, chars.Length);
                //For avoiding Repetation of Characters
                if (!password.Contains(chars.GetValue(x).ToString()))
                    password += chars.GetValue(x);
                else
                    i = i - 1;
            }
            return password;
        }

    }
    public partial class AddProduct : System.Web.UI.Page
    {
        string a, b;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int delivery = 0;
            int Return = 0;
            int warranty = 0;
            if(chFD.Checked)
            {
                delivery = 1;
            }
            if (chReturn.Checked)
            {
                Return = 1;
            }
            if (cbWaranty.Checked)
            {
                warranty = 1;
            }
            a = Class1.GetRandomPassword(10).ToString();
            FileUpload1.SaveAs(Request.PhysicalApplicationPath+"Scripts/css/images/"+a+FileUpload1.FileName.ToString());
            b = "Scripts/css/images/" + a + FileUpload1.FileName.ToString();
            String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);
            string sql = "insert into tbl_Products(PrName,PrPrice,PrCatID,PrDescription,PrFreeDelivery,Pr30Day,PrImage,PrWar) values (@name,@price,@Cat,@Des,@del,@Pe,@Pi,@Pw)";
            SqlCommand cmd = new SqlCommand("Select * from tbl_Category where CatName=@Name", sqlCnx);
            sqlCnx.Open();

            cmd.Parameters.AddWithValue("@Name", DropDownList2.Text.ToString());
            SqlCommand sc = new SqlCommand(sql, sqlCnx);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            int CatID = 0;
            if (dt.Rows.Count != 0)
            {
                CatID = Convert.ToInt32(dt.Rows[0][0]);

            }

            sc.Parameters.AddWithValue("@name", txtProductName.Text);
            sc.Parameters.AddWithValue("@price", txtPrice.Text);
            sc.Parameters.AddWithValue("@Cat", CatID);
            sc.Parameters.AddWithValue("@Des", txtDescription.Text);
            sc.Parameters.AddWithValue("@del", delivery);
            sc.Parameters.AddWithValue("@Pe", Return);
            sc.Parameters.AddWithValue("@Pi", b.ToString());
            sc.Parameters.AddWithValue("@Pw", warranty);
            sc.ExecuteNonQuery();

            sqlCnx.Close();
            ScriptManager.RegisterStartupScript(this, GetType(), "err_msg", "alert('Product Added');window.location='AdminHomePage.aspx';", true);

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBrand.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
        }
    }
}