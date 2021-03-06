﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part_List.aspx.cs" Inherits="Part_List" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Part List</title>

    <link href="css/ReportStyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="common/Calender.js" type="text/javascript"></script>
    <script src="common/CommonCode.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            font-family: tahoma;
            font-size: 13px;
            color: #324d62;
            font-weight: bold;
            border-bottom: Double 6px #99B6BA;
            height: 33px;
            width: 282px;
        }
        .style3
        {
            font-family: tahoma;
            font-size: 13px;
            color: #324d62;
            font-weight: bold;
            border-bottom: Double 6px #99B6BA;
            height: 33px;
            width: 178px;
        }
        .style4
        {
            font-family: tahoma;
            font-size: 10px;
            color: #324d62;
            border-right: dashed 1px #993333;
            text-align: left;
            width: 178px;
        }
        .style5
        {
            width: 204px;
        }
        .style6
        {
            font-family: tahoma;
            font-size: 13px;
            color: #324d62;
            font-weight: bold;
            border-bottom: Double 6px #99B6BA;
            height: 33px;
            width: 204px;
        }
        .style7
        {
            
            }
        .style8
        {
            font-family: tahoma;
            font-size: 13px;
            color: #324d62;
            font-weight: bold;
            border-bottom: Double 6px #99B6BA;
            height: 33px;
            width: 50px;
        }
        .style9
        {
            font-family: tahoma;
            font-size: 10px;
            color: #324d62;
            border-right: dashed 1px #993333;
            text-align: left;
            width: 50px;
        }
        .style11
        {
            font-family: tahoma;
            font-size: 10px;
            color: #324d62;
            border-right: dashed 1px #993333;
            text-align: left;
            width: 282px;
        }
    </style>
    
   
</head>
<body >

   <form id="form1" runat="server" >
    <div>
    
        <table style="width:100%; ">
            <tr>
                <td align="center" class="top">
                    List of Part</td>
            </tr>
            <tr>
                <td align="center">
                    <table style="border: 1px dashed #993333; width:76%;" cellpadding="0" 
                        cellspacing="0">
                        <tr>
                            <td  align="center" class="style7" colspan="6" 
                                >
                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="back" 
                                    Font-Names="Tahoma"  
                                    style="font-weight: 700" 
                                    PostBackUrl="~/PartMaster.aspx">&lt;&lt;Back</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td  align="center" class="style7" colspan="6"> 
                                
                            
                            </td>
                        </tr>
                        
                             <tr><td align="center">
                                 <asp:GridView ID="GridView1" runat="server" AllowPaging="True" style="text-align:center"
                                     AutoGenerateColumns="False" DataKeyNames="PartId" DataSourceID="SqlDataSource1" 
                                     EnableModelValidation="True" Width="90%">
                                     <Columns>
                                         <asp:CommandField ShowSelectButton="True" HeaderText="Select"/>
                                         <asp:CommandField ShowDeleteButton="True" HeaderText="Delete"/>
                                         <asp:BoundField DataField="PartId" HeaderText="PartId" ReadOnly="True" 
                                             SortExpression="PartId" />
                                         <asp:BoundField DataField="PartName" HeaderText="PartName" 
                                             SortExpression="PartName" />
                                         <asp:BoundField DataField="PartType" HeaderText="PartType" 
                                             SortExpression="PartType" />
                                         <asp:BoundField DataField="PartDiscription" HeaderText="PartDiscription" 
                                             SortExpression="PartDiscription" />
                                     </Columns>
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                     ConnectionString="<%$ ConnectionStrings:AutomationConnectionString %>" 
                                     SelectCommand="SELECT * FROM [PartMaster]"></asp:SqlDataSource>
                             </td></tr>
                             </table>
                             </td>
                             </tr>
                             </table>
                                                
                        
              
    
    </div>
    </form>
</body>
</html>

