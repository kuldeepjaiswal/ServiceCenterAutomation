using System;
using System.Collections;
using System.Configuration;
using System.Data;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
//using System.Xml.Linq;

public partial class tretmentadvisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ConnectionManager cn = new ConnectionManager();
        SqlConnection con = new SqlConnection(@"Database=Automation;Data Source=.\SQLEXPRESS;Integrated Security=SSPI");
        con.Open();

        SqlCommand cmd = new SqlCommand("select * from JobCardDetail where JobCardNumber='" + Session["ok"].ToString() + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            //lblSiNo.Text = dr.GetString(0);
            lblJcn.Text = dr.GetString(1);
            lblBikeName.Text=dr.GetString(4);
            lblDate.Text = dr.GetString(2);
            lblClientName.Text = dr.GetString(3);
            lblEmailId.Text = dr.GetString(7);
            lblContactNo.Text = dr.GetString(6);
            lblAddress.Text = dr.GetString(5);
            lblStatus.Text = dr.GetString(9);
            lblRemainigOil.Text = dr.GetString(10);
            lblRunningCondition.Text = dr.GetString(11);
            lblProblem.Text = dr.GetString(12);
            lblMechanic.Text = dr.GetString(13);
            lbllace.Text = dr.GetString(8);

        }
        Response.Write("<script>window.print(\"PrintJobCard.aspx\");</script>");
    }
}
