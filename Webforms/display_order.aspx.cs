using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class display_order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {

                String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection sqlCnx = new SqlConnection(cnxString);
                sqlCnx.Open();
                SqlCommand cmd = sqlCnx.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "select * from orders where email='"+Session["user"].ToString()+"' order by id asc";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                r1.DataSource = dt;
                r1.DataBind();
                sqlCnx.Close();
            }
            else { 
            String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);
            sqlCnx.Open();
            SqlCommand cmd = sqlCnx.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select * from orders order by id asc";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            r1.DataSource = dt;
            r1.DataBind();
            sqlCnx.Close();
            }
            



        }
    }
}