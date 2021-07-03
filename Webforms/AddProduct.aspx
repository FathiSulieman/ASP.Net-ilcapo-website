   <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Web_project.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	
</head>
<body>
    <form id="form1" runat="server">
        <link href="Scripts/css/style4.css" rel="stylesheet" />
        
			 <header>Add Product</header>
           <label>Product Name <span>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtProductName"></asp:RequiredFieldValidator></span></label> 
            <asp:TextBox ID="txtProductName" runat="server" CssClass="input"></asp:TextBox>
           
            <label>Price<span><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPrice"></asp:RequiredFieldValidator></span></label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="input" Text=""></asp:TextBox>
            
           
           
            <asp:Button ID="Button1" runat="server" Text="New Brand" CssClass="btncat" CausesValidation="false" OnClick="Button1_Click" />
            
            <label>Category</label>
            
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="sle" DataSourceID="SqlDataSource2" DataTextField="CatName" DataValueField="CatName">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" CssClass="btncat" style="top:39.9%;" Text="New Category" CausesValidation="false" OnClick="Button2_Click" />

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CatName] FROM [tbl_Category]"></asp:SqlDataSource>
         
            <label>Description</label> 
            <asp:TextBox ID="txtDescription" runat="server" CssClass="input" OnTextChanged="TextBox4_TextChanged" TextMode="MultiLine"></asp:TextBox>
           
            
               
            
         

           
               <label>Upload Image</label><asp:FileUpload ID="FileUpload1" CssClass ="input" runat="server" />
                   

        
        
               <label>Free Delivery</label>
              
                   <asp:CheckBox ID="chFD" runat="server" />
           


           
              <label>30 Days Return</label>
              
                   <asp:CheckBox ID="chReturn" runat="server" />
            


            
              <label>Warranty</label>
              
                   <asp:CheckBox ID="cbWaranty" runat="server" />
            


          

                        <asp:Button ID="btnAdd" CssClass ="button" runat="server" Text="ADD Product" OnClick="btnAdd_Click" OnClientClick="btnAdd_Click"  />
                        
             
           

 
    </form>
</body>
<script>    

    /* document.getElementById("DropDownList2").onchange = function () {
            if (this.value == '<Create New Category>') {

                alert("Smd");

            }

        }
        document.getElementById("DropDownList3").onchange = function () {
            if (this.value == '<Create New Sub Category>') {

                alert("Smd");

            }

        }*/


</script>
</html>
