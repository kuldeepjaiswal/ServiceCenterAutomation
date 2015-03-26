using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InsertInformation
/// </summary>
public class InsertInformation
{
	public InsertInformation()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool AddMechanicDetails(string mechanicid, string mechanicname, string address, string contactno, string joiningdate)
    {
        ConnectionManager con = new ConnectionManager();
              
        string Query = "INSERT INTO [MechanicInformation]([MechanicId],[MechanicName],[MechanicAddress],[MechanicContactNo],[JoiningDate])     VALUES ('" + mechanicid + "','" + mechanicname + "','" + address + "','" + contactno + "','" + joiningdate+ "')";
        if (con.NonQuery(Query))
        {
            return true;

        }
        else
        {
            return false;
        }
      
    }
    public bool AddPartDetails(string partid, string partname, string parttype, string partdiscription, int price,string firmname)
    {
        ConnectionManager con = new ConnectionManager();

        string Query = "INSERT INTO [PartMaster]([PartId],[PartName],[PartType],[PartDescription],[Price],[FirmName])     VALUES ('" + partid + "','" + partname + "','" + parttype + "','" + partdiscription + "',"+price+",'"+firmname+"')";
        if (con.NonQuery(Query))
        {
            return true;

        }
        else
        {
            return false;
        }

    }
    public bool AddJobCard(string jobcardnumber, string date, string clientname, string vehiclename, string address, string contactno, string emailid, string city, string vehiclestatus, string remainingoil, string status, string problem, string allotedmechanic)
    {
        ConnectionManager con = new ConnectionManager();

        string Query = "INSERT INTO [JobCardDetail]([JobCardNumber],[Date],[ClientName],[VehicleName],[Address],[ContactNo],[EmailId],[City],[VehicleStatus],[RemainingOil],[Status],[Problem],[AllotedMechanic]) VALUES ('" + jobcardnumber + "','" + date + "','" + clientname + "','" + vehiclename + "','" + address + "','" + contactno + "','" + emailid + "','" + city + "','" + vehiclestatus + "','" + remainingoil + "','" +status +"','"+problem+"','"+allotedmechanic+"')";
        if (con.NonQuery(Query))
        {
            return true;

        }
        else
        {
            return false;
        }

    }



    //public bool AddJobCard(string p, string p_2, string p_3, System.Web.UI.WebControls.ListItem listItem, string p_4, string p_5, string p_6, string p_7, string p_8, string p_9, string Running, string p_10, System.Web.UI.WebControls.ListItem listItem_2)
    //{
    //    throw new NotImplementedException();
    //}
    public bool AddFirmDetails(string firmid, string firmname, string firmaddress, string contactno)
    {
        ConnectionManager con = new ConnectionManager();

        string Query = "INSERT INTO [FirmMaster]([FirmId],[FirmName],[FirmAddress],[ContactNo])     VALUES ('" + firmid + "','" + firmname + "','" + firmaddress + "','" + contactno + "')";
        if (con.NonQuery(Query))
        {
            return true;

        }
        else
        {
            return false;
        }

    }
}