using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Collections;

public partial class MyCart : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["Cartcookie"];
        if (cookie != null)
        {
            lblName.Text = cookie["Name"];
            lblPricePerUnit.Text = cookie["Price"];
            string picture = cookie["Image"];
            imgProductImage.ImageUrl = picture;     
        }


    }
    string email = "werrew230@gmail.com";
   

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        double pricePerUnit = double.Parse(lblPricePerUnit.Text);
        double price;
       
            int quantity = int.Parse(txtQuantity.Text);
            price = quantity * pricePerUnit;
            lblTotalPrice.Text = string.Format("{0:0.00}", price);
          lblTotalBill.Text = lblTotalPrice.Text;
     
       
        }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("Payment.aspx");
    }
}
