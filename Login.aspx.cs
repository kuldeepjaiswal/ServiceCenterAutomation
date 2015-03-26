using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["userid"] = "";
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        LoginManager lm=new LoginManager();
        if (lm.CheckLogin(txtUserId.Text, txtPwd.Text))
        {

            Session["userid"] = txtUserId.Text;
            Response.Redirect("welcome.aspx");
        }
        else
        {
            lblMsg.Text = "Invalid User";
        }

    }
}