using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class index : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);
    string[] RateArray = { "😕Bad", "😐Good", "😁Excellent" };
    string[] ProbArray = { "Not working with various browsers and devices", "Complicated site navigation", "Unattractive website layout", "Other Problems" };
    protected void Page_PreRender(object send, EventArgs e)
    {
        if (!IsPostBack)
        {
            rdlRate.DataSource = RateArray;
            rdlRate.DataBind();
            cblProblems.DataSource = ProbArray;
            cblProblems.DataBind();

            conn.Open();
            string com = "Select * from Categories";
            SqlDataAdapter adpt = new SqlDataAdapter(com, conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCategory.DataSource = dt;
            ddlCategory.DataBind();
            ddlCategory.DataTextField = "LongName";
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataBind();
            conn.Close();
        }

        conn.Open();
        // string CatID = Request.QueryString["CategoryID"];
        SqlCommand cmd = new SqlCommand("SELECT top 4 * FROM [Products] WHERE CategoryID =@CategoryID", conn);
        cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
        //SqlCommand cmd = new SqlCommand("SELECT * FROM [Products]", conn);
        SqlDataAdapter sda = new SqlDataAdapter();
        {
            cmd.Connection = conn;
            sda.SelectCommand = cmd;

            using (DataTable dt = new DataTable())
            {
                sda.Fill(dt);
                dlFP.DataSource = dt;
                dlFP.DataBind();

            }

        }
        conn.Close();

    }

    protected void Page_Load(object sender, EventArgs e)
    {


    }


    protected void txtFname_TextChanged(object sender, EventArgs e)
    {
        lblFnameSurvey.Text = "Hi&nbsp;" + txtFname.Text + "&nbsp;could you provide us your email";
        lblFnameSurvey.Visible = true;
        lblEmail.Visible = true;
        txtEmail.Visible = true;
        lblProblemChoose.Visible = true;
        cblProblems.Visible = true;
    }

    protected void cblProblems_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cblProblems.SelectedIndex == 3)
        {
            lblOthers.Visible = true;
            txtDescPro.Visible = true;
        }
    }

    protected void rdlRate_SelectedIndexChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < 3; i++)
        {
            if (rdlRate.SelectedIndex == i)
            {
                mvRate.ActiveViewIndex = i;
                break;
            }
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        conn.Open();
        // string CatID = Request.QueryString["CategoryID"];
        SqlCommand cmd = new SqlCommand("SELECT top 4 * FROM [Products] WHERE CategoryID =@CategoryID", conn);
        cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
        //SqlCommand cmd = new SqlCommand("SELECT * FROM [Products]", conn);
        SqlDataAdapter sda = new SqlDataAdapter();
        {
            cmd.Connection = conn;
            sda.SelectCommand = cmd;

            using (DataTable dt = new DataTable())
            {
                sda.Fill(dt);
                dlFP.DataSource = dt;
                dlFP.DataBind();

            }

        }
        conn.Close();

    }
}

