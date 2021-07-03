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
    public partial class checkout : System.Web.UI.Page
    {
        string order = "";
        string order_id;
        string[] a = new string[6];
        string tot;
        string order_no;
        string s, t;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                string cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection sqlCnx = new SqlConnection(cnxString);
                sqlCnx.Open();

                SqlCommand cmd = sqlCnx.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from tbl_Users where user_email='" + Session["user"].ToString() + "'";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach(DataRow dr in dt.Rows)
                {
                    SqlCommand cmd1 = sqlCnx.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "insert into orders values('" + dr["user_Fname"].ToString() + "','" + dr["user_Lname"].ToString() + "','" + dr["user_email"] + "')";
                    cmd1.ExecuteNonQuery();
                }
                //end storing user info
                SqlCommand cmd2 = sqlCnx.CreateCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "select top 1 * from orders where email='" + Session["user"].ToString() + "' order by id desc ";
                cmd2.ExecuteNonQuery();
                DataTable dt2 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                da2.Fill(dt2);
                foreach(DataRow dr2 in dt2.Rows)
                {
                    order_id = dr2["id"].ToString();
                }
                //end of gettind order id

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
                        SqlCommand cmd3 = sqlCnx.CreateCommand();
                        cmd3.CommandType = CommandType.Text;
                        cmd3.CommandText = "insert into order_details values('" + order_id.ToString() + "','" + a[0].ToString() + "','" + a[1].ToString() + "','" + a[3].ToString() + "')";
                        cmd3.ExecuteNonQuery();
                    }
                }
                sqlCnx.Close();
                Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "err_msg", "alert('Order Successful.');window.location='userHome.aspx';", true);
                
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }
                
                
        }
    }
}