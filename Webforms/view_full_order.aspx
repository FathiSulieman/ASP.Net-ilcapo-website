<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_full_order.aspx.cs" Inherits="Web_project.view_full_order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/style4.css"/>
    <style>
        th{
                border: solid 1px;
            border-color: black;
        }
        td{
                border-right: solid 1px;
    border-bottom: solid 1px;
    border-color: black;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater runat="server" ID="r1">
                <HeaderTemplate>
                    <table style="border: solid 6px;
    background: white;
    width:1000px;
    text-align: center;">
                        <tr style="background:#ff3838; color:white;">
                        <th> Order No.:</th>
                        <th> Product Name:</th>
                        <th> Product Price:</th>
                        <th>Product Image:</th>
                        </tr>
                    
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("order_id") %></td>

                        <td><%# Eval("product_name") %></td>
                        <td><%# Eval("product_price") %></td>
                        <td><img src="<%#Eval("product_image") %>" height="144px" width="100px"/></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>

            </asp:Repeater>
        </div>
    </form>
</body>
</html>
