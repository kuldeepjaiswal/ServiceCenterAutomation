<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
    <form id="form1" runat="server">
       <center> <div style="background-image: url('images/503.png');background-repeat:no-repeat;width:1000px;height:700px;border:1px solid #1876A2">

    <table width="100%" style="position:relative;" cellpadding=0 cellspacing=0>
    <tr><td style="background-color:#1876A2;width:100%;height:50px;font-size:26px;font-family:Verdana;font-weight:bold;color:#ffffff;" align="center">
    Service Centre Automation
    </td></tr>
    
    <tr><td align="right" style="padding-top:100px;padding-right:50px;">
    <table border="1">

    <tr><td colspan="2" style="background-color:#1876A2;color:White;width:300px;"align="center">User Login</td></tr>
    <tr><td>User Id</td><td><asp:TextBox ID="txtUserId" runat="server" Width="210px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtUserId" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td></tr>
    <tr><td>Password</td><td><asp:TextBox ID="txtPwd" runat="server" Width="210px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtPwd" ErrorMessage="*"></asp:RequiredFieldValidator>
        </td></tr>
    <tr><td align="center" colspan="2"><asp:Label runat="server" ID="lblMsg"></asp:Label>
        <asp:Button ID="btnLogin" runat="server" Text="Login" Width="80px" 
            Height="25px" onclick="btnLogin_Click" /></td></tr>
       
    </table>
    </td></tr>
       
    </table>
    </div></center>
    </form>
</body>
</html>
