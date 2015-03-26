using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.IO;

/// <summary>
/// Summary description for Login
/// </summary>
public class LoginManager
{
    public LoginManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool CheckLogin(string username, string password)
    {
        try
        {
            ConnectionManager cm = new ConnectionManager();
            SqlConnection con = cm.GetConnection();
            SqlCommand cmd = new SqlCommand("select * from [Login] where [UserId]=@uname and [Password]=@pwd", con);
            cmd.Parameters.AddWithValue("uname", username);
            cmd.Parameters.AddWithValue("pwd", password);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 1)
                return true;
            else
                return false;
        }
        catch (Exception)
        {
            return false;
        }
    }
}