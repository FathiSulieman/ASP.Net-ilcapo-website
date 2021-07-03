<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPass.aspx.cs" Inherits="Web_project.RecoverPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
<link rel="stylesheet" href="css/style4.css"/>
</head>
<body>
    <form id="form1" runat="server">
       
			 <header>Reset Password</header>

           
           
            <label>New Password <span> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPass" ErrorMessage="*"></asp:RequiredFieldValidator></span></label>
            <asp:TextBox ID="txtPass" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
         
            
     
        <label>Confirm New Password<span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="*"></asp:RequiredFieldValidator></span></label>
        <asp:TextBox ID="txtConfirmPass" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfirmPass" ErrorMessage="CompareValidator"></asp:CompareValidator>
       
            <asp:Button ID="btnReset" runat="server" CssClass="button" OnClick="txtReset_Click" Text="Reset" />
            <asp:Label ID="lblMsg" runat="server" CssClass="label"></asp:Label>
        
    </form>
</body>
    
</html>
