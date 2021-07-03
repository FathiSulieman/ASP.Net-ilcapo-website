using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;


namespace Web_project
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request["type"].ToString().Equals("Admin_login"))
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    HttpCookie cook = new HttpCookie("myCookies");
                    cook.Expires = DateTime.Now.AddDays(1);
                    cook.Value = Request["type"].ToString();
                    Response.Cookies.Add(cook);
                    String s = Request["type"].ToString();
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select * from tbl_Admins where admin_email=@Email", con);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        String myGUID = Guid.NewGuid().ToString();
                        int Uid = Convert.ToInt32(dt.Rows[0][0]);

                        SqlCommand cmd1 = new SqlCommand("Insert into tbl_ForgotPassword(Id,Uid,RequestDateTime) values('" + myGUID + "','" + Uid + "',GETDATE())", con);
                        cmd1.ExecuteNonQuery();
                       
                       
                        
                        //Send Reset link via Email

                        String ToEmailAddress = dt.Rows[0][1].ToString();
                        String Username = dt.Rows[0][3].ToString();
                        String EmailBody = "Hi ," + Username + ",<br/><br/>Click the link below to reset your password<br/> <br/> https://localhost:44358/RecoverPass?id=" + myGUID;


                        MailMessage PassRecMail = new MailMessage("mahmoud.sulieman45@gmail.com", ToEmailAddress);

                        PassRecMail.Body = EmailBody;
                        PassRecMail.IsBodyHtml = true;
                        PassRecMail.Subject = "Reset Password";

                        using (SmtpClient client = new SmtpClient())
                        {
                            client.EnableSsl = true;
                            client.UseDefaultCredentials = false;
                            client.Credentials = new NetworkCredential("mahmoud.sulieman45@gmail.com", "noPeaks");
                            client.Host = "smtp.gmail.com";
                            client.Port = 587;
                            client.DeliveryMethod = SmtpDeliveryMethod.Network;

                            client.Send(PassRecMail);
                        }

                        //--------------


                        Label1.Text = "Reset Link send ! Check YOur email for reset password";
                        Label1.ForeColor = System.Drawing.Color.Green;
                        txtEmail.Text = string.Empty;
                    }
                    else
                    {
                        Label1.Text = "OOps! This Email Does not Exist...Try agian ";
                        Label1.ForeColor = System.Drawing.Color.Red;
                        txtEmail.Text = string.Empty;
                        txtEmail.Focus();

                    }


                }


            }
            if (Request["type"].ToString().Equals("userLogin"))
            {
                
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    HttpCookie cook = new HttpCookie("myCookies");
                    cook.Expires = DateTime.Now.AddDays(1);
                    cook.Value = Request["type"].ToString();
                    Response.Cookies.Add(cook);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select * from tbl_Users where user_email=@Email", con);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        String myGUID = Guid.NewGuid().ToString();
                        int Uid = Convert.ToInt32(dt.Rows[0][0]);

                        SqlCommand cmd1 = new SqlCommand("Insert into tbl_ForgotPassword(Id,Uid,RequestDateTime) values('" + myGUID + "','" + Uid + "',GETDATE())", con);
                        cmd1.ExecuteNonQuery();


                        

                        //String sql = "insert into tbl_ForgotPassword(type) values(@t)";



                        //SqlCommand sqlCommand = new SqlCommand(sql, con);

                        //cmd1.ExecuteNonQuery();

                        //Send Reset link via Email

                        String ToEmailAddress = dt.Rows[0][1].ToString();
                        String Username = dt.Rows[0][3].ToString();
                        String EmailBody = "Hi ," + Username + ",<br/><br/>Click the link below to reset your password<br/> <br/> https://localhost:44358/RecoverPass?id=" + myGUID;


                        MailMessage PassRecMail = new MailMessage("mahmoud.sulieman45@gmail.com", ToEmailAddress);

                        PassRecMail.Body = EmailBody;
                        PassRecMail.IsBodyHtml = true;
                        PassRecMail.Subject = "Reset Password";

                        using (SmtpClient client = new SmtpClient())
                        {
                            client.EnableSsl = true;
                            client.UseDefaultCredentials = false;
                            client.Credentials = new NetworkCredential("mahmoud.sulieman45@gmail.com", "NoPeaks");
                            client.Host = "smtp.gmail.com";
                            client.Port = 587;
                            client.DeliveryMethod = SmtpDeliveryMethod.Network;

                            client.Send(PassRecMail);
                        }

                        //--------------


                        Label1.Text = "Reset Link send ! Check YOur email for reset password";
                        Label1.ForeColor = System.Drawing.Color.Green;
                        txtEmail.Text = string.Empty;
                       

                       
                    }
                    else
                    {
                        Label1.Text = "OOps! This Email Does not Exist...Try agian ";
                        Label1.ForeColor = System.Drawing.Color.Red;
                        txtEmail.Text = string.Empty;
                        txtEmail.Focus();

                    }


                }


            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request["type"].ToString() + ".aspx");
        }
    }
}
