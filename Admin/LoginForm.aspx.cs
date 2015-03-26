using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class NewAdmin_LoginForm : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
      

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsername.Text == "admin" && txtPwd.Text == "admin")
        {
            Response.Redirect("Welcome.aspx");
        }
        else
        {
            lblStatusBar.Text = "Invalid user";
        }

    }
}