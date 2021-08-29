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

public partial class Stock : System.Web.UI.Page
{
   
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);

    protected void Page_PreRender(object send, EventArgs e)
    {
        HyperLink masterHyper = (HyperLink)Master.FindControl("Management");
        masterHyper.Visible = true;
    }

    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            conn.Open();
            string com = "Select * from Categories";
            SqlDataAdapter adpt = new SqlDataAdapter(com, conn);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddlCat.DataSource = dt;
            ddlCat.DataBind();
            ddlCat.DataTextField = "CategoryID";
            ddlCat.DataValueField = "CategoryID";
            ddlCat.DataBind();
            conn.Close();

            //Function Call
            PopulateGridview();

        }


    }

    //Function
    void PopulateGridview()
    {

        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from Products", conn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        gvProductMan.DataSource = ds;
        gvProductMan.DataBind();

        if (conn.State == ConnectionState.Closed)
        {

            DataTable dtbl = new DataTable();
            {
                conn.Open();
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Products", conn);
                sda.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                gvProductMan.DataSource = dtbl;
                gvProductMan.DataBind();

            }
            else
            {

                dtbl.Rows.Add(dtbl.NewRow());
                gvProductMan.DataSource = dtbl;
                gvProductMan.DataBind();
                gvProductMan.Rows[0].Cells.Clear();
                gvProductMan.Rows[0].Cells.Add(new TableCell());
                gvProductMan.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvProductMan.Rows[0].Cells[0].Text = "Sorry, no record found ..!";
                gvProductMan.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;

            }
            conn.Close();
        }

    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvProductMan.PageIndex = e.NewPageIndex;
        this.SearchProducts();

    }

    private void SearchProducts()
    {
        string constr = ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString;

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "SELECT * FROM Products";
                if (!string.IsNullOrEmpty(txtProSearch.Text.Trim()))
                {
                    sql += " WHERE Name LIKE  @Name + '%'";
                    cmd.Parameters.AddWithValue("@Name", txtProSearch.Text.Trim());

                }

                cmd.CommandText = sql;
                cmd.Connection = con;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvProductMan.DataSource = dt;
                        gvProductMan.DataBind();
                        lblProSearchMessage.Text = "RECORD FOUND!";
                        lblProSearchMessage.ForeColor = System.Drawing.Color.Green;

                    }
                    else
                    {

                        dt.Rows.Add(dt.NewRow());
                        gvProductMan.DataSource = dt;
                        gvProductMan.DataBind();
                        gvProductMan.Rows[0].Cells.Clear();
                        gvProductMan.Rows[0].Cells.Add(new TableCell());
                        gvProductMan.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                        gvProductMan.Rows[0].Cells[0].Text = "Sorry, no record found ..!";
                        gvProductMan.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
                        lblProSearchMessage.Text = "RECORD NOT FOUND!";
                        lblProSearchMessage.ForeColor = System.Drawing.Color.Red;

                    }
                }
            }
        }
    }


    protected void btnProSearch_Click(object sender, EventArgs e)
    {
        this.SearchProducts();
    }

    protected void gvProductMan_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvProductMan.EditIndex = e.NewEditIndex;
        PopulateGridview();

    }

    protected void gvProductMan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvProductMan.EditIndex = -1;
        PopulateGridview();
    }

    protected void gvProductMan_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        //find image id of edit row    
        string imageId = gvProductMan.DataKeys[e.RowIndex].Value.ToString();
        // find values for update    
        FileUpload FileUp = (FileUpload)gvProductMan.Rows[e.RowIndex].FindControl("fuEdit");
        string path = "~/Images/Products/";
        if (FileUp.HasFile)
        {
            path += FileUp.FileName;
            //save image in folder    
            FileUp.SaveAs(MapPath(path));
        }
        else
        {
            // use previous user image if new image is not changed    
            Image img = (Image)gvProductMan.Rows[e.RowIndex].FindControl("ImgProduct");
            path = img.ImageUrl;
        }
        SqlCommand cmd = new SqlCommand("update Products set ImageFile='" + path + "'  where ProductID=@identity", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@identity", Convert.ToInt32(gvProductMan.DataKeys[e.RowIndex].Value.ToString()));
        cmd.ExecuteNonQuery();
        conn.Close();

        conn.Open();

        SqlCommand cmd2 = new SqlCommand("UPDATE Products SET Products.Name=@name,Products.ShortDescription=@shortD,Products.LongDescription=@longD,Products.CategoryID=@CID,Products.UnitPrice=@price,Products.OnHand=@qty FROM Products,Categories WHERE Products.CategoryID=Categories.CategoryID AND Products.ProductID=@id", conn);

        cmd2.Parameters.AddWithValue("@name", (gvProductMan.Rows[e.RowIndex].FindControl("txtProName") as TextBox).Text.Trim());
        cmd2.Parameters.AddWithValue("@shortD", (gvProductMan.Rows[e.RowIndex].FindControl("txtSDescription") as TextBox).Text.Trim());
        cmd2.Parameters.AddWithValue("@longD", (gvProductMan.Rows[e.RowIndex].FindControl("txtLDescription") as TextBox).Text.Trim());
        cmd2.Parameters.AddWithValue("@CID", (gvProductMan.Rows[e.RowIndex].FindControl("txtLCat") as TextBox).Text.Trim());
        cmd2.Parameters.AddWithValue("@price", (gvProductMan.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text.Trim());
        cmd2.Parameters.AddWithValue("@qty", (gvProductMan.Rows[e.RowIndex].FindControl("txtQty") as TextBox).Text.Trim());
        cmd2.Parameters.AddWithValue("@id", Convert.ToInt32(gvProductMan.DataKeys[e.RowIndex].Value.ToString()));
        cmd2.ExecuteNonQuery();
        gvProductMan.EditIndex = -1;
        conn.Close();

        PopulateGridview();
    }


    protected void gvProductMan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        conn.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductID=@Id", conn);
        {
            cmd.Parameters.AddWithValue("@Id", gvProductMan.DataKeys[e.RowIndex].Value.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            PopulateGridview();

            Response.Write("<script>alert('Record deleted Successfully!');</script>");




        }

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fuImg.HasFile)
        {
            try
            {
                if (fuImg.PostedFile.ContentType == "image/jpeg")
                {
                    if (fuImg.PostedFile.ContentLength <= 15728640)
                    {
                        string filename = Path.GetFileName(fuImg.FileName);
                        fuImg.SaveAs(Server.MapPath("~/Images/Products/") + filename);
                        string link = "~/Images/Products/" + Path.GetFileName(fuImg.FileName);
                        imgCheck.ImageUrl = link;
                        lblStatus.Visible = true;
                        lblStatus.Text = "Upladed status: Successful!";
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblStatus.Text = "Upladed status: File has to be less than 15MB!";
                        lblStatus.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblStatus.Text = "Upladed status: We accept only image files!";
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Upladed status: The file could not be uploaded! The following error occured: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void imgbtnCreateP_Click(object sender, ImageClickEventArgs e)
    {

        string link = imgCheck.ImageUrl;


        if (conn.State == ConnectionState.Closed)
        {

            conn.Open();
            string insertQuery = " INSERT INTO Products (Name,ShortDescription,LongDescription,CategoryID,ImageFile,UnitPrice,OnHand) values (@Name,@shortName,@longName,@CategoyID,@imgFile,@price,@qty)";
            string checkQuery = " select Count(*) from Products where Name=@Name";
            SqlCommand cmd = new SqlCommand(checkQuery, conn);
            SqlCommand com = new SqlCommand(insertQuery, conn);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            int result = (int)cmd.ExecuteScalar();
            if (result != 0)
            {
                lblDupCheck.Text = "Sorry, Product already exist*";
                lblDupCheck.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                com.Parameters.AddWithValue("@Name", txtName.Text);
                com.Parameters.AddWithValue("@shortName", txtSDesc.Text);
                com.Parameters.AddWithValue("@longName", txtLDesc.Text);
                com.Parameters.AddWithValue("@CategoyID", ddlCat.SelectedValue);
                com.Parameters.AddWithValue("@imgFile", link);
                com.Parameters.AddWithValue("@price", txtPriceA.Text);
                com.Parameters.AddWithValue("@qty", txtQtyA.Text);
                com.ExecuteNonQuery();
                Response.Write("<script>alert('Category added successfully. Thanks!')</script>");
                Clear();
            }

            conn.Close();

        }



    }
    public void Clear()
    {
        txtName.Text = txtPriceA.Text = txtProSearch.Text = txtQtyA.Text = txtSDesc.Text = txtLDesc.Text = "";
        ddlCat.ClearSelection();
        imgCheck.ImageUrl = "";
        lblDupCheck.Visible = false;
        lblStatus.Visible = false;
        fuImg.Dispose();
    }



    protected void linkSelected_Click(object sender, EventArgs e)
    {

        int rowindex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

        imgCheck.ImageUrl = gvProductMan.Rows[rowindex].Cells[1].Text;
        txtName.Text = gvProductMan.Rows[rowindex].Cells[2].Text;
        txtSDesc.Text = gvProductMan.Rows[rowindex].Cells[3].Text;
        txtLDesc.Text = gvProductMan.Rows[rowindex].Cells[4].Text;
        txtPriceA.Text = gvProductMan.Rows[rowindex].Cells[6].Text;
        txtQtyA.Text = gvProductMan.Rows[rowindex].Cells[7].Text;
    }




    protected void imgbtnProMan_Click(object sender, ImageClickEventArgs e)
    {
        mvStockOpt.ActiveViewIndex = 0;
    }

    protected void ImgbtnFAQ_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Faq2.aspx");
    }

    protected void imgbtnUsrMan_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/cust.aspx");
    }
}
