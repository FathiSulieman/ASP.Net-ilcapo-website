<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginOption.aspx.cs" Inherits="Web_project.LoginOption" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <link href="Scripts/css/style2.css" rel="stylesheet" />
    <script src='jquery.js' > </script>    
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
 <input type="button" class="btn" value="Login As Admin" onclick="Admin()" />
  <br/>
  <input type="button" class="btn" value="Login As User" onclick="User()" />
    </form>
</body>

    <script>
        function Admin() {
            window.location.href = "Admin_login.aspx?type=Admin";
        }
        function User() {
            window.location.href = "userLogin.aspx?type=User";
        }

    </script>
</html>
