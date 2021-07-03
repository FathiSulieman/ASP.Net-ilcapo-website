<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Web_project.RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPass" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </div>
        <asp:TextBox ID="txtConfirmPass" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtConfirmPass" ErrorMessage="CompareValidator"></asp:CompareValidator>
        <p>
            <asp:Button ID="btnReset" runat="server" OnClick="txtReset_Click" Text="Reset" />
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
        </p>
    </form>
</body>
</html>
