<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="inventoryOut.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">


    Enter Date<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="..." />
    <asp:Calendar ID="Calendar1" runat="server" 
        onselectionchanged="Calendar1_SelectionChanged" Visible="False">
    </asp:Calendar>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="InvoiceNo" HeaderText="InvoiceNo" 
                SortExpression="InvoiceNo" />
            <asp:BoundField DataField="TotalSum" HeaderText="TotalSum" 
                SortExpression="TotalSum" />
            <asp:BoundField DataField="UserType" HeaderText="UserType" 
                SortExpression="UserType" />
            <asp:BoundField DataField="JobCardNumber" HeaderText="JobCardNumber" 
                SortExpression="JobCardNumber" />
            <asp:BoundField DataField="ClientName" HeaderText="ClientName" 
                SortExpression="ClientName" />
            <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AutomationConnectionString4 %>" 
        SelectCommand="SELECT [InvoiceNo], [TotalSum], [UserType], [JobCardNumber], [ClientName], [Address] FROM [InvoiceOut] WHERE ([InvoiceDate] = @InvoiceDate)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="InvoiceDate" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

