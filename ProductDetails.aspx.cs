using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Website
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conn.Open();
                string prodID = Request.QueryString["ID"];
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Products] WHERE ProductID= '" + prodID + "'", conn);
                SqlDataAdapter sda = new SqlDataAdapter();
                {
                    cmd.Connection = conn;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        if (prodID != null)
                        {
                            sda.Fill(dt);
                            dlProduct.DataSource = dt;
                            dlProduct.DataBind();

                        }
                    }
                }
                conn.Close();
            }
        }

        protected void btnShowCart_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("Cartcookie");

            conn.Open();
            string prodID = Request.QueryString["ID"];
            SqlCommand cmd = new SqlCommand("SELECT * FROM [Products] WHERE ProductID= '" + prodID + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            bool recordfound = dr.Read();
            if (recordfound)
            {
                cookie["Name"] = dr["Name"].ToString();
                cookie["Price"] = dr["UnitPrice"].ToString();
                Response.Cookies.Add(cookie);
                cookie.Expires = DateTime.Now.AddDays(20);
                Response.Redirect("MyCart.aspx");
            }
            conn.Close();
        }
    }
}