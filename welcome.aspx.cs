using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userid"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {

                //if (gd.Details(Session["userid"].ToString()))
                //{                   
                //   lblMsg.Text = "Welcome " + username.Text;
                //}
                ConnectionManager cm = new ConnectionManager();
                SqlConnection cn = cm.GetConnection();
                SqlCommand cmd = new SqlCommand("select * from Login where UserId='" + Session["userid"].ToString() + "'", cn);
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblMsg.Text = "Welcome " + dr.GetString(0);
                }
                cn.Close();
            }
        }
    }
}
