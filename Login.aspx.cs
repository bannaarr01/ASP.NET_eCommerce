using System;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.VisualBasic;
using System.Text;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);

                conn.Open();


                SqlCommand cmd = new SqlCommand("SELECT * FROM [Customers] WHERE Email=@Email AND Password=@password", conn);
                cmd.Parameters.AddWithValue("@Email", txtUsernam.Text);
                cmd.Parameters.AddWithValue("@password", txtPasswd.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["Email"] = dr["Email"].ToString();
                        Session["isAdmin"] = dr["isAdmin"].ToString();
                        int userRole = Convert.ToInt16(dr["isAdmin"].ToString());
                        lblMssg.Text = "";
                        btnLogin.BackColor=System.Drawing.Color.Green ;
                        switch (userRole)
                        {
                            case 0:
                                Response.Write("<script>alert('WELCOME OUR BEST CUSTOMER!');</script>");
                                Response.Redirect("~/Product.aspx");
                                
                                break;
                            case 1:
                                Response.Write("<script>alert('Welcome ADMIN!');</script>");
                                Response.Redirect("~/Stock.aspx");
                                break;

                        }
                    }
                }

                else if (passwordValidate.IsValid && emailValidate1.IsValid && emailValidate2.IsValid)
                {
                    dr.Close();
                    lblMssg.Text = "Email/Password is incorrect";
                }
                else
                    lblMssg.Text = "";
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }





        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registeration.aspx");
        }
    }
}