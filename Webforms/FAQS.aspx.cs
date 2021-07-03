using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class FAQS : System.Web.UI.Page
    {
        int id, ItemCount = 0;
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
        }
    }
}