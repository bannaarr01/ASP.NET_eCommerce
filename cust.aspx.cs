using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class cust : System.Web.UI.Page
{
    public SqlConnection con;
    public string constr;

    public void connection()
    {
        constr = ConfigurationManager.ConnectionStrings["Grocery"].ToString();
        con = new SqlConnection(constr);
        con.Open();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindGrid();
        }
    }


    private void BindGrid()
    {
        connection();
        {
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Customers] "))
            {


                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        //GvCust.DataSource = dt;
                        //  GvCust.DataBind();
                        gvCustomers.DataSourceID = null;
                        gvCustomers.DataSource = dt;
                        gvCustomers.DataBind();
                    }
                }
            }
            //conn.Close();
        }

    }

    private void rep_bind()
    {
        connection();
        string query = "select * from Customers where Email like'" + txtSearch.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvCustomers.DataSourceID = null;
        gvCustomers.DataSource = ds;
        gvCustomers.DataBind();
    }

    private void SearchCustomers()
    {
        string constr = ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "SELECT * FROM Customers";
                if (!string.IsNullOrEmpty(txtSearch.Text.Trim()))
                {
                    sql += " WHERE Email LIKE  @email + '%'";
                    cmd.Parameters.AddWithValue("@email", txtSearch.Text.Trim());

                }

                cmd.CommandText = sql;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvCustomers.DataSource = dt;
                        gvCustomers.DataBind();
                        lblRecord.Text = "RECORD FOUND!";
                        lblRecord.ForeColor = System.Drawing.Color.Green;

                    }
                    else
                    {

                        dt.Rows.Add(dt.NewRow());
                        gvCustomers.DataSource = dt;
                        gvCustomers.DataBind();
                        gvCustomers.Rows[0].Cells.Clear();
                        gvCustomers.Rows[0].Cells.Add(new TableCell());
                        gvCustomers.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                        gvCustomers.Rows[0].Cells[0].Text = "Sorry, no record found ..!";
                        gvCustomers.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        lblRecord.Text = "RECORD NOT FOUND!";
                        lblRecord.ForeColor = System.Drawing.Color.Red;

                    }
                }
            }
        }
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {


        this.SearchCustomers();

        hlBack.Visible = true;
        //connection();
        //string query = "select * from Customers where Email like'" + txtSearch.Text + "%'";
        //SqlCommand com = new SqlCommand(query, con);

        //SqlDataReader dr;
        //dr = com.ExecuteReader();


        //if (dr.HasRows)
        //{
        //    dr.Read();

        //    rep_bind();

        //}
        //else
        //{

        //    lblRecord.Text =  txtSearch.Text + " &nbsp;Is Not Available in the Records";
        //    lblRecord.ForeColor = System.Drawing.Color.Red;

        //}


    }



    protected void gvCustomers_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        gvCustomers.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void gvCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = gvCustomers.SelectedRow;

    }
}
