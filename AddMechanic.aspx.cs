using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AddMechanic : System.Web.UI.Page
{
    InsertInformation I = new InsertInformation();
    public void Reset()
    {
       
        txtMechanicName.Text = "";
        txtAddress.Text = "";
        txtContactNo.Text = "";
        txtDate.Text = "";

    }
    protected void Page_Load(object sender, EventArgs e)
    {

        ConnectionManager cm = new ConnectionManager();
        SqlConnection con = new SqlConnection(@"Database=Automation;Data Source=.\SQLEXPRESS;Integrated Security=SSPI");
        con.Open();

        SqlCommand cmd = new SqlCommand("select max(autoid) from MechanicInformation", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtMechanicId.Text = "MEC00" + (dr.GetInt32(0) + 1).ToString();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (I.AddMechanicDetails(txtMechanicId.Text, txtMechanicName.Text, txtAddress.Text, txtContactNo.Text, txtDate.Text))
        {
            lblMsg.Text = "Your Recored Successfully Saved";
            Reset();
        }
        else
        {
            lblMsg.Text = "Your Recored Not Saved";
        }
    }
    protected void btnSearchList_Click(object sender, EventArgs e)
    {
        Response.Redirect("Mechanic_List.aspx");
    }
}