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

public partial class MyAccount : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Grocery"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fuImg.HasFile)
        {
            try
            {
                if (fuImg.PostedFile.ContentType == "image/jpeg")
                {
                    if (fuImg.PostedFile.ContentLength <= 15360000)
                    {
                        string filename = Path.GetFileName(fuImg.FileName);
                        fuImg.SaveAs(Server.MapPath("~/images/Customers/") + filename);
                        string link = "~/images/Customers/" + Path.GetFileName(fuImg.FileName);
                        imgCheck.ImageUrl = link;
                        lblStatus.Text = "Upladed status: Successful!";
                        lblStatus.ForeColor = System.Drawing.Color.Green;
                        conn.Open();
                        string UpdateQuery = "UPDATE Customers SET CustomerAvatar=@imgFile WHERE Email=@email";
                        SqlCommand com = new SqlCommand(UpdateQuery, conn);
                        com.Parameters.AddWithValue("@email", Session["Email"].ToString());
                        com.Parameters.AddWithValue("@imgFile", link);
                        com.ExecuteNonQuery();
                        Response.Write("<script>alert('Image added successfully!')</script>");
                        conn.Close();
                    }
                    else
                    {
                        lblStatus.Text = "Upladed status: File has to be less than 150MB!";
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


    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        mvCustomization.ActiveViewIndex = 0;
    }

    protected void btnChangeAddress_Click(object sender, EventArgs e)
    {
        mvCustomization.ActiveViewIndex = 1;
    }

    protected void btnChangePhone_Click(object sender, EventArgs e)
    {
        mvCustomization.ActiveViewIndex = 2;
    }




    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Customers SET Password=@Password WHERE Email=@email", conn);
            cmd.Parameters.AddWithValue("@email", Session["Email"].ToString());
            cmd.Parameters.AddWithValue("@Password", txtNewPassword.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Updated Sucessfully!');</script>");
        }
        catch
        {
            Response.Write("<script>alert('There was an error!');</script>");
        }
    }

    protected void btnUpdateAddress_Click(object sender, EventArgs e)
    {

        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Customers SET Address=@Address WHERE Email=@email", conn);
            cmd.Parameters.AddWithValue("@email", Session["Email"].ToString());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Updated Sucessfully!');</script>");
        }
        catch
        {
            Response.Write("<script>alert('There was an error!');</script>");
        }

    }

    protected void btnUpdatePhoneNumber_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Customers SET PhoneNumber=@PhoneNumber WHERE Email=@email", conn);
            cmd.Parameters.AddWithValue("@email", Session["Email"].ToString());
            cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script>alert('Updated Sucessfully!');</script>");
        }
        catch
        {
            Response.Write("<script>alert('There was an error!');</script>");
        }
    }
}
