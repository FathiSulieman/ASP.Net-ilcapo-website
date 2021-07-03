<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="Web_project.AdminHomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Shop Around</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="Scripts/css/style.css" type="text/css" media="all" />
    
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
    <style>
        
element.style {
}
#navigation ul li a {
    
    padding: 0 14px !important;
    </style>
</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">Il Capo</a></h1>
    <!-- Cart -->
    <div id="cart"> <a href="userHome.aspx">Sign out</a>
      <div class="cl">&nbsp;</div>
       </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="AdminHomePage.aspx" class="active">Home</a></li>
        <li><a href="AddProduct.aspx">Add Products</a></li>
        <li><a href="AddCategory.aspx">Add Category</a></li>
        <li><a href="AdminPage.aspx">Manage Database</a></li>
        <li><a href="display_order.aspx">View Orders</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main" style="height: 926px;">
    <div class="cl">&nbsp;</div>
       <img src="Scripts/css/images/logoBig.jpg" style="width: 960px; height: 420px; margin-top: 122px;"/>
  </div>
  <!-- End Main -->
</div>
<!-- End Shell -->
</body>
    <script>
        function openLogin() {

            window.location.href = "LoginOption.aspx";
            
        }

    </script>
</html>
