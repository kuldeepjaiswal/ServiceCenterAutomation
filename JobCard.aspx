<%@ Page Title="" Language="C#" MasterPageFile="~/Automation.master" AutoEventWireup="true" CodeFile="JobCard.aspx.cs" Inherits="JobCard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
 <table style="width:100%;" cellpadding="0">
        <tr>
            <td align="center" colspan="3" class="top" >
                Service Job Card</td>
        </tr>
        <tr>
            <td style="border-right: 1px dashed #993333; width: 118px; " 
                rowspan="5">
                &nbsp;</td>
            <td style="width: 454px">
                <table style="width:100%;">
                    <tr>
                        <td style="width: 135px">
                            <asp:Label ID="lblJobCardNumber" runat="server" Text="Job Card Number"></asp:Label>
                        </td>
                        <td style="width: 122px">
                            <asp:TextBox ID="txtJobCardNumber" runat="server" ReadOnly="True" ></asp:TextBox>
                        </td>
                        
                        <td style="padding-left:30px;">
                           <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label> 
                        </td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td rowspan="5" style="border-left: 1px dashed #993333; width: 108px;">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 454px">
                <fieldset >
                    <legend >Information</legend>
                    <asp:Panel ID="Panel1" runat="server" Enabled="true">
                        <table style="width: 100%;">
                            <tr>
                                <td align="left" style="width: 98px"  >
                                    Client Name</td>
                                <td style="width: 125px">
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </td>
                                <td align="center" >
                                    Vehicle Name</td>
                                <td>
                                    <asp:DropDownList ID="ddlBike" runat="server" style="width:125px;"                                     
                                    DataValueField="BikeName" AppendDataBoundItems="True" 
                                        DataSourceID="SqlDataSource2" DataTextField="BikeName"                                
                                   >
                             <asp:ListItem Selected="True">-Select-</asp:ListItem>
                             </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:AutomationConnectionString4 %>" 
                                        SelectCommand="SELECT * FROM [BikeDetail]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 98px"  >
                                    Address</td>
                                <td  >
                                    <asp:TextBox ID="txtAddess" runat="server" Width="95%" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td align="center">
                                    Contact No.</td>
                                <td>
                                   <asp:TextBox ID="txtContactNo" runat="server" Width="100px"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="txtContactNo_FilteredTextBoxExtender" 
                                        runat="server" Enabled="True" TargetControlID="txtContactNo" FilterType="Numbers">
                                    </asp:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 98px">
                                    Email Id</td>
                                <td style="width: 125px">
                                    <asp:TextBox ID="txtEmailId" runat="server"></asp:TextBox>
                                </td>
                                <td align="center">
                                   City</td>
                                <td>
                                   <asp:TextBox ID="txtCity" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                           
                            <tr>
                                <td style="width: 98px; height: 17px">
                                 Vehicle Status</td>
                                <td colspan="2" style="height: 17px">
                                    <asp:TextBox ID="txtKmStatus" runat="server"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtKmStatus_TextBoxWatermarkExtender" 
                                        runat="server" Enabled="True" TargetControlID="txtKmStatus" WatermarkText="Please Enter in K.M.">
                                    </asp:TextBoxWatermarkExtender>
                                </td>
                                <td style="height: 17px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 98px">
                                    Remaining Oil</td>
                                <td style="width: 125px">
                                    <asp:TextBox ID="txtRemaingOil" runat="server"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtRemaingOil_TextBoxWatermarkExtender" 
                                        runat="server" Enabled="True" TargetControlID="txtRemaingOil" WatermarkText="In Litre">
                                    </asp:TextBoxWatermarkExtender>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                            <td style="width:125px;">Is The Watch Running</td>
                            <td ><asp:RadioButton ID="rdbYes" runat="server" Text="Yes" GroupName="a" Checked="true" />
                            <asp:RadioButton ID="rdbNo" runat="server" Text="No" GroupName="a"/>
                            </td>
                             <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                            <td colspan="4">
                             <table>
                            <tr><td valign="middle">Please Fully Discribe Your Problem Here:</td><td><asp:TextBox ID="txtproblem" runat="server" TextMode="MultiLine" Width="225px" Height="100px"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="txtproblem_TextBoxWatermarkExtender" 
                                    runat="server" Enabled="True" TargetControlID="txtproblem" WatermarkText="Enter Your problem one by one ..........................             ...........................">
                                </asp:TextBoxWatermarkExtender>
                                </td></tr>
                            </table></td>
                            </tr>

                            <tr><td>Alloted Mechanic</td><td>
                             <asp:DropDownList ID="ddl" runat="server" style="width:125px;" 
                                    DataSourceID="SqlDataSource1" DataTextField="MechanicName" 
                                    DataValueField="MechanicName" AppendDataBoundItems="True" 
                                  
                                   >
                             <asp:ListItem Selected="True">-Select-</asp:ListItem>
                             </asp:DropDownList>
                               
                               
                               
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:AutomationConnectionString4 %>" 
                                    SelectCommand="SELECT [MechanicId], [MechanicName] FROM [MechanicInformation]">
                                </asp:SqlDataSource>
                               
                               
                               
                                </td><td>
                                &nbsp;</td><td>
                                &nbsp;</td></tr>
                        </table>
                    </asp:Panel>
                </fieldset></td>
        </tr>
          <tr>
            <td style="width: 454px">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 454px">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
               </td>
        </tr>
        <tr>
            <td style="width: 454px">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" class="bottom" >
                <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn" 
                     />
                &nbsp;<asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn" />
                &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn" />
                &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" 
                    onclick="btnSave_Click" />
              &nbsp;<asp:Button ID="btnSearchList" runat="server" Text="Search List" 
                     Width="65px" CssClass="btn" />
                &nbsp;<asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn" onclick="btnPrint_Click" 
                    />
            &nbsp;<asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="btn" />
            </td>
        </tr>
    </table>

</asp:Content>

