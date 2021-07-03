using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["name"].ToString() == "AddBrand")
            {
                String id = Request["id"].ToString();
                String sql = "delete from tbl_Brand where Brand_ID = @myid ";
                String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection sqlCnx = new SqlConnection(cnxString);
                sqlCnx.Open();
                SqlCommand sc = new SqlCommand(sql, sqlCnx);
                sc.Parameters.AddWithValue("@myid", id);
                sc.ExecuteNonQuery();
                Response.Redirect(Request["name"].ToString()+".aspx");
            }
            if (Request["name"].ToString() == "AddCategory")
            {
                String id = Request["id"].ToString();
                String sql = "delete from tbl_Category where CatID = @myid ";
                String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection sqlCnx = new SqlConnection(cnxString);
                sqlCnx.Open();
                SqlCommand sc = new SqlCommand(sql, sqlCnx);
                sc.Parameters.AddWithValue("@myid", id);
                sc.ExecuteNonQuery();
                Response.Redirect(Request["name"].ToString() + ".aspx");
            }
        }
    }
}