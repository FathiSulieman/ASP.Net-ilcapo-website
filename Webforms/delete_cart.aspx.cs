using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Web_project
{
    public partial class delete_cart : System.Web.UI.Page
    {
        string s, t;
        string[] a = new string[4];
        int id, count = 0;
        string PrName, PrPrice, PrDescription, PrImage;


        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            DataTable dt = new DataTable();
            dt.Rows.Clear();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("PrName"), new DataColumn("PrPrice"), new DataColumn("PrDescription"), new DataColumn("PrImage"), new DataColumn("PID") });
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
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), i.ToString());
                }
            }
            dt.Rows.RemoveAt(id);
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);

            foreach (DataRow dr in dt.Rows)
            {
                PrName = dr["PrName"].ToString();
                PrPrice = dr["PrPrice"].ToString();
                PrDescription = dr["PrDescription"].ToString();
                PrImage = dr["PrImage"].ToString();

                count++;
                if(count==1)
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
            }

            Response.Redirect("Cart.aspx");
        }
    }
}