<%@ Page Title="" Language="C#" MasterPageFile="~/Automation.master" AutoEventWireup="true"
    CodeFile="PartTranscation.aspx.cs" Inherits="PartTranscation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" cellpadding="0">
                <tr>
                    <td align="center" colspan="3" class="top">
                        PartTransaction Out<br />
                        <asp:Label ID="Label1" runat="server" Text="Invoice No : "></asp:Label>
                        <asp:Label ID="Lblinvoice" runat="server" Text="Invoice No."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" valign="top">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblDAte" runat="server" Text="Date" Width="60px"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDate" runat="server" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Internal User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rdbInternalUser"
                                        runat="server" GroupName="a" AutoPostBack="True" OnCheckedChanged="rdbInternalUser_CheckedChanged" />
                                </td>
                                <td style="width: 200px;">
                                </td>
                                <td>
                                    External User&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RadioButton ID="rdbExternalUser"
                                        runat="server" GroupName="a" AutoPostBack="True" OnCheckedChanged="rdbExternalUser_CheckedChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Table ID="table1" runat="server" Visible="false">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                Job Card Number &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtJcn" runat="server"
                                                    OnTextChanged="txtJcnGetClientName" AutoPostBack="True"></asp:TextBox>
                                                Client Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtClientName" runat="server"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                    <asp:Table ID="table2" runat="server" Visible="false">
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                Client Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEclient" runat="server"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox
                                                    ID="txtAddress" runat="server"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="Gridview1" runat="server" ShowFooter="true" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                                <asp:TemplateField HeaderText="Part Name">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlPartName" runat="server" Width="110px" AutoPostBack="True"
                                            DataSourceID="SqlDataSource1" DataTextField="PartName" DataValueField="PartName"
                                            OnSelectedIndexChanged="ddlPartName_SelectedIndexChanged" AppendDataBoundItems="true">
                                            <asp:ListItem Selected="True">-Select-</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AutomationConnectionString4 %>"
                                            SelectCommand="SELECT distinct  [PartName] FROM [PartMaster]"></asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Brand">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlFirmName" runat="server" Width="110px" AutoPostBack="True"
                                            OnSelectedIndexChanged="ddlFirmName_SelectedIndexChanged" AppendDataBoundItems="true">
                                            <asp:ListItem Selected="True">-Select-</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="R_Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRqty" runat="server" ReadOnly="True"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQty" runat="server" AutoPostBack="True" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtPrice" runat="server" ReadOnly="True"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Amount">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtTotalAmount" runat="server" OnTextChanged="txtTotalAmount_TextChanged"
                                            ReadOnly="True"></asp:TextBox>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Button ID="ButtonAdd" OnClick="ButtonAdd_Click" runat="server" Text="Add" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Total Sum" />
                        <asp:TextBox ID="TotalSum" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Save" Width="106px" />
                        <input id="Print" type="button" value="Print" onclick="return Print_onclick()" />
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Set value" />
                        <asp:Label ID="MessageField" runat="server" Text="Label"></asp:Label>
                        <br />
                        <input type="hidden" id="pagecontent" name="pagecontent" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Print_onclick() {
            var tab = document.getElementById('ctl00_ContentPlaceHolder1_UpdatePanel1').innerHTML;
            if (typeof (Storage) !== "undefined") {
                localStorage.lastname = tab;
                window.open("PartTransactionPrint.aspx");
                
            }
            else {
                document.getElementById("result").innerHTML = "Sorry, your browser does not support web storage...";
            }

                
                //document.write(encodeURI(uri)+ "<br />");
                //document.getElementById("result").innerHTML = "You have clicked the button " + sessionStorage.clickcount + " time(s) in this session.";
            }
        
// ]]>
    </script>
</asp:Content>
