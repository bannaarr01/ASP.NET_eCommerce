using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Net.Mail;


public partial class faq : System.Web.UI.Page
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

        connection();
        string query = "select * from tFaq "; //where Email like'" + txtSearch.Text + "%'";

        SqlDataAdapter da = new SqlDataAdapter(query, con);

        DataSet ds = new DataSet();
        da.Fill(ds, "tFaq");

        //rpFaq.DataSourceID = null;
        rpFaq.DataSource = ds;
        rpFaq.DataMember = "tFaq";
        rpFaq.DataBind();



        //connection();
        //string query = "select * from tFaq ";   // where Email like'" + txtSearch.Text + "%'";
        //SqlCommand com = new SqlCommand(query, con);

        //SqlDataReader dr;
        //dr = com.ExecuteReader();


        //if (dr.HasRows)
        //{
        //    dr.Read();

        //    rep_bind();

        //}

        //if (!IsPostBack)
        //{
        //    lbl.Visible = false;
        //}

        // else
        // {

        //lblRecord.Text = txtSearch.Text + " &nbsp;Is Not Available in the Records";
        //lblRecord.ForeColor = System.Drawing.Color.Red;

        // }


    }


    //private void rep_bind()
    //{
    //    connection();
    //    string query = "select * from tFaq "; //where Email like'" + txtSearch.Text + "%'";

    //    SqlDataAdapter da = new SqlDataAdapter(query, con);

    //    DataSet ds = new DataSet();
    //    da.Fill(ds, "tFaq");

    //    //rpFaq.DataSourceID = null;
    //    rpFaq.DataSource = ds;
    //    rpFaq.DataMember = "tFaq";
    //    rpFaq.DataBind();

    //}

    //protected void btnShowQuestn_Click(object sender, EventArgs e)
    //{



    //    if (ans.Visible != true)
    //    {
    //        ans.Visible = true;

    //    }
    //    else
    //    {
    //        ans.Visible = false;
    //    }
    //}




    //protected void DataList1_ItemCommand1(object source, DataListCommandEventArgs e)
    //{


    //        //DataListItem item = (DataListItem)(((Button)(e.CommandSource)).NamingContainer);
    //        //string text = ((Label)item.FindControl("lblAns")).Text;

    //        DataListItem item = (DataListItem)(((Button)(e.CommandSource)).NamingContainer);
    //        Label lbl = ((Label)item.FindControl("lblAns")) as Label;
    //            if (lbl.Visible !=true)
    //            {
    //                lbl.Visible = true;
    //            }
    //        else
    //        {
    //            lbl.Visible = false;
    //        }

    //    }

    //protected void btnShowQuestn_Click(object sender, DataListItemEventArgs e)
    //{

    //    foreach (DataListItem item in DataList1.Items)
    //    {
    //        Label lbl = (Label)item.FindControl("lblAns");

    //        // Do what you need to with this label
    //        if (lbl.Visible != true)
    //        {
    //            lbl.Visible = true;
    //        }
    //        else
    //        {
    //            lbl.Visible = false;
    //        }

    //    }
    //}






    //protected void btnShowQuestn_Click(object sender, EventArgs e)
    //{
    //    foreach (ListViewItem item in lvFaq.Items)
    //    {
    //        Label mylabel = (Label)item.FindControl("lblAns");
    //        mylabel.Visible = true;
    //    }




    protected void btnCntact_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("joshboluwaji6@gmail.com");
                mailMessage.To.Add("joshboluwaji6@gmail.com");
                mailMessage.Subject = txtSubject.Text;

                mailMessage.Body = "<b>Sender Name : </b>" + txtName.Text + "<br/>"

                    + "<b>Sender Email : </b>" + txtEmail.Text + "<br/>"
                + "<b>Phone : </b>" + txtPhone.Text + "<br/>"
                 + "<b>Subject : </b>" + txtSubject.Text + "<br/>"
                + "<b>Comments : </b>" + txtComments.Text;
                mailMessage.IsBodyHtml = true;


                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new
                    System.Net.NetworkCredential("joshboluwaji6@gmail.com", "Glory2020");
                smtpClient.Send(mailMessage);

                lblMssg.ForeColor = System.Drawing.Color.Blue;
                lblMssg.Text = "Thank you for contacting us";

                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtComments.Enabled = false;
                txtSubject.Enabled = false;
                txtPhone.Enabled = false;
                btnCntact.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            // Log the exception information to 
            // database table or event viewer
            lblMssg.ForeColor = System.Drawing.Color.Red;
            lblMssg.Text = "Your Message Cannot be Sent. Please try Again...";
        }
    }
}







//protected void btnShowQuestn_Click(object sender, System.Web.UI.WebControls.DataListItemEventArgs e)
//{ 
//    if (ans.Visible != true)
//    {
//        ans.Visible = true;

//    }
//    else
//    {
//        ans.Visible = false;
//    }
//}











//private void BindGrid()
//{
//    connection();
//    {
//        using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tFaq] "))
//        {


//            using (SqlDataAdapter sda = new SqlDataAdapter())
//            {
//                cmd.Connection = con;
//                sda.SelectCommand = cmd;
//                using (DataSet ds = new DataSet())
//                {
//                    sda.Fill(ds);
//                    //GvCust.DataSource = dt;
//                    //  GvCust.DataBind();
//                    //rpFaq.DataSourceID = null;
//                    rpFaq.DataSource = ds;
//                    rpFaq.DataBind();
//                }
//            }
//        }
//        //conn.Close();
//    }

//}

//private void rep_bind()
//{
//    connection();
//    string query = "select * from tFaq "; //where Email like'" + txtSearch.Text + "%'";

//    SqlDataAdapter da = new SqlDataAdapter(query, con);
//    DataSet ds = new DataSet();
//    da.Fill(ds);
//    rpFaq.DataSourceID = null;
//    rpFaq.DataSource = ds;
//    rpFaq.DataBind();
//}




//protected void btnSearch_Click(object sender, EventArgs e)
//{
//    connection();
//    string query = "select * from Customers where Email like'" + txtSearch.Text + "%'";
//    SqlCommand com = new SqlCommand(query, con);

//    SqlDataReader dr;
//    dr = com.ExecuteReader();


//    if (dr.HasRows)
//    {
//        dr.Read();

//        rep_bind();

//    }
//    else
//    {

//        lblRecord.Text = txtSearch.Text + " &nbsp;Is Not Available in the Records";
//        lblRecord.ForeColor = System.Drawing.Color.Red;

//    }




