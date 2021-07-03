<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Web_project.AddCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
	<link rel="stylesheet" href="css/style4.css"/>
</head>
<body>
    <form id="form1" runat="server" style="height:70%">

        
			 <header>New Category</header>
           <label>Add Category<span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtNewCar"></asp:RequiredFieldValidator></span></label>
            <asp:TextBox ID="txtNewCar" runat="server" CssClass="input"></asp:TextBox>
            
            <asp:Button ID="btnBack" runat="server" CssClass="button" CausesValidation="false" Text="Back" OnClick="btnBack_Click" />
            <asp:Button ID="btnAdd" runat="server" CssClass="button" OnClick="btnAdd_Click" Text="Add " />
     
    </form>
</body>
     <script>
        function deleteRes(id)
        {
            window.location.href = "Delete.aspx?name=AddCategory&id=" +id;
        }
        
        
     </script>
</html>
