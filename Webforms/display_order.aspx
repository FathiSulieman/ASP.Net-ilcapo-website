<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="display_order.aspx.cs" Inherits="Web_project.display_order" %>

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
    <form id="form1" runat="server" style="width:auto;background: #9E9E9E; ">
        <div>
            <asp:Repeater runat="server" ID="r1">
                <HeaderTemplate>
                    <table style=" border: solid 6px;
    background: white;
    width: 1000px;
    text-align: center;">
                        <tr style="background:#ff3838; color:white;">
                        <th> Order No.:</th>
                        <th> First Name:</th>
                        <th> Last Name:</th>
                        <th>Email:</th>
                        <th>View Order Details</th>
                        </tr>
                    
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("id") %></td>

                        <td><%# Eval("firstname") %></td>
                        <td><%# Eval("lastname") %></td>
                        <td><%# Eval("email") %></td>
                        <td><a href="view_full_order.aspx?id=<%#Eval("id") %>"> View Order Details</a></td>
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
