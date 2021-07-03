<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="Web_project.AddBrand" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
	<link rel="stylesheet" href="css/style5.css"/>
</head>
<body>
    <form id="form1" runat="server">

			 <header>New Brand</header>
            <label>Add Brand <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtNewBrand"></asp:RequiredFieldValidator></span></label>
             <asp:TextBox ID="txtNewBrand" runat="server" CssClass="input"></asp:TextBox>
            
          
            <asp:Button ID="btnBack" runat="server" CssClass="button" CausesValidation="false" OnClick="btnBack_Click" Text="Back" />
            <asp:Button ID="btnAddBrand" runat="server" CssClass="button" OnClick="btnAddBrand_Click" Text="Add Brand" />
        
    </form>
</body>
    <script>
        function deleteRes(id)
        {
            window.location.href = "Delete.aspx?name=AddBrand&id=" +id;

        }
        
        
    </script>
</html>
