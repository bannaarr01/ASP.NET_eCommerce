using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Email"] != null)
        {
            userText.Text = "Hello, " + Session["Email"].ToString();
            userIconin.Visible = false;
            userIconout.Visible = true;


        }
        else
        {
            userText.Text = "Hello Visitor, Welcome!!!";
            userIconin.Visible = true;
            userIconout.Visible = false;
        }
    }



    protected void ImgLeft_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Home.aspx");
    }

    protected void userIconout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Logout.aspx");
    }
}
