<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Web_project.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot password</title>
   
	<link rel="stylesheet" href="css/style4.css"/>
</head>
<body>
    <form id="form1" runat="server">

			 <header>Forgot password</header>
        
        <label>Enter your Email<span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></span></label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
      
       
       
        <asp:Button ID="Button2" runat="server" CssClass="button" Text="Back" CausesValidation="false" OnClick="Button2_Click" />
         <asp:Button ID="Button1" runat="server" CssClass="button"   OnClick="Button1_Click" Text="Send" />
        <asp:Label ID="Label1" runat="server" CssClass="label" Text=""></asp:Label>
           
    </form>
</body>
</html>
