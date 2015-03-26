using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class FirmDetail : System.Web.UI.Page
{
    InsertInformation I = new InsertInformation();
    protected void Page_Load(object sender, EventArgs e)
    {
        ConnectionManager cm = new ConnectionManager();
        SqlConnection con = new SqlConnection(@"Database=Automation;Data Source=.\SQLEXPRESS;Integrated Security=SSPI");
        con.Open();

        SqlCommand cmd = new SqlCommand("select max(AutoId) from FirmMaster", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            txtFirmId.Text = "FID00" + (dr.GetInt32(0) + 1).ToString();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (I.AddFirmDetails(txtFirmId.Text, txtFirmName.Text, txtFirmAddress.Text, txtContactNo.Text))
        {
            lblMsg.Text = "Your Recored Successfully Saved";
            //Reset();
        }
        else
        {
            lblMsg.Text = "Your Recored Not Saved";
        }
    }
}