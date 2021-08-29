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

public partial class Registeration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);
    string[] PenangArr = { "George Town", "Seberang Perai" };
    string[] SarawakArr = { "Kuching", "Miri" };
    string[] PerakArr = { "Ipoh" };
    string[] SelangorArr = { "Shah Alam", "Petaling Jaya", "Subang Jaya" };

    protected void Page_PreRender(object send, EventArgs e)
    {
        string[] stateArray = { "Penang", "Sarawak", "Perak", "Selangor" };
        ddlState.DataSource = stateArray;
        ddlState.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {


        if (ddlState.SelectedIndex == 0)
        {
            ddlState.SelectedIndex = 0;
            ddlCity.DataSource = PenangArr;
            ddlCity.DataBind();
        }
        else if (ddlState.SelectedIndex == 1)
        {
            ddlState.SelectedIndex = 1;
            ddlCity.DataSource = SarawakArr;
            ddlCity.DataBind();
        }
        else if (ddlState.SelectedIndex == 2)
        {
            ddlState.SelectedIndex = 2;
            ddlCity.DataSource = PerakArr;
            ddlCity.DataBind();
        }
        else
        {
            ddlState.SelectedIndex = 3;
            ddlCity.DataSource = SelangorArr;
            ddlCity.DataBind();
        }
    }


    protected void cvUnderstood_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = cbTerms.Checked;
    }

    protected void cbTerms_CheckedChanged(object sender, EventArgs e)
    {
        if (cbTerms.Checked)
        { cbTerms.Enabled = true; }
        else
        { cbTerms.Enabled = false; }
    }

    protected void ValidationSummaryforErrors_Load(object sender, EventArgs e)
    {

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtAddress.Text="";
        txtCpassword.Text="";
        txtEmailReg.Text="";
        txtFirstName.Text="";
        txtLastName.Text="";
        txtPasswordReg.Text="";
        txtPhoneNumber.Text="";
        txtZCode.Text="";

        ddlCity.ClearSelection();
        ddlState.ClearSelection();

        cbTerms.Checked = false;
           
    }

    private void Clear()
    {
        txtAddress.Text = "";
        txtCpassword.Text = "";
        txtEmailReg.Text = "";
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtPasswordReg.Text = "";
        txtPhoneNumber.Text = "";
        txtZCode.Text = "";

        ddlCity.ClearSelection();
        ddlState.ClearSelection();

        cbTerms.Checked = false;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        {

            conn.Open();
            string insertQuery = " INSERT INTO Customers (Email,FirstName,LastName,Address,State,City,ZipCode,PhoneNumber,Password) values (@Email,@FirstName,@LastName,@Address,@State,@City,@ZipCode,@PhoneNumber,@Password)";
            string checkQuery = " select Count(*) from Customers where Email=@Email";
            string checkQueryPhone = " select Count(*) from Customers where PhoneNumber=@PhoneNumber";
            SqlCommand cmd = new SqlCommand(checkQuery, conn);
            SqlCommand cmdPhone = new SqlCommand(checkQueryPhone, conn);
            SqlCommand com = new SqlCommand(insertQuery, conn);
            cmd.Parameters.AddWithValue("@Email", txtEmailReg.Text);
            cmdPhone.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
            int result = (int)cmd.ExecuteScalar();
            int resultPhone = (int)cmdPhone.ExecuteScalar();
            if (result != 0)
            {
                Response.Write("<script>alert('Sorry the Email is already exist!')</script>");
            }
            else if(resultPhone != 0)
            {

                Response.Write("<script>alert('Sorry the Phone Number is already exist!')</script>");

            }
            else
            {
                com.Parameters.AddWithValue("@Email", txtEmailReg.Text);
                com.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                com.Parameters.AddWithValue("@LastName", txtLastName.Text);
                com.Parameters.AddWithValue("@Address", txtAddress.Text);
                com.Parameters.AddWithValue("@State", ddlState.SelectedValue);
                com.Parameters.AddWithValue("@City", ddlCity.SelectedValue);
                com.Parameters.AddWithValue("@ZipCode", txtZCode.Text);
                com.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                com.Parameters.AddWithValue("@Password", txtPasswordReg.Text);
                com.ExecuteNonQuery();
                Response.Write("<script>alert('Congratulation to be member of Budged Food!')</script>");
                Clear();
            }

            conn.Close();
            

        }
        
    }

}