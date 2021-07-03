<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_login.aspx.cs" Inherits="Web_project.Admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8"/>
    <title>Admin Login</title>
    
   <link rel="stylesheet" href="css/style1.css"/>
  
</head>
<body>
    <form id="form1" runat="server">
        
        <header> Admin Login</header>
     
       
            <label>Email <span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Required"></asp:RequiredFieldValidator></span></label>

            <asp:TextBox ID="txtEmail" runat="server"  CssClass="input"  ></asp:TextBox>

            
           <div class="help">At least 6 character</div>
        <label>Password <span> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password Required"></asp:RequiredFieldValidator></span></label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  class="input"></asp:TextBox>
       
        <div class="help">Use upper and lowercase lettes as well</div>
        <asp:Button ID="btnLogin" runat="server" CssClass="button" OnClick="btnLogin_Click" Text="Login"  />

        <asp:Button ID="btnRegister" runat="server" CssClass="button" OnClick="btnRegister_Click" Text="Register" CausesValidation="false" />
        <br />
        <asp:Label ID="lblError" runat="server" CssClass="label"></asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbtn" CausesValidation="false" OnClick="LinkButton1_Click">Forgot Password?</asp:LinkButton>
     
    </form>
</body>
</html>
