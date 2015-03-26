using System;
using System.Data;
using System.Configuration;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient;


/// <summary>
/// Summary description for connectionmanager
/// </summary>
public class ConnectionManager
{
    public SqlConnection DbConnection = new SqlConnection();
    public SqlCommand command = new SqlCommand();
    public SqlDataAdapter Data_Adapter = new SqlDataAdapter();
    public DataSet Data_Set = new DataSet();
    public SqlDataReader dr;
       
    public ConnectionManager()
    {
        //DbConnection.ConnectionString = ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
        DbConnection.ConnectionString = @"Database=Automation;Data Source=.\SQLEXPRESS;Integrated Security=SSPI";
       command.Connection = DbConnection;
       Data_Adapter.SelectCommand = command;
    }
    public SqlConnection GetConnection()
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=Automation;Integrated Security=True");
        return con;

    }


    //public ConnectionManager(int i)
    //{
    // switch(i)
    // {
    //     case 1:
    //        DbConnection.ConnectionString = @"Provider=sqloledb;initial catalog=softpro;Data Source=.\sqlexpress;Integrated Security=SSPI;";
    //    break;
     
    //     case 2: 
    //         DbConnection.ConnectionString = @"Provider=sqloledb;initial catalog=softpro;Data Source=.\sqlexpress;Integrated Security=SSPI;";
    //    break;
    //     default: 
    //         DbConnection.ConnectionString = @"Provider=sqloledb;initial catalog=softpro;Data Source=.\sqlexpress;Integrated Security=SSPI;";
    //    break;
    //}
    //    command.Connection = DbConnection;
    //    Data_Adapter.SelectCommand = command;
    //}

    /// <summary>
    /// Method to get multiple records from database according to SQL Query.
    /// </summary>
    /// <param name="Query">SQL Query to execute.</param>
    /// <param name="AliasName">Virtual table name.</param>
    /// <returns>System.Data.DataSet</returns>
    /// 
    public DataSet GetDataSet(string Query, string AliasName)
    {
        try
        {
            command.CommandText = Query;
            Data_Adapter.Fill(Data_Set, AliasName);
            return Data_Set;
        }
        catch (Exception ex)
        {
           
            return null;
        }
        finally
        {
            if (DbConnection.State == ConnectionState.Open)
                DbConnection.Close();
        }
    }

    SqlTransaction objTransaction;

    /// <summary>
    /// Method to execute insert/update/detete sql queries
    /// </summary>
    /// <param name="Query">SQL Query to execute.</param>
    /// <returns>True/False</returns>
    public bool NonQuery(string Query)
    {

        try
        {
            if (DbConnection.State == ConnectionState.Closed)
                DbConnection.Open();
            objTransaction = DbConnection.BeginTransaction();
            command.Transaction = objTransaction;
            command.CommandText = Query;
            int Result = command.ExecuteNonQuery();
            if (Result > 0)
            {
                objTransaction.Commit();
                return true;
            }
            else
            {
                objTransaction.Rollback();
                return false;
            }
        }
        catch (Exception ex)
        {
            objTransaction.Rollback();            
            return false;
        }
        finally
        {
            if (DbConnection.State == ConnectionState.Open)
                DbConnection.Close();
        }
    }

    /// <summary>
    /// Execute Scaler Sql Query
    /// </summary>
    /// <param name="Query">String Sql Query to execute</param>
    /// <returns>object return by the qurey</returns>
    public object GetScaler(string Query)
    {
        try
        {
            if (DbConnection.State == ConnectionState.Closed)
                DbConnection.Open();
            objTransaction = DbConnection.BeginTransaction();
            command.Transaction = objTransaction;
            command.CommandText = Query;
            object Result = command.ExecuteScalar();
            if (Result != null)
            {
                objTransaction.Commit();
                return Result;
            }
            else
            {
                objTransaction.Rollback();
                return Result;
            }
        }
        catch (Exception ex)
        {
            objTransaction.Rollback();           
            return false;
        }
        finally
        {
            if (DbConnection.State == ConnectionState.Open)
                DbConnection.Close();
        }
    }
}
