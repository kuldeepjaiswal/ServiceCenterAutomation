﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Automation.master" AutoEventWireup="true" CodeFile="PartMaster.aspx.cs" Inherits="PartMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <table style="width:100%;" cellpadding="0">
        <tr>
            <td align="center" colspan="3" class="top" >
                Service Part Information</td>
        </tr>
        <tr>
            <td style="border-right: 1px dashed #993333; width: 118px;" 
                rowspan="5">
                &nbsp;</td>
            <td style="width: 454px">
                <table style="width:100%;">
                    <tr>
                        <td style="padding-left:75px;">
                            <asp:Label ID="lblSerialNo" runat="server" Text="Serianl Number"></asp:Label>
                        </td>
                        <td >
                            <asp:TextBox ID="txtSerialNo" runat="server" ReadOnly="true"></asp:TextBox>
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
                                <td align="left"  style="padding-left:80px;" >
                                 Part Id</td>
                                <td >
                                    <asp:TextBox ID="txtPartId" runat="server" ReadOnly="True"></asp:TextBox>
                                    
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="left" style="padding-left:80px;" >
                                    Part Name</td>
                                <td  >
                                    <asp:TextBox ID="txtPartName" runat="server" ></asp:TextBox>
                                   
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="padding-left:80px;">
                                    Part Type</td>
                                <td >
                                    <asp:DropDownList ID="ddlPartType" runat="server" Width="125px">
                                    <asp:ListItem Value="">--Select--</asp:ListItem>
                                    <asp:ListItem Value="a">a</asp:ListItem>
                                    <asp:ListItem Value="b">b</asp:ListItem>
                                    <asp:ListItem Value="c">c</asp:ListItem>
                                    </asp:DropDownList>
                                    
                                </td>
                                
                            </tr>
                            <tr>
                                <td style="padding-left:80px;">
                                    Part Discription</td>
                                <td >
                                    <asp:TextBox ID="txtPartDiscription" runat="server" TextMode="MultiLine"></asp:TextBox>
                              
                                </td>
                                
                            </tr>
                             <tr>
                                <td style="padding-left:80px;">
                                    Price</td>
                                <td >
                                    <asp:TextBox ID="txtPrice" runat="server" ></asp:TextBox>
                              
                                </td>
                                
                            </tr>     
                               <tr>
                                <td style="padding-left:80px;">
                                    Firm Name</td>
                                <td >
                                    <asp:TextBox ID="txtFirmName" runat="server" ></asp:TextBox>
                              
                                </td>
                                
                            </tr>                   
                            
                        </table>
                    </asp:Panel>
                </fieldset></td>
        </tr>
        
       <tr>
            <td style="width: 454px" align="center">
              <asp:Label ID="lblMsg" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 454px">
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
                &nbsp;<asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" onclick="btnSave_Click" 
                     />
              
                &nbsp;<asp:Button ID="btnSearchList" runat="server" Text="Search List" 
                     Width="65px" CssClass="btn" onclick="btnSearchList_Click" />
                &nbsp;<asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn" 
                    />
            &nbsp;<asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="btn" />
            </td>
        </tr>
    </table>
</asp:Content>

