<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="Web_project.userLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login</title>
     <link rel="stylesheet" href="css/style1.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <header> User Login</header>
        <label>Email<span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></span> </label>
        <asp:TextBox ID="txtEmail" runat="server"  CssClass="input"></asp:TextBox>
         <div class="help">At least 6 character</div>
        <label>Password <span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></span></label>
        
        <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" ></asp:TextBox>
        <div class="help">Use upper and lowercase lettes as well</div>
        <asp:Button ID="btnLogin" runat="server" CssClass="button" OnClick="btnLogin_Click" Text="Login"  />

        <asp:Button ID="btnRegister" runat="server" CssClass="button" OnClick="btnRegister_Click" Text="Register" CausesValidation="false" />
        <br />
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="linkbtn" CausesValidation="false" OnClick="LinkButton1_Click">Forgot Password?</asp:LinkButton>
     
    </form>
</body>
</html>
