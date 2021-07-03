<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Web_project.AdminPage" %>

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
        table{
            text-align:center;
            width: 1029px;
        }
        label{
                background: #ff3838;
    color: white;
    margin-left:0 !important; 
    
    text-align: center;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server" style="width:auto;background: white; margin-top: 1205px;">
         <header>Manage Database</header>
        <div>

            <label style="padding: 0px 460px 0px 480px;">Admins Table</label> 
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="admin_email" HeaderText="admin_email" SortExpression="admin_email" />
                    <asp:BoundField DataField="admin_password" HeaderText="admin_password" SortExpression="admin_password" />
                    <asp:BoundField DataField="admin_fName" HeaderText="admin_fName" SortExpression="admin_fName" />
                    <asp:BoundField DataField="admin_lName " HeaderText="admin_lName " SortExpression="admin_lName " />
                    <asp:BoundField DataField="admin_Phone" HeaderText="admin_Phone" SortExpression="admin_Phone" />
                    <asp:BoundField DataField="admin_PhoneCode" HeaderText="admin_PhoneCode" SortExpression="admin_PhoneCode" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [tbl_Admins] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tbl_Admins] ([admin_email], [admin_password], [admin_fName], [admin_lName ], [admin_Phone], [admin_PhoneCode]) VALUES (@admin_email, @admin_password, @admin_fName, @admin_lName_, @admin_Phone, @admin_PhoneCode)" SelectCommand="SELECT * FROM [tbl_Admins]" UpdateCommand="UPDATE [tbl_Admins] SET [admin_email] = @admin_email, [admin_password] = @admin_password, [admin_fName] = @admin_fName, [admin_lName ] = @admin_lName_, [admin_Phone] = @admin_Phone, [admin_PhoneCode] = @admin_PhoneCode WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="admin_email" Type="String" />
                    <asp:Parameter Name="admin_password" Type="String" />
                    <asp:Parameter Name="admin_fName" Type="String" />
                    <asp:Parameter Name="admin_lName_" Type="String" />
                    <asp:Parameter Name="admin_Phone" Type="Int32" />
                    <asp:Parameter Name="admin_PhoneCode" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="admin_email" Type="String" />
                    <asp:Parameter Name="admin_password" Type="String" />
                    <asp:Parameter Name="admin_fName" Type="String" />
                    <asp:Parameter Name="admin_lName_" Type="String" />
                    <asp:Parameter Name="admin_Phone" Type="Int32" />
                    <asp:Parameter Name="admin_PhoneCode" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <label style="padding: 0px 460px 0px 494px;">Users Table</label>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="user_email" HeaderText="user_email" SortExpression="user_email" />
                    <asp:BoundField DataField="user_Fname" HeaderText="user_Fname" SortExpression="user_Fname" />
                    <asp:BoundField DataField="user_Lname" HeaderText="user_Lname" SortExpression="user_Lname" />
                    <asp:BoundField DataField="user_password" HeaderText="user_password" SortExpression="user_password" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tbl_Users]" DeleteCommand="DELETE FROM [tbl_Users] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tbl_Users] ([user_email], [user_Fname], [user_Lname], [user_password]) VALUES (@user_email, @user_Fname, @user_Lname, @user_password)" UpdateCommand="UPDATE [tbl_Users] SET [user_email] = @user_email, [user_Fname] = @user_Fname, [user_Lname] = @user_Lname, [user_password] = @user_password WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="user_email" Type="String" />
                    <asp:Parameter Name="user_Fname" Type="String" />
                    <asp:Parameter Name="user_Lname" Type="String" />
                    <asp:Parameter Name="user_password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="user_email" Type="String" />
                    <asp:Parameter Name="user_Fname" Type="String" />
                    <asp:Parameter Name="user_Lname" Type="String" />
                    <asp:Parameter Name="user_password" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <label style="padding: 0px 460px 0px 475px;">Products Table</label>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="PID">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="PID" HeaderText="PID" InsertVisible="False" ReadOnly="True" SortExpression="PID" />
                    <asp:BoundField DataField="PrName " HeaderText="PrName " SortExpression="PrName " />
                    <asp:BoundField DataField="PrPrice" HeaderText="PrPrice" SortExpression="PrPrice" />
                    <asp:BoundField DataField="PrCatID" HeaderText="PrCatID" SortExpression="PrCatID" />
                    <asp:BoundField DataField="PrDescription" HeaderText="PrDescription" SortExpression="PrDescription" />
                    <asp:BoundField DataField="PrFreeDelivery" HeaderText="PrFreeDelivery" SortExpression="PrFreeDelivery" />
                    <asp:BoundField DataField="Pr30Day" HeaderText="Pr30Day" SortExpression="Pr30Day" />
                    <asp:BoundField DataField="PrWar" HeaderText="PrWar" SortExpression="PrWar" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="image1" runat="server" Height="144px" Width="100px" ImageUrl='<%# Eval("PrImage")%>'/>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            &nbsp;&nbsp;
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tbl_Products]" DeleteCommand="DELETE FROM [tbl_Products] WHERE [PID] = @PID" InsertCommand="INSERT INTO [tbl_Products] ([PrName ], [PrPrice], [PrBrandID], [PrCatID], [PrSubCatID], [PrDescription], [PrFreeDelivery], [Pr30Day], [PrWar], [PrImage]) VALUES (@PrName_, @PrPrice, @PrBrandID, @PrCatID, @PrSubCatID, @PrDescription, @PrFreeDelivery, @Pr30Day, @PrWar, @PrImage)" UpdateCommand="UPDATE [tbl_Products] SET [PrName ] = @PrName_, [PrPrice] = @PrPrice, [PrBrandID] = @PrBrandID, [PrCatID] = @PrCatID, [PrSubCatID] = @PrSubCatID, [PrDescription] = @PrDescription, [PrFreeDelivery] = @PrFreeDelivery, [Pr30Day] = @Pr30Day, [PrWar] = @PrWar, [PrImage] = @PrImage WHERE [PID] = @PID">
                <DeleteParameters>
                    <asp:Parameter Name="PID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PrName_" Type="String" />
                    <asp:Parameter Name="PrPrice" Type="Decimal" />
                    <asp:Parameter Name="PrBrandID" Type="Int32" />
                    <asp:Parameter Name="PrCatID" Type="Int32" />
                    <asp:Parameter Name="PrSubCatID" Type="Int32" />
                    <asp:Parameter Name="PrDescription" Type="String" />
                    <asp:Parameter Name="PrFreeDelivery" Type="Int32" />
                    <asp:Parameter Name="Pr30Day" Type="Int32" />
                    <asp:Parameter Name="PrWar" Type="Int32" />
                    <asp:Parameter Name="PrImage" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PrName_" Type="String" />
                    <asp:Parameter Name="PrPrice" Type="Decimal" />
                    <asp:Parameter Name="PrBrandID" Type="Int32" />
                    <asp:Parameter Name="PrCatID" Type="Int32" />
                    <asp:Parameter Name="PrSubCatID" Type="Int32" />
                    <asp:Parameter Name="PrDescription" Type="String" />
                    <asp:Parameter Name="PrFreeDelivery" Type="Int32" />
                    <asp:Parameter Name="Pr30Day" Type="Int32" />
                    <asp:Parameter Name="PrWar" Type="Int32" />
                    <asp:Parameter Name="PrImage" Type="String" />
                    <asp:Parameter Name="PID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
&nbsp;&nbsp;&nbsp; 
            <label style="padding: 0px 460px 0px 485px;">Categories</label>
        </div>
         <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="CatID" DataSourceID="SqlDataSource4">
             <Columns>
                 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                 <asp:BoundField DataField="CatID" HeaderText="CatID" InsertVisible="False" ReadOnly="True" SortExpression="CatID" />
                 <asp:BoundField DataField="CatName" HeaderText="CatName" SortExpression="CatName" />
             </Columns>
         </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tbl_Category]" DeleteCommand="DELETE FROM [tbl_Category] WHERE [CatID] = @CatID" InsertCommand="INSERT INTO [tbl_Category] ([CatName]) VALUES (@CatName)" UpdateCommand="UPDATE [tbl_Category] SET [CatName] = @CatName WHERE [CatID] = @CatID">
             <DeleteParameters>
                 <asp:Parameter Name="CatID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="CatName" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="CatName" Type="String" />
                 <asp:Parameter Name="CatID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>
    </form>
</body>
</html>
