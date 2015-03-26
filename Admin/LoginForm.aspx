<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginForm.aspx.cs" Inherits="NewAdmin_LoginForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />

</head>
<body id="login-bg"> 
 
 <form id="f1" runat="server">
<div id="login-holder">


	<div id="logo-login">
		
	</div>
	
	
	<div class="clear"></div>
	
	
	<div id="loginbox">
	
	
	<div id="login-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Username</th>
			<td><asp:TextBox ID="txtUsername" runat="server" Width="175px" MaxLength="20"  class="login-inp"></asp:TextBox>
    </td><td width="50px"></td>
		</tr>
		<tr>
			<th>Password</th>
			<td> <asp:TextBox ID="txtPwd" runat="server" Width="175px" TextMode="Password" MaxLength="20"  onfocus="this.value=''" class="login-inp" ></asp:TextBox></td>
		</tr>
		<tr>
			<th></th>
			<td valign="top"></td>
		</tr>
		<tr>
			<th></th>
			<td>  <asp:Button ID="btnLogin"  class="submit-login"  runat="server" Width="81" 
                    Height="30" onclick="btnLogin_Click" /></td>
		</tr>
        <tr><td><asp:Label ID="lblStatusBar" runat="server" Text=""></asp:Label></td></tr>
		</table>
	</div>
 
	<div class="clear"></div>
	<a href="" class="forgot-pwd">Forgot Password?</a>
 </div>
 
 
	
	<div id="forgotbox">
		<div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
		
		<div id="forgot-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Email address:</th>
			<td><input type="text" value=""   class="login-inp" /></td>
		</tr>
		<tr>
			<th> </th>
			<td><input type="button" class="submit-login"  /></td>
		</tr>
		</table>
		</div>
	
		<div class="clear"></div>
		
	</div>


</div>
</form>
</body>
</html>