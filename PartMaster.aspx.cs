using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class PartMaster : System.Web.UI.Page
{
    InsertInformation I = new InsertInformation();
    public void Reset()
    {
      
        txtPartName.Text = "";
        ddlPartType.SelectedIndex = 0;
        txtPartDiscription.Text = "";
        txtFirmName.Text = "";
        txtPrice.Text = "";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ConnectionManager cm = new ConnectionManager();
        SqlConnection con = new SqlConnection(@"Database=Automation;Data Source=.\SQLEXPRESS;Integrated Security=SSPI");
        con.Open();

        SqlCommand cmd = new SqlCommand("select max(AutoId) from PartMaster", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtPartId.Text = "PID00" + (dr.GetInt32(0) + 1).ToString();
            txtSerialNo.Text = dr.GetValue(0).ToString();
        }
       
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (I.AddPartDetails(txtPartId.Text, txtPartName.Text, ddlPartType.SelectedItem.ToString(), txtPartDiscription.Text,int.Parse(txtPrice.Text),txtFirmName.Text))
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
        Response.Redirect("Part_List.aspx");
    }
}