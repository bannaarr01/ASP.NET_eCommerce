using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI.WebControls;

namespace Website
{

    public partial class Product : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Products";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DL1.DataSource = dt;
            DL1.DataBind();

            conn.Close();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            conn.Open();
            // string CatID = Request.QueryString["CategoryID"];
            SqlCommand cmd = new SqlCommand("SELECT  * FROM [Products] WHERE Name LIKE '%' + @Name + '%'", conn);
            cmd.Parameters.AddWithValue("@name", txtProSearch.Text);
            //SqlCommand cmd = new SqlCommand("SELECT * FROM [Products]", conn);
            SqlDataAdapter sda = new SqlDataAdapter();
            {
                cmd.Connection = conn;
                sda.SelectCommand = cmd;

                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    DL1.DataSource = dt;
                    DL1.DataBind();

                }

            }
            conn.Close();

        }

        protected void btnPurchase_Click(object sender, EventArgs e)
        {
            //HttpCookie cookie = new HttpCookie("Cartcookie");


            //conn.Open();
            //SqlCommand cmd = new SqlCommand("SELECT * FROM [Products] WHERE ProductID= '" +   + "'", conn);
            //SqlDataReader dr = cmd.ExecuteReader();
            //bool recordfound = dr.Read();
            //if (recordfound)
            //{
            //    cookie["Name"] = dr["Name"].ToString();
            //    cookie["Price"] = dr["UnitPrice"].ToString();
            //    Response.Cookies.Add(cookie);
            //    cookie.Expires = DateTime.Now.AddDays(20);
            //    Response.Redirect("Cart.aspx");
            //}
            //conn.Close();
        }
    }
}