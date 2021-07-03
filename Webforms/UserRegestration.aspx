<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegestration.aspx.cs" Inherits="Web_project.UserRegestration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/style4.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			 <header>User Registration</header>
           <label>First Name<span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator></span></label>
			<asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
           
            <label>Last Name</label>
			 <asp:TextBox ID="txtLastName" runat="server" CssClass="input"></asp:TextBox>

           <label>Email<span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></span></label> 
			<asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
            
         
          <label>Password<span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></span></label>

           <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            
            
           <label>Confirm Password<span><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator></span></label> 
			<asp:TextBox ID="txtConfirmPassword" runat="server"  CssClass="input" TextMode="Password"></asp:TextBox>
            
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords don't match"></asp:CompareValidator>
            <asp:Button ID="btnRegister" runat="server" CssClass="button" OnClick="btnRegister_Click" Text="Register" />
    </form>
</body>
</html>
