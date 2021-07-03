<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQS.aspx.cs" Inherits="Web_project.FAQS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Il Capo</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
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

h2 {font-size: 50px; line-height: 177px; font-weight: bold; background: #ff3838; color: black;}
h3 { font-size:12px; line-height:14px; text-transform: uppercase; color:#fff; }
h4 { font-size:12px; line-height:14px; text-transform: uppercase; color:#000; }
b {font-size: 20px; line-height: 100px; text-transform: uppercase; color: #fff; margin-left: 60px;}
select { width:957px; background:black; font-size:15px; line-height:14px; text-transform: uppercase; color:#fff; }
option:checked {
  background: linear-gradient(#ff3838, #ff3838);
}
textarea {width: 940px; background: black; font-size: 15px; line-height: 28px; text-transform: uppercase; color: #fff; padding: 19px 0px 0px 15px;}
td { width:957px;}


h1#logo { font-size:0; line-height:0; width:156px; height:64px; float:left; }
h1#logo a{ display:block; height:64px; text-indent: -4000px; background: black;/*url(images/logo.gif);*/ }

.shell { width:960px; margin:0 auto; background:#000000; padding-left:10px; padding-right:10px;}

#header { height:64px; background:#000; position:relative;}

#navigation { float:right; white-space:nowrap; }
#navigation ul{ list-style-type: none; height:64px; float:left; width:599px;}
#navigation ul li{ float:left; display:inline;}
#navigation ul li a{ float:left; height:64px; line-height:64px; text-decoration: none; color:#fff; padding:0 28px; font-weight: bold;}
#navigation ul li a.active,
#navigation ul li a:hover{ background:#ff3838; color:#fff; transition: all .4s; cursor:pointer;}

#cart {     float: right;  width: 104px; top: 0; right: 0; height: 51px; background: #000; color: #fff; padding: 17px 10px 0 8px; white-space: nowrap; line-height: 20px;}
a.cart-link { color:#fff; background:url(css/images/cart2.png) no-repeat 0 0; padding: 4px 5px 5px 32px; text-decoration: none;}
a.cart-link:hover { text-decoration: underline; transition: all .4s; color: #ff3838;}

#sidebar { float:left; width:226px;}
#content { float:right; width:724px;}

#main { padding:10px 0 0 0; }

.box { padding:1px; margin-bottom:10px;}
.box h2{ background:#black; color:#fff; font-weight: bold; padding:0 5px; position:relative; height:27px; line-height:27px; }
.box h2 span{ position:absolute; width:10px; height:5px; background:#000; top:27px; right:10px; font-size:0; line-height:0;}
.box-content { padding:5px; }

a.bul { background:url(images/bul.gif) no-repeat 0 center; padding-left:10px;}

.search { min-height:252px;}
.search label { display:block; padding-bottom:3px; color:#fff;}

.search .field { display:block;}
.search .inline-field label { display:inline; padding:0; }
.search .inline-field .field { display:inline; margin:0; }
.search input.field {width: 142px; color: white; height: 20px; font-size: 15px;}
.search select.field { width:212px; }
.search select.small-field { width:50px; }

.search-submit {     width: 25px; background: url(images/search4.png); border: 0px; height: 25px; display: block; line-height: 26px; cursor: pointer; margin: 0px 9px 0px 0px;  float: left;}

.categories { min-height:383px;  border:solid 1px #0d0d0d;}
.categories ul { list-style-type: none; font-size:14px;  font-weight: bold;}
.categories ul li{ padding:5px 0;}
.categories ul li.last{ border-bottom:0; padding-bottom:0;}
.categories ul li.product{ border-bottom:0; padding-bottom:0;}
.categories ul li a{ color:#8f8f8f; text-decoration: none; background:url(images/cat.gif) no-repeat 0 4px; padding: 0px 5px 0px 17px;}
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
.product-info p{ font-size: 16px; line-height: 18px; text-transform: uppercase; color: #fff; TEXT-ALIGN: center;  padding: 138px 0px 8px 0px; height: 45px;}
.product-info .product-desc{ padding: 6px 0px 0px 8px; color:#fff;}

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
.more-nav a.next{ background:url(images/next.gif); left:910px;}
.more-nav a.prev{ background:url(images/prev.gif); left:20px;}

.cols { padding:15px 0; padding-left:125px;}
.col { float:left; display:inline; width:217px; margin-right:30px;}
.col-last { margin-right:0;}

h3.ico { background-repeat:no-repeat; background-position:0 2px; padding:6px 0 8px 30px;}
h3.ico1 { background-image:url(images/ico1.gif);}
h3.ico2 { background-image:url(images/ico2.gif);}
h3.ico4 { background-image:url(images/ico4.gif);}

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
        <li><a href="userHome.aspx" >Home</a></li>
        <li><a href="FAQS.aspx" class="active">FAQs</a></li>
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
	 <!-- Main -->
  <div id="main">
    <div class="cl">&nbsp;</div>



<center>
<form name=faqform>
	<h2>FAQs</h2>
<table border=1 cellspacing=0 cellpadding=5>

<tr bgcolor="black"><td><font  size="2"><br>
<b>Browse the Frequently Asked Questions below and click for the answers</b>
<p>
<ul><select size=10 name=question onChange="javascript:showFAQ(this.form);">
<option value="Contact us at “E-shopping@gmail.com” with your order # and we will assist you.">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;Help! My order is missing, what do I do?
<option value="You may cancel or change your order within 24 hours of placement.

 ">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;Can I change or cancel my order? 
<option value="After you place your order, you will receive a tracking number from the courier via email.">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;How can I track my order? 
<option value="Contact us at “E-shopping@gmail.com” with your order number so we can assist you. 

 ">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;My order is missing an item(s), what should I do?
<option value="Contact us at “E-shopping@gmail.com” with your order number so we can assist you.">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;I received faulty and/or damaged items, what should I do? 
<option value="Shipping costs are dependent upon size, weight, and ship-to address. You will receive a price prior to shipment.">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;How much does shipping cost?
<option value="Shipping times depend upon the method of shipment, seasonal variations, and the ship-to address.  When you receive the shipping details, it will contain an estimated date of delivery. For ground, domestic orders, we usually allow up to a week for processing and 4-5 business days for domestic delivery. ">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;How long does shipping take? 
<option value="Your credit card will be charged at the time of order.

">&nbsp;&nbsp;&nbsp;-->&nbsp;&nbsp;When will my credit card be charged? 
</select>
</ul>
<p size="2">
<b style="
    margin-left: 429px;
!important">Answers</b>
<p>
<ul>
<textarea name="answer" rows=15 cols=50 wrap=virtual></textarea>
</ul>
</font>
</td>
</tr>
</table>
</form>
</center>
	  <div />
    </body>
    <SCRIPT LANGUAGE="JavaScript">
<!-- Begin

    function showFAQ(form) {
        form.answer.value = form.question.options[form.question.selectedIndex].value;
		}
        function openLogin() {

            window.location.href = "LoginOption.aspx";

        }
        function openAccount() {

            window.location.href = "display_order.aspx";

        }
// End -->
    </SCRIPT>

</html>
