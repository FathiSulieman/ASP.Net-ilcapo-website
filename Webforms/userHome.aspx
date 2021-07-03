<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userHome.aspx.cs" Inherits="Web_project.userHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Il Capo</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="Scripts/css/style.css" type="text/css" media="all" />
    
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">Il Capo</a></h1>
    <!-- Cart -->
   <div id="cart"> <a href="Cart.aspx" class="cart-link">Your Bag</a>
      <div class="cl">&nbsp;</div>
      <span>Items: 
          <asp:Label ID="ToalItems" runat="server" Text=""></asp:Label></span><br />
       <span>Price:<asp:Label ID="TotalPrice" runat="server" Text=""></asp:Label>$</span> 
	 </div>
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="userHome.aspx" class="active">Home</a></li>
        <li><a href="FAQS.aspx">FAQs</a></li>


          <%
              if (Session["user"] == null)
              { 
                  %>
          
          <li>
        <div class="dropdown">
        <button class="dropbtn" onclick="openLogin()">My Account 
      <i class="fa fa-caret-down"></i>
        </button>
    <div class="dropdown-content">
      <a href="userLogin.aspx?type=User" >Login As User</a>
      <a href="Admin_login.aspx?type=Admin" >Login As Admin</a>
      
    </div>
  </div> 
        </li>
          
          <%
              }
              else
              { %>
          <li>
        <div class="dropdown">
        <button class="dropbtn" onclick="openAccount()">My Account 
      <i class="fa fa-caret-down"></i>
        </button>
    <div class="dropdown-content">
      <a href="logout.aspx" style="width: 110px;}">Logout</a>
      
    </div>
  </div> 
        </li>

          <%
              }%>
        




        <li><a href="TheStore.aspx">The Store</a></li>
        <li><a href="Contacts.aspx">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
    <div class="cl">&nbsp;</div>
    <!-- Content -->
    <div id="content">
      <!-- Content Slider -->
      <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide3.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide4.jpg" alt="" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
      </div>
      <!-- End Content Slider -->
      <!-- Products -->
      <div class="products">
        <div class="cl">&nbsp;</div>
        <ul id="productsMenu">
		  <asp:Repeater ID="d1" runat="server" >
    <HeaderTemplate>
            <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li class="product"> <a href='<%# "ProductDescription.aspx?id=" + Eval("PID") + ""%>'><img src='<%#Eval("PrImage")%>' alt="" /></a>
            <div class="product-info">
                <h3>NEW COLLECTION</h3>
              <div class="product-desc">
                <h4><%#Eval("PrName")%></h4>
                <p><%#Eval("PrDescription")%></p>
                <strong class="price">$<%#Eval("PrPrice")%></strong> 

               </div>
            </div>
      </li>
    </ItemTemplate>
    <FooterTemplate>
       
          
          </ul>
    </FooterTemplate>
</asp:Repeater>
        </ul>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
    </div>
    <!-- End Content -->
    <!-- Sidebar -->
    <div id="sidebar">
      <!-- Search -->
      <div class="box search">
        <h2>Search<span></span></h2>
        <div class="box-content">
          <form action="#" method="post">
            <br>
			<input type="button" class="search-submit" value="" onclick="search();"/>
            <input type="text" class="field" placeholder="Enter Item Name." id="searchtextbox"/>
          </form>
        </div>
      </div>
      <!-- End Search -->
      <!-- Categories -->
      <div class="box categories">
        <h2>Categories <span></span></h2>
        <div class="box-content">
          <ul id="menu">

          </ul>
        </div>
      </div>
      <!-- End Categories -->
    </div>
    <!-- End Sidebar -->
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <!-- Side Full -->
  <div class="side-full">
    <!-- More Products -->
    <div class="more-products">
      <div class="more-products-holder">
        <ul>
          <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
          <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
          <li class="last"><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
        </ul>
      </div>
      <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div>
    </div>
    <!-- End More Products -->
    <!-- Text Cols -->
    <div class="cols">
      <div class="cl">&nbsp;</div>
      <div class="col">
        <h3 class="ico ico1">Free Shipping</h3>
        <p>Shipping costs are dependent upon ship-to address. Enjoy free shipping on all orders above 100$.</p>
        <p class="more"><a href="FAQS.aspx" class="bul">More Info.</a></p>
      </div>
      <div class="col">
        <h3 class="ico ico2">Contact Us</h3>
        <p>We'd love to hear from you. Whether you have a question about shipping, paying, or anything else.</p>
        <p class="more"><a href="Contacts.aspx" class="bul">More Info.</a></p>
      </div>
      <div class="col col-last">
        <h3 class="ico ico4">Our Stores</h3>
        <p>Now you can visit us at our new local stores available at 9 locations. Check if there's a store near you and pass by.</p>
        <p class="more"><a href="TheStore.aspx" class="bul">More Info.</a></p>
      </div>
      <div class="cl">&nbsp;</div>
    </div>
    <!-- End Text Cols -->
  </div>
  <!-- End Side Full -->
  <!-- Footer -->
  <div id="footer">
    <p class="left"> <a href="userHome.aspx">Home</a> <span>|</span> <a href="FAQS.aspx">FAQs</a> <span>|</span> <a href="LoginOption.aspx">My Account</a> <span>|</span> <a href="TheStore.aspx">The Store</a> <span>|</span> <a href="Contacts.aspx">Contact</a> </p>
    <p class="right"> &copy; 2020 Shop Name.</p>
  </div>
  <!-- End Footer -->
</div>
<!-- End Shell -->
</body>
    <script>
        function openLogin() {

            window.location.href = "LoginOption.aspx";
            
        }
        function openAccount() {

            window.location.href = "display_order.aspx";

        }
        $(document).ready(function () {
            $.ajax({
                url: 'MenuHandler.ashx',
                method: 'get',
                dataType:'json',
                success: function (data) {
                    buildMenu($('#menu'), data);
                   
                }
            });
            function buildMenu(parent, items) {
                $.each(items, function () {
                    var li = $('<li id=' + this.id +'><a href=\"userHome.aspx?catId='+this.id+'\">' + this.name + '</a></li>');
                    li.appendTo(parent);
                });
            }
        });
        function search() {
            window.location = "ProductDescription.aspx?search=" + document.getElementById("searchtextbox").value;

        }
    </script>
</html>
