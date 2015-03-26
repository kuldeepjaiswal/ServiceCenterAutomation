<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintJobCard.aspx.cs" Inherits="tretmentadvisor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Receipt Page</title>
    <link href="css/PrintStyleSheet.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 79px;
        }
        .style2
        {
            width: 100%;
           
            margin-left: 3px;
        }
        .style3
        {
            width: 30%;
        }
        .style4
        {
            width: 35%;
        }
        .style5
        {
            width: 96px;
        }
        .style8
        {
            width: 100%;
        }
        .style9
        {
            width: 120px;
        }
        .style10
        {
            width: 200px;
        }
        .style11
        {
            width: 80px;
        }
        .style12
        {
            width: 150px;
        }
        .style13
        {
            width: 130px;
        }
        .style14
        {
            width: 144px;
        }
        .style15
        {
            width: 161px;
        }
        .style16
        {
            height: 448px;
        }
        .style17
        {
            height: 408px;
        }
        .style18
        {
            height: 408px;
            width: 176px;
        }
        .style19
        {
            width: 176px;
            font-weight: bold;
        }
        .style20
        {
            width: 178px;
            font-weight: bold;
        }
        .style6
        {
            width: 100%;
            
        }
        .style7
        {
            width: 112px;
            text-align: left;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server"><center>
    <div >
    
        <table width="100%" >
            <tr>
                <td style="font-weight: 700; text-align: center; font-size: 15px;">
                    Service Centre Automation Lucknow</td>
            </tr>
            <tr>
                <td style="font-weight: 700; text-align: center; font-size: 15px;">
                    Service Job Card</td>
            </tr>
            <tr>
                <td>
                    <table class="style1">
                        <tr>
                            <td class="style4" align="left" valign="top">
                                <table class="style6">
                                    <tr>
                                        <td class="style7">
                                            SI. No.</td>
                                        <td style="border-bottom-style: dotted; border-bottom-color: #000000; border-bottom-width: 1px;">
                                            <asp:Label ID="lblSiNo" runat="server"></asp:Label>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                            Job Card Number</td>
                                        <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                            <asp:Label ID="lblJcn" runat="server"></asp:Label>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td class="style7">
                                           Bike Number</td>
                                        <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                            <asp:Label ID="lblBikeNo" runat="server"></asp:Label>
                                           </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="style3" align="center" valign="top">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/hero.png" 
                                    Width="68px" Height="69px" />
                            </td>
                            <td align="left" valign="top" style="width:35%">
                                <table class="style2">
                                    <tr>
                                        <td class="style5" align="left">
                                            Book No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                        <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                            <asp:Label ID="lblBookNo" runat="server"></asp:Label>
                                           </td>
                                    </tr>
                                    <tr>
                                        <td class="style5" align="left">
                                            Date &nbsp;&nbsp;&nbsp; </td>
                                        <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                                          </td>
                                    </tr>
                                    <tr>
                                        <td class="style5" align="left">
                                            Place</td>
                                        <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                            <asp:Label ID="lbllace" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
          <tr>
                <td>
                 
                    <table class="style8">
                        <tr>
                            <td class="style9" align="left">
                               Client Name</td>
                            <td class="style10" 
                                
                                style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblClientName" runat="server"></asp:Label>
                               </td>
                            <td class="style11">
                               Email Id</td>
                            <td class="style12" 
                                
                                style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblEmailId" runat="server"></asp:Label>
                              </td>
                            <td class="style13">
                                Contact Number</td>
                            <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;width:200px;">
                                <asp:Label ID="lblContactNo" runat="server"></asp:Label>
                              </td>
                        </tr>
                        <tr><td colspan="6"><br /></td></tr>
                         <tr>
                            <td class="style9" align="left">
                               Bike Name</td>
                            <td class="style10" 
                                
                                style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblBikeName" runat="server"></asp:Label>
                               </td>
                            <td class="style11">
                               Sataus</td>
                            <td class="style12" 
                                
                                style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                Km</td>
                            <td class="style13">
                                Remaining oil</td>
                            <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblRemainigOil" runat="server"></asp:Label>
                                Lt.</td>
                        </tr>
                    </table>
                 
                </td>
            </tr>
            <tr>
                <td>
                    <table class="style8">
                        <tr>
                            <td class="style14" align="left">
                                Address</td>
                            <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblAddress" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table class="style8">
                        <tr>
                            <td class="style15" align="left">
                                Running Condition</td>
                            <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblRunningCondition" runat="server"></asp:Label>
                               </td>
                                <td class="style15" align="left">
                                Alloted Mechanic</td>
                            <td style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #000000;">
                                <asp:Label ID="lblMechanic" runat="server"></asp:Label>
                               </td>
                        </tr>
                        <tr>
                            <td class="style15">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td><td></td><td></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr><td style="border-color: #000000; border-width: thin; border-top-style: solid">
                <table style="width:100%;">
                    <tr>
                        <td align="center" class="style20">
                            </td>
                                <td>
                                    <b>Problems</b></td>
                            </tr>
                        </table>
                    </td></tr>
        </table>
    
 <table class="style8">
            <tr>
                <td class="style16">
                    <table class="style8">
                        <tr>
                            <td class="style18" style="border-width: thin;">
                               
                            </td>
                            <td class="style17" 
                                style="border-left-style: solid; border-color: #000000; border-width: thin">
                              
                                <asp:Label ID="lblProblem" runat="server"></asp:Label>
                              
                            </td>
                        </tr>
                        <tr>
                            <td class="style19">
                                Mechanic Signature</td>
                                <td align="center" class="style19">Authorised Signature</td>
                                <td style="text-align: right">
                                    <b>Client Signature</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="border-top: thin solid #000000; text-align: right; border-left-color: #000000; border-left-width: thin; border-right-color: #000000; border-right-width: thin; border-bottom-color: #000000; border-bottom-width: thin;">
                        Developed &amp; Maintinance Softpro India Pvt.Ltd.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
            </table>

    </div></center>
    </form>
</body>
</html>
