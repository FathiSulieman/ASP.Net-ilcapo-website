using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class ProductDescription : System.Web.UI.Page
    {
        
      
        string PrName, PrPrice, PrDescription, PrImage, t, s;
        int id, ItemCount = 0;
        double tot = 0;
      
        string[] a = new string[4];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["aa"] != null)
            {
                s = Convert.ToString(Request.Cookies["aa"].Value);

                string[] strArr = s.Split('|');
                for (int i = 0; i < strArr.Length; i++)
                {
                    t = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = t.Split(',');
                    for (int j = 0; j < strArr1.Length; j++)
                    {
                        a[j] = strArr1[j].ToString();

                    }

                    tot += (Convert.ToDouble(a[1].ToString()));
                    ItemCount++;

                }

                ToalPrice.Text = tot.ToString();
                TotalItems.Text = ItemCount.ToString();
            }
            string cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);
            sqlCnx.Open();
            if (Request["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                SqlCommand cmd = sqlCnx.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "select PrName,PrPrice,PrDescription,PrImage from tbl_Products where PID=@i";
                cmd.Parameters.AddWithValue("@i", id);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                d1.DataSource = dt;
                d1.DataBind();
                sqlCnx.Close();
            }
            else
            {
                if (Request.QueryString["search"] != null)
                {
                    SqlCommand cmd = sqlCnx.CreateCommand();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "select PrName,PrPrice,PrDescription,PrImage,PID from tbl_Products where PrName like('%"+Request.QueryString["search"].ToString()+"%')";
                    cmd.ExecuteNonQuery();
                    
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    d1.DataSource = dt;
                    d1.DataBind();
                    foreach (DataRow dr in dt.Rows)
                    {
                        id = Convert.ToInt32(dr["PID"].ToString());

                    }
                    
                    sqlCnx.Close();
                }

            }
        }

        protected void AddToCart(object sender, EventArgs e)
        {
            

            string cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);
            sqlCnx.Open();


            SqlCommand cmd = sqlCnx.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select PrName,PrPrice,PrDescription,PrImage from tbl_Products where PID=@i";
            cmd.Parameters.AddWithValue("@i", id);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                PrName = dr["PrName"].ToString();
                PrPrice = dr["PrPrice"].ToString();
                PrDescription = dr["PrDescription"].ToString();
                PrImage = dr["PrImage"].ToString();


            }
            sqlCnx.Close();

            if (Request.Cookies["aa"] == null)
            {

                Response.Cookies["aa"].Value = PrName.ToString() + "," + PrPrice.ToString() + "," + PrDescription.ToString() + ","
                + PrImage.ToString();
                Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);

            }
            else
            {
                Response.Cookies["aa"].Value = Request.Cookies["aa"].Value + "|" + PrName.ToString() + "," + PrPrice.ToString() + "," + PrDescription.ToString() + ","
                + PrImage.ToString();
                Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
            }
           
            Response.Redirect("Cart.aspx?id="+ id.ToString());
        }

        protected void d1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Response.Redirect("userHome.aspx");
        }

        
    }
}