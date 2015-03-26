<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="InventoryIn.aspx.cs" Inherits="Admin_Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="autoid" DataSourceID="SqlDataSource1" 
        EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="autoid" HeaderText="autoid" ReadOnly="True" 
                SortExpression="autoid" />
            <asp:BoundField DataField="InvoiceNo" HeaderText="InvoiceNo" 
                SortExpression="InvoiceNo" />
            <asp:BoundField DataField="PartName" HeaderText="PartName" 
                SortExpression="PartName" />
            <asp:BoundField DataField="FirmName" HeaderText="FirmName" 
                SortExpression="FirmName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                SortExpression="Quantity" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AutomationConnectionString %>" 
        DeleteCommand="DELETE FROM [InventoryIn] WHERE [autoid] = @autoid" 
        InsertCommand="INSERT INTO [InventoryIn] ([InvoiceNo], [PartName], [FirmName], [Quantity]) VALUES (@InvoiceNo, @PartName, @FirmName, @Quantity)" 
        ProviderName="<%$ ConnectionStrings:AutomationConnectionString.ProviderName %>" 
        SelectCommand="SELECT [autoid], [InvoiceNo], [PartName], [FirmName], [Quantity] FROM [InventoryIn]" 
        UpdateCommand="UPDATE [InventoryIn] SET [InvoiceNo] = @InvoiceNo, [PartName] = @PartName, [FirmName] = @FirmName, [Quantity] = @Quantity WHERE [autoid] = @autoid">
        <DeleteParameters>
            <asp:Parameter Name="autoid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InvoiceNo" Type="String" />
            <asp:Parameter Name="PartName" Type="String" />
            <asp:Parameter Name="FirmName" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="InvoiceNo" Type="String" />
            <asp:Parameter Name="PartName" Type="String" />
            <asp:Parameter Name="FirmName" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="autoid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

