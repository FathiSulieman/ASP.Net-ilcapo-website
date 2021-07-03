using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web_project
{
    public partial class AddBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*string style = "\"width:100%; height:120px; overflow-y:scroll; display:block;\"";
            string html = "<div style = \"  width: 40%; position: fixed; z-index: 1000; top:50%\" ><table border = \"1\" style = " + style + "><tr><td colspan =\"1\">
            </td><td>Category ID</td><td>Name</td></tr>";*/
            string style = "\"width:100%; height:120px; overflow-y:scroll; display:block;\"";
            string html = "<div style = \"  width: 40%; position: fixed; z-index: 1000; top:50%\">" +
                "<table border = \"1\" style = " + style + "><tr><td colspan =\"1\"></td><td>Brand ID</td><td>Name</td></tr>";

            string sql = "select * from tbl_Brand";
            String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);
            sqlCnx.Open();
            SqlCommand sc = new SqlCommand(sql, sqlCnx);
            SqlDataReader sdr = sc.ExecuteReader();
            while (sdr.Read())
            {
                html += "<tr>" +
                    "<td style=\"width:6%\"><input type = \"button\" value = \"Delete\" onclick =\"deleteRes(" + sdr.GetInt32(0) + ")\"/></td>" +
                    
                    
                    "<td>" + sdr.GetInt32(0) + "</td>" +
                    "<td>" + sdr.GetString(1) + "</td>" +
                  "</tr>";
            }

            html += "</table ></div>";

            Response.Write(html);
        }
        
        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {

                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tbl_Brand(Name) Values('" + txtNewBrand.Text + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Brand Added Successfully ');  </script>");
                txtNewBrand.Text = string.Empty;

                con.Close();
                //lblMsg.Text = "Registration Successfully done";
                //lblMsg.ForeColor = System.Drawing.Color.Green;
                txtNewBrand.Focus();
                Page.Response.Redirect(Page.Request.Url.ToString(), true);
            }
        }

       

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }
    }
}