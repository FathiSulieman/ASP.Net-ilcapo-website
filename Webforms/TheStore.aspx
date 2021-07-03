<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TheStore.aspx.cs" Inherits="Web_project.TheStore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
    <style>
        * { padding:0; margin:0; outline:0; }
body {
	background: linear-gradient(30deg, black 50%, #ff3838 50%);
	font-family: Merriweather;/*apercu, Arial, sans-serif;*/
	font-size: 16px;
	line-height:16px;
	color:#b8b8b8;
}
input, textarea, select { font-family: "Trebuchet MS", Arial, sans-serif; font-size:12px; }

.field {     background: #000; border-bottom: solid 2px #ffffff; border-top: 0px; border-left: 0px;border-right: 0px; padding: 2px;}

a img { border:0; }

a { color:#b8b8b8; cursor:pointer;}
a:hover { color:#fff; text-decoration: none; text-decoration: underline; transition: all .4s}

.left, .alignleft { float:left; display:inline; }
.right, .alignright { float:right; display:inline; }

.cl { font-size:0; line-height:0; clear:both; display:block; height:0; }

.al { text-align: left; }
.ar { text-align: right; }
.ac { text-align: center; }

h2 { font-size:24px; line-height:18px;  font-weight: 900; text-transform: uppercase;}
h3 { font-size:12px; line-height:14px; text-transform: uppercase; color:#fff; }
h4 { font-size:12px; line-height:14px; text-transform: uppercase; color:#000; }


h1#logo { font-size:0; line-height:0; width:156px; height:64px; float:left; }
h1#logo a{ display:block; height:64px; text-indent: -4000px; background:url(Scripts/css/images/logo.jpg);}

.shell { width:960px; margin:0 auto; background:#000000; padding-left:10px; padding-right:10px;}

#header { height:64px; background:#000; position:relative;}

#navigation { float:right; white-space:nowrap; }
#navigation ul{ list-style-type: none; height:64px; float:left; width:599px;}
#navigation ul li{ float:left; display:inline;}
#navigation ul li a{ float:left; height:64px; line-height:64px; text-decoration: none; color:#fff; padding:0 28px; font-weight: bold;}
#navigation ul li a.active,
#navigation ul li a:hover{ background:#ff3838; color:#fff; transition: all .4s; cursor:pointer;}

#cart {     float: right;  width: 104px; top: 0; right: 0; height: 51px; background: #000; color: #fff; padding: 17px 10px 0 8px; white-space: nowrap; line-height: 20px;}
a.cart-link { color:#fff; background:url(Scripts/css/images/cart2.png) no-repeat 0 0; padding: 4px 5px 5px 32px; text-decoration: none;}
a.cart-link:hover { text-decoration: underline; transition: all .4s; color: #ff3838;}

#sidebar { float:left; width:226px;}
#content { float:right; width:724px;}

#main { padding:10px 0 0 0; }

.box { padding:1px; margin-bottom:10px;}
.box h2{ background:black; color:#fff; font-weight: bold; padding:0 5px; position:relative; height:27px; line-height:27px; }
.box h2 span{ position:absolute; width:10px; height:5px; background:#000; top:27px; right:10px; font-size:0; line-height:0;}
.box-content { padding:5px; }

a.bul { background:url(Scripts/css/images/bul.gif) no-repeat 0 center; padding-left:10px;}

.search { min-height:252px;}
.search label { display:block; padding-bottom:3px; color:#fff;}

.search .field { display:block;}
.search .inline-field label { display:inline; padding:0; }
.search .inline-field .field { display:inline; margin:0; }
.search input.field {width: 142px; color: white; height: 20px; font-size: 15px;}
.search select.field { width:212px; }
.search select.small-field { width:50px; }

.search-submit {     width: 25px; background: url(Scripts/css/images/search4.png); border: 0px; height: 25px; display: block; line-height: 26px; cursor: pointer; margin: 0px 9px 0px 0px;  float: left;}

.categories { min-height:383px;  border:solid 1px #0d0d0d;}
.categories ul { list-style-type: none; font-size:14px;  font-weight: bold;}
.categories ul li{ padding:5px 0;}
.categories ul li.last{ border-bottom:0; padding-bottom:0;}
.categories ul li.product{ border-bottom:0; padding-bottom:0;}
.categories ul li a{ font-size:17px; color:#8f8f8f; text-decoration: none; background:url(Scripts/css/images/cat.gif) no-repeat 0 4px; padding: 0px 5px 0px 17px;}
.categories ul li a:hover{ color:#ff3838; transition: all .4s}

#slider { height:252px; position:relative; overflow:hidden; }
#slider-holder { width:720px; height:252px; position:relative; overflow:hidden; }
#slider-holder .jcarousel-clip{ width:720px; height:252px; position:relative; overflow:hidden; }
#slider-holder ul{ width:720px; height:252px; position:relative; overflow:hidden; list-style-type: none;}
#slider-holder ul li{ width:720px; height:252px; position:relative; overflow:hidden; float:left; }

#slider-nav { position:absolute; top:231px; left:644px; z-index:2;}
#slider-nav a{ font-size:0; line-height:0; text-indent: -4000px; width:10px; height:10px; border:solid 1px #ff3838; background:#ff3838; float:left; margin-right:5px; }
#slider-nav a:hover,
#slider-nav a.active { background:#fff;}

.products {}
.products ul{ list-style-type: none;}
.products ul li{ position: relative; padding: 47px 0px 0px 64px; border: solid 2px black; float: left; width: 173px; margin-right: 9px; height: 173px; overflow: hidden;}
.products ul li.last{ margin-right:0; }
.products ul li.product{ margin-right:0; }
.products ul li:hover{ border:solid 2px #ff3838; transition: all .4s; cursor:pointer;}

.product-info{     position: absolute; width: 231px; padding-left: 1px; top: 1px; left: 0;}
.product-info h3{ background:#ff3838; color:#fff; padding:6px 10px; }
.product-info h4{ font-weight: normal;}
.product-info p{ font-size: 16px;
    line-height: 18px;
    text-transform: uppercase;
    color: #fff;
    TEXT-ALIGN: center;
    height: 45px;
    position: absolute;
    top: 135px;
    width: 220px;}
.product-info .product-desc{ padding: 6px 0px 0px 8px;
    position: absolute;}

.price { display:block; font-size:21px; color:#ff3838; line-height:23px; }

.more-products { border:solid 1px #0d0d0d; position:relative; height:114px; overflow:hidden; }
.more-products ul{ list-style-type: none; height:94px; position:relative; overflow:hidden; width:805px;}
.more-products ul li{ float:left; width:94px; height:94px; border:solid 1px #0d0d0d; padding:0 5px;}
.more-products ul li:hover{ background:#ff3838; transition: all .4s}
.more-products ul li.last{ border-right:0; }
.more-products ul li.product{ border-right:0; }

.more-products-holder { width:804px; height:94px; position:relative; overflow:hidden; top:10px; left:70px;}
.more-products-holder .jcarousel-clip{ width:804px; height:94px; position:relative; overflow:hidden; }

.more-nav { font-size:0; line-height:0;}
.more-nav a{ position:absolute; top:40px; left:0; width:30px; height:32px; text-indent: -4000px; z-index:3;}
.more-nav a.next{ background:url(Scripts/css/images/next.gif); left:910px;}
.more-nav a.prev{ background:url(Scripts/css/images/prev.gif); left:20px;}

.cols { padding:15px 0; padding-left:125px;}
.col { float:left; display:inline; width:217px; margin-right:30px;}
.col-last { margin-right:0;}

h3.ico { background-repeat:no-repeat; background-position:0 2px; padding:6px 0 8px 30px;}
h3.ico1 { background-image:url(Scripts/css/images/ico1.gif);}
h3.ico2 { background-image:url(Scripts/css/images/ico2.gif);}
h3.ico4 { background-image:url(Scripts/css/images/ico4.gif);}

#footer { height:51px; background:#000; white-space:nowrap; line-height:50px; padding:0 15px; color:#7b7b7b; margin-top:10px; border-top: solid 1px; border-color: #7b7b7b;}
#footer a{ color:#7b7b7b; text-decoration: none; }
#footer a:hover{ color:#fff;}
#footer span{ padding:0 2px;}
        .dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
.dropdown {
	float: left;
	overflow: hidden;
	height: 64px;
	line-height: 64px font-weight: bold
}

	.dropdown .dropbtn {
		font-size: 16px;
		border: none;
		outline: none;
		color: white;
		padding: 23px 20px;
		background-color: inherit;
		font-family: inherit;
		margin: 0;
		font-weight: bold
	}

	.dropdown:hover .dropbtn {
		background-color: #ff3838;
	}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #171515;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	z-index: 1;
}

	.dropdown-content a {
		float: none;
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
		text-align: left;
	}

		.dropdown-content a:hover {
			background-color: #ddd;
		}

.dropdown:hover .dropdown-content {
	display: block;
}

    </style>
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
</head>
<body>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="#">shoparound</a></h1>
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
        <li><a href="userHome.aspx">Home</a></li>
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
        <li><a href="TheStore.aspx"  class="active">The Store</a></li>
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
        <ul>
          <li class="product"> <a href="https://goo.gl/maps/NocnfM4h12W4zvg86"><img src="Scripts/css/images/location2.png" alt="" style="
    margin-left: 19px;"/></a>
            <div class="product-info">
              <div class="product-desc">
                <p>5897 - Mina Building, Hamra Street, Hamra, Beirut. </p>
				</div>
            </div>
          </li>
		  <li class="product"> <a href="https://goo.gl/maps/yKoXYo8Txrm18zPD6"><img src="Scripts/css/images/location2.png" alt="" style="
    margin-left: 19px;"/></a>
            <div class="product-info">
              <div class="product-desc">
                <p>6578 - Al Murr Tower, Kantari Street, Al Kantari, Beirut. </p>
				</div>
            </div>
          </li>
		  <li class="product"> <a href="https://goo.gl/maps/htnEqXWCPRV9iZSe8"><img src="Scripts/css/images/location2.png" alt="" style="
    margin-left: 19px;"/></a>
            <div class="product-info">
              <div class="product-desc">
                <p>3573 - Impact Building, Spears Street, Downtown, Beirut. </p>
				</div>
            </div>
          </li>
		  
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
			<input type="submit" class="search-submit" value=""/>
            <input type="text" class="field" placeholder="Enter Item Name."/>
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
    <p class="right"> &copy; 2020 Il Capo.</p>
  </div>
  <!-- End Footer -->
<>
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
                dataType: 'json',
                success: function (data) {
                    buildMenu($('#menu'), data);

                }
            });
            function buildMenu(parent, items) {
                $.each(items, function () {
                    var li = $('<li id=' + this.id + '><a href=\"userHome.aspx?catId=' + this.id + '\">' + this.name + '</a></li>');
                    li.appendTo(parent);
                });
            }
        });
    </script>
</html>
