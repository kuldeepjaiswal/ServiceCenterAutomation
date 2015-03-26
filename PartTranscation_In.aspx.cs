using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Collections;

public partial class PartTranscation_In : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=Automation;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("select max(autoid) from [InventoryIn]", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Lblinvoice.Text = "II00" + dr.GetInt32(0).ToString();

            }
            con.Close();

        }
        if (!IsPostBack)
        {

            SetInitialRow();
        }
        txtDate.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");
    }
    private void SetInitialRow()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;
        dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
        dt.Columns.Add(new DataColumn("Column1", typeof(string)));
        dt.Columns.Add(new DataColumn("Column2", typeof(string)));
        dt.Columns.Add(new DataColumn("Column3", typeof(string)));
        dt.Columns.Add(new DataColumn("Column4", typeof(string)));
        dt.Columns.Add(new DataColumn("Column5", typeof(string)));
        dr = dt.NewRow();
        dr["RowNumber"] = 1;
        dr["Column1"] = string.Empty;
        dr["Column2"] = string.Empty;
        dr["Column3"] = string.Empty;
        dr["Column4"] = string.Empty;
        dr["Column5"] = string.Empty;
        dt.Rows.Add(dr);
        //dr = dt.NewRow();

        //Store the DataTable in ViewState
        ViewState["CurrentTable"] = dt;

        Gridview1.DataSource = dt;
        Gridview1.DataBind();
    }

    protected void ButtonAdd_Click(object sender, EventArgs e)
    {
        AddDDLbrandToSession();
        AddNewRowToGrid();
        SetbrandtoDDL();
    }
    public void SetbrandtoDDL()
    {
        string[] firm = (string[])Session["brand"];
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count-1; i++)
                {
                    //extract the TextBox values
                    DropDownList box2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[2].FindControl("ddlFirmName");
                    box2.Items.Clear();
                    box2.Items.Add(firm[i - 1]);
                    rowIndex++;
                }

            }
        }


    }
    public void AddDDLbrandToSession()
    {
        string[] firm = new string[20];

        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the TextBox values
                    DropDownList box2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[2].FindControl("ddlFirmName");
                    firm[i - 1] = box2.SelectedValue.ToString();
                    rowIndex++;
                }
                Session["brand"] = firm;
            }
        }



    }
    private void AddNewRowToGrid()
    {
        int rowIndex = 0;

        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    //extract the TextBox values
                    DropDownList box1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddlPartName");
                    DropDownList box2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[2].FindControl("ddlFirmName");
                    TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("txtQty");
                    TextBox box4 = (TextBox)Gridview1.Rows[rowIndex].Cells[4].FindControl("txtPrice");
                    TextBox box5 = (TextBox)Gridview1.Rows[rowIndex].Cells[5].FindControl("txtTotalAmount");

                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = i + 1;
                    drCurrentRow["Column1"] = box1.Text;
                    drCurrentRow["Column2"] = box2.Text;
                    drCurrentRow["Column3"] = box3.Text;
                    drCurrentRow["Column4"] = box4.Text;
                    drCurrentRow["Column5"] = box5.Text;

                    rowIndex++;
                }
                //add new row to DataTable
                dtCurrentTable.Rows.Add(drCurrentRow);
                //Store the current data to ViewState
                ViewState["CurrentTable"] = dtCurrentTable;

                //Rebind the Grid with the current data
                Gridview1.DataSource = dtCurrentTable;
                Gridview1.DataBind();
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }

        //Set Previous Data on Postbacks
        SetPreviousData();
    }
    private void SetPreviousData()
    {
        int rowIndex = 0;
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentTable"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 1; i < dt.Rows.Count; i++)
                {
                    DropDownList box1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddlPartName");
                    DropDownList box2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[2].FindControl("ddlFirmName");
                    TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("txtQty");
                    TextBox box4 = (TextBox)Gridview1.Rows[rowIndex].Cells[4].FindControl("txtPrice");
                    TextBox box5 = (TextBox)Gridview1.Rows[rowIndex].Cells[5].FindControl("txtTotalAmount");

                    box1.Text = dt.Rows[i]["Column1"].ToString();
                    box2.Text = dt.Rows[i]["Column2"].ToString();
                    box3.Text = dt.Rows[i]["Column3"].ToString();
                    box4.Text = dt.Rows[i]["Column4"].ToString();
                    box5.Text = dt.Rows[i]["Column5"].ToString();

                    rowIndex++;

                }
            }
        }
    }
    protected void txtTotalAmount_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddlPartName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.Parent.Parent;
        int idx = row.RowIndex;

        int rowIndex = idx;

        DropDownList box2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[2].FindControl("ddlFirmName");

        DropDownList box1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddlPartName");

        //Label1.Text = box1.SelectedValue;
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=Automation;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select distinct [FirmName] from [PartMaster] where [PartName]='" + box1.SelectedValue.ToString() + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        box2.Items.Clear();
        box2.Items.Add("-Select-");
        while (dr.Read())
        {
            box2.Items.Add(dr.GetString(0));

        }
        con.Close();

    }
    protected void ddlFirmName_SelectedIndexChanged(object sender, EventArgs e)
    {

        DropDownList ddl = (DropDownList)sender;
        GridViewRow row = (GridViewRow)ddl.Parent.Parent;
        int idx = row.RowIndex;
        int rowIndex = idx;
        TextBox box4 = (TextBox)Gridview1.Rows[rowIndex].Cells[4].FindControl("txtPrice");
        DropDownList box1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("ddlPartName");
        DropDownList box2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[2].FindControl("ddlFirmName");
        SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=Automation;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select [price] from [partmaster] where [partname]='" + box1.SelectedValue.ToString() + "' and [firmname]='" + box2.SelectedValue.ToString() + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            box4.Text = dr.GetInt32(0).ToString();
        }
        con.Close();
    }
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {

        TextBox ddl = (TextBox)sender;
        GridViewRow row = (GridViewRow)ddl.Parent.Parent;
        int idx = row.RowIndex;
        int rowIndex = idx;
        TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("txtQty");
        TextBox box4 = (TextBox)Gridview1.Rows[rowIndex].Cells[4].FindControl("txtPrice");
        TextBox box5 = (TextBox)Gridview1.Rows[rowIndex].Cells[5].FindControl("txtTotalAmount");
        box5.Text = (int.Parse(box3.Text) * int.Parse(box4.Text)).ToString();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        int rowIndex = 0;
        TotalSum.Text = "0";
        if (ViewState["CurrentTable"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 0; i < dtCurrentTable.Rows.Count; i++)
                {
                    //extract the TextBox values
                    TextBox box5 = (TextBox)Gridview1.Rows[i].Cells[5].FindControl("txtTotalAmount");
                    TotalSum.Text = (int.Parse(TotalSum.Text) + int.Parse(box5.Text)).ToString();
                }
            }
        }
        else
        {
            Response.Write("ViewState is null");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        //ArrayList dataToAdd = new ArrayList();
        ArrayList PartToAdd = new ArrayList();
        ArrayList FirmToAdd = new ArrayList();
        ArrayList QtyToAdd = new ArrayList();
        ArrayList PriceToAdd = new ArrayList();




        foreach (GridViewRow row in Gridview1.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                // CheckBox chkDelete = (CheckBox)row.Cells[0].FindControl("chkDelete");


                DropDownList Part = (DropDownList)row.Cells[1].FindControl("ddlPartName");
                DropDownList Firm = (DropDownList)row.Cells[2].FindControl("ddlFirmName");
                TextBox Qty = (TextBox)row.Cells[3].FindControl("txtQty");
                TextBox Price = (TextBox)row.Cells[4].FindControl("txtPrice");


                if (Part != null && Firm != null && Qty != null && Price != null)
                {


                    PartToAdd.Add(Part.Text);
                    FirmToAdd.Add(Firm.Text);
                    QtyToAdd.Add(Qty.Text);
                    PriceToAdd.Add(Price.Text);

                }
            }
        }

        AddDetails(PartToAdd, FirmToAdd, QtyToAdd, PriceToAdd);
    }


    void AddDetails(ArrayList PartToAdd, ArrayList FirmToAdd, ArrayList QtyToAdd, ArrayList PriceToAdd)
    {
        string query = "";
        string constr = @"Data Source=.\sqlexpress;Initial Catalog=Automation;Integrated Security=True";


        //String[] Parts = (String[]) PartToAdd.ToArray( typeof( string ) );
        //String[] Firms = (String[]) FirmToAdd.ToArray( typeof( string ) );
        //String[] Qty = (String[]) QtyToAdd.ToArray( typeof( string ) );
        //String[] Price = (String[]) PriceToAdd.ToArray( typeof( string ) );


        for (int i = 0; i < PartToAdd.Count; i++)
        {

            //  string query = @"INSERT INTO [INVENTORY] VALUES ('" + Parts[i] + "','" + Firms[i]+ "','" + Qty[i] + "','" + Price[i]+ "')";
            query = @"INSERT INTO [InventoryIn] (InvoiceNo,PartName,FirmName,Quantity) VALUES ('" + Lblinvoice.Text + "','" + PartToAdd[i].ToString() + "','" + FirmToAdd[i].ToString() + "','" + QtyToAdd[i].ToString() + "')";
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(query, con);

            // cmd.Parameters.AddWithValue("1", empid);
            if (con.State == ConnectionState.Closed)
                con.Open();

            cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            int totalqty = 0;
            con.Open();
            cmd = new SqlCommand("select Quantity from [PartMaster] where PartName='" + PartToAdd[i].ToString() + "' and FirmName='" + FirmToAdd[i].ToString() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                totalqty = int.Parse(QtyToAdd[i].ToString()) + dr.GetInt32(0);
                SqlCommand cmd2 = new SqlCommand("update [PartMaster] set [Quantity] = " + totalqty + "where PartName='" + PartToAdd[i].ToString() + "' and FirmName='" + FirmToAdd[i].ToString() + "'", con);

                // cmd.Parameters.AddWithValue("1", empid);
                if (con.State == ConnectionState.Closed)
                    con.Open();
                dr.Dispose();
                cmd2.ExecuteNonQuery();
                con.Close();
                cmd2.Dispose();
            }
        }
        query = "insert into InvoiceIn (InvoiceNo,TotalSum,InvoiceDate) values ('" + Lblinvoice.Text + "'," + int.Parse(TotalSum.Text) + ",'" + DateTime.Now.ToString() + "')";

        SqlConnection con1 = new SqlConnection(constr);
        SqlCommand cmd1 = new SqlCommand(query, con1);
        con1.Open();
        int n = cmd1.ExecuteNonQuery();
        con1.Close();
        cmd1.Dispose();
        if (n == 1)
        {
            Gridview1.DataBind();
            Response.Write("Added Sucessfully");
        }
    }


}