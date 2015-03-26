<%@ Page Title="" Language="C#" MasterPageFile="~/Automation.master" AutoEventWireup="true"
    CodeFile="PartTranscation_In.aspx.cs" Inherits="PartTranscation_In" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 100%;" cellpadding="0">
                <tr>
                    <td align="center" colspan="3" class="top">
                        PartTransaction In
                        <br />
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
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="txtDate" runat="server" ReadOnly="true"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="Gridview1" runat="server" ShowFooter="true" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                                <asp:TemplateField HeaderText="Part Name">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlPartName" runat="server" DataSourceID="DSPartName" DataTextField="PartName"
                                            DataValueField="PartName" Width="125px" AutoPostBack="True" OnSelectedIndexChanged="ddlPartName_SelectedIndexChanged"
                                            AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True">-Select-</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="DSPartName" runat="server" ConnectionString="<%$ ConnectionStrings:AutomationConnectionString4 %>"
                                            SelectCommand="SELECT DISTINCT [PartName] FROM [PartMaster]"></asp:SqlDataSource>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Firm Name">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlFirmName" runat="server" DataTextField="FirmName" DataValueField="FirmId"
                                            Width="125px" AppendDataBoundItems="True" 
                                            OnSelectedIndexChanged="ddlFirmName_SelectedIndexChanged" 
                                            AutoPostBack="True">
                                            <asp:ListItem Selected="True">-Select-</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQty" runat="server" AutoPostBack="True" OnTextChanged="txtQty_TextChanged"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Amount">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtTotalAmount" runat="server" OnTextChanged="txtTotalAmount_TextChanged"></asp:TextBox>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <FooterTemplate>
                                        <asp:Button ID="ButtonAdd" OnClick="ButtonAdd_Click" runat="server" Text="Add" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get Total Sum" />
                        <asp:TextBox ID="TotalSum" runat="server"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Save" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
