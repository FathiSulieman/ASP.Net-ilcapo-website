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
    public partial class Cart : System.Web.UI.Page
    {
        int id, ItemCount = 0;
        double tot = 0;
        string s, t;

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void checkout(object sender, EventArgs e)
        {
            Session["checkoutbutton"] = "yes";
            Session["tot"] = tot.ToString();
            Response.Redirect("checkout.aspx");
            
        }

        string[] a  = new string[4];
        protected void Page_Load(object sender, EventArgs e)
        {
            /* string cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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
                 DataList1.DataSource = dt;
                 DataList1.DataBind();
                 sqlCnx.Close();*/
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("PrName"), new DataColumn("PrPrice"), new DataColumn("PrDescription"), new DataColumn("PrImage"),new DataColumn("PID") });
            if(Request.Cookies["aa"]!=null)
            {
                s = Convert.ToString(Request.Cookies["aa"].Value);

                string[] strArr = s.Split('|');
                for(int i = 0; i< strArr.Length;i++)
                {
                    t = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = t.Split(',');
                    for(int j =0;j<strArr1.Length;j++)
                    {
                        a[j] = strArr1[j].ToString();

                    }
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(),i.ToString());
                    tot += (Convert.ToDouble(a[1].ToString()));
                    ItemCount++;
                }
                DataList1.DataSource = dt;
                DataList1.DataBind();
                Total.Text ="Total: $"+ tot.ToString();
                TotalPrice.Text = tot.ToString();
                ToalItems.Text = ItemCount.ToString();
            }
            }
        }
    }
