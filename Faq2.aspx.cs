using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Faq2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            result.Visible = false;
            btnUpdate.Visible = false;
            btnDelete.Visible = false;
            
        }

    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
      
        conn.Open();


        SqlCommand cmd = new SqlCommand("SELECT * FROM [tFaq] WHERE Id like'" + txtSearch.Text + "%'", conn);
      
        cmd.Parameters.AddWithValue("Idd", txtSearch.Text); //To Get it from the TextBox, Put into para id and pass to the query

        SqlDataReader dr = cmd.ExecuteReader();
        bool recordfound = dr.Read(); //Local variable = recordfound
        if (recordfound)
        {
            result.Visible = true;
            lblResult.Text = "Record Found.....";
            lblResult.ForeColor = System.Drawing.Color.Green;
            lblQAID.Text = dr["Id"].ToString();
            lblQuestion.Text = dr["Question"].ToString();
            lblAnswer.Text = dr["Answer"].ToString();

        }
        else
        {
            lblResult.Text = "Record not found....";
            lblResult.ForeColor = System.Drawing.Color.Red;
            result.Visible = false;

        }
        conn.Close();
    }

    public void Clear()
    {
        txtSearch.Text = txtQAID.Text = txtQuestion.Text = txtAnswer.Text = "";
        lblResult.Text = lblSuccess.Text = lblError.Text = "";
        btnSave.Visible = true;
        btnUpdate.Visible = false;
    }



    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
      

        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            //string insertQuery = "INSERT INTO tFaq(Id, Question, Answer) VALUES (@Id,@Question,@Answer)";
            string insertQuery = " SET IDENTITY_INSERT tFaq On insert INTO tFaq(Id, Question, Answer) VALUES (@Id,@Question,@Answer) SET IDENTITY_INSERT tFaq OFF";
          

            SqlCommand comd = new SqlCommand(insertQuery, conn);
            comd.Parameters.AddWithValue("@Id", Convert.ToInt16(txtQAID.Text));
            comd.Parameters.AddWithValue("@Question", txtQuestion.Text);
            comd.Parameters.AddWithValue("@Answer", txtAnswer.Text);
            comd.ExecuteNonQuery();

            Response.Write("<script>alert('Frequently Question And Answer added successfully. Thank you!')</script>");
            //result.Visible = true;
            conn.Close();
            Clear();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.ToString();
        }


        //try
        //{
        //    if (conn.State == ConnectionState.Closed)
        //    {
        //        conn.Open();
        //    }
        //    string insertQuery = "INSERT INTO tFaq (Id, Question, Answer) VALUES (@Id,@Quest,@Ans)";
        //    SqlCommand comd = new SqlCommand(insertQuery, conn);
        //   comd.Parameters.AddWithValue("@Id", txtQAID.Text);

        //    comd.Parameters.AddWithValue("@Quest", txtQuestion.Text);
        //    comd.Parameters.AddWithValue("@Ans", txtAnswer.Text);
        //    comd.ExecuteNonQuery();

        //    Response.Write("<script>alert('Frequently Question And Answer added successfully. Thank you!')</script>");
        //    //result.Visible = true;
        //    conn.Close();
        //    Clear();
        //}
        //catch (Exception ex)
        //{
        //    lblError.Text = "Error: " + ex.ToString();
        //}




    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        hlBack.Visible = true;    
        result.Visible = false;
        string cid = lblQAID.Text;
        string shortName = lblQuestion.Text;
        string longName = lblAnswer.Text;

        txtQAID.Text = cid;
        txtQuestion.Text = shortName;
        txtAnswer.Text = longName;
        txtQAID.Enabled = false;

        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        btnSave.Visible = false;
        btnClear.Visible = false;

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
            string UpdateSql = "UPDATE tFaq SET Question=@question, Answer=@answer WHERE Id=@iid";
            SqlCommand commdd = new SqlCommand(UpdateSql, conn);
            {
                commdd.Parameters.AddWithValue("@iid", txtQAID.Text);
                commdd.Parameters.AddWithValue("@Question", txtQuestion.Text);
                commdd.Parameters.AddWithValue("@Answer", txtAnswer.Text);

                commdd.ExecuteNonQuery();
            }
            Response.Write("<script>alert('Record updated successfully!')</script>");

            commdd.Dispose();
            conn.Close();
            Clear();
            txtQAID.Enabled = true;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        result.Visible = false;
        if (conn.State == ConnectionState.Closed)
        {
            try
            {
                conn.Open();
                using (SqlCommand comnd = new SqlCommand("DELETE FROM tFaq WHERE Id=@Idd", conn))
                {
                    // If its intiger comnd.Parameters.AddWithValue("Id", txtCatID.ConvertTo Int)
                    comnd.Parameters.AddWithValue("Idd", txtQAID.Text);
                    int rows = comnd.ExecuteNonQuery();
                    txtQAID.Enabled = true;
                    Response.Write("<script>alert('Record Deleted successfully!')</script>");
                    conn.Close();
                    Clear();

                }
            }
            catch (SqlException ex)
            {
                lblError.Text = "Error: " + ex.ToString();
            }
        }
    }
}