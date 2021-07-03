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
    public partial class userHome : System.Web.UI.Page
    {
        int id,ItemCount=0;
        double tot = 0;
        string s, t;
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
               
                TotalPrice.Text = tot.ToString();
                ToalItems.Text = ItemCount.ToString();
            }

            string cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);
           
            sqlCnx.Open();
            if (Request["catId"] != null)
            {

                String catid = Request["catId"].ToString();
                SqlCommand cmd = sqlCnx.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select PID,PrName,PrPrice,PrDescription,PrImage from tbl_Products where PrCatID=@c";
                cmd.Parameters.AddWithValue("@c", catid);
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
                SqlCommand cmd = sqlCnx.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select PID,PrName,PrPrice,PrDescription,PrImage from tbl_Products";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                d1.DataSource = dt;
                d1.DataBind();
                sqlCnx.Close();
               
            }

            



        }
        
    }
}