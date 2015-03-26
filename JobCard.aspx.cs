using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class JobCard : System.Web.UI.Page
{
    InsertInformation I = new InsertInformation();
    string Running;
    public void Reset()
    {
       txtName.Text = "";
       ddlBike.SelectedIndex = 0;
        txtAddess.Text = "";
        txtContactNo.Text = "";
        txtEmailId.Text = "";
        txtCity.Text = "";
        txtKmStatus.Text = "";
        txtRemaingOil.Text = "";
        txtproblem.Text = "";
        ddl.SelectedIndex = 0;
        

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ConnectionManager cm = new ConnectionManager();
        SqlConnection con = new SqlConnection(@"Database=Automation;Data Source=.\SQLEXPRESS;Integrated Security=SSPI");
        con.Open();
        
        SqlCommand cmd = new SqlCommand("select max(autoid) from JobCardDetail", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtJobCardNumber.Text = "JCN00"+(dr.GetInt32(0)+1).ToString();
        }
        txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Session["ok"] = txtJobCardNumber.Text;
        if (rdbYes.Checked == true)
        {
            Running = "yes";
        }
        else
        {
            Running = "no";
        }
        if (I.AddJobCard(txtJobCardNumber.Text, txtDate.Text, txtName.Text, ddlBike.SelectedItem.ToString(), txtAddess.Text, txtContactNo.Text, txtEmailId.Text, txtCity.Text, txtKmStatus.Text, txtRemaingOil.Text, Running,txtproblem.Text, ddl.SelectedItem.ToString()))
        {
            lblMsg.Text = "Your Recored Successfully Saved";
            Response.Redirect("PrintJobCard.aspx");
           
            Reset();
        }
        else
        {
            lblMsg.Text = "Your Recored Not Saved";
        }
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Write("<script type=\"text/javascript\">window.print()</script>");
    }
}