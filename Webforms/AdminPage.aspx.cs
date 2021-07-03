using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_project
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadImages();
        }
        private void LoadImages()
        {
            String cnxString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlCnx = new SqlConnection(cnxString);
            SqlCommand cmd = new SqlCommand("Select * from tbl_Products", sqlCnx);
            sqlCnx.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView3.DataSource = rdr;
            GridView3.DataBind();

        }
    }
}