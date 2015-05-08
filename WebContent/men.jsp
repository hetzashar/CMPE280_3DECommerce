<%@page import="com.fashion3d.beans.ShoppingCart"%>
<%@page import="com.fashion3d.beans.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion3d.beans.Products"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>3D Fashionista - Men</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<meta name="description" content="RGB Indexing of merchandise">
<meta name="author" content="CMPE280 Team 03">
<meta name="alfie content='10 days'">
<meta name="distribution" content="web">
<meta name="keywords" content="html fashion,tshirt,jeans,shirt,shoes,3D" />
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google-translate-customization" content="b6d52dfb0e9e007a-120d726c1560af23-g424449574002f1cd-2a"></meta>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="bootstrap/css/bootstrap.css">
<script src="bootstrap/js/bootstrap-switch.js"></script>
<link rel="stylesheet" href="css/header.css">
<link href="css/hover.css" rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Dancing+Script:400,700'
	rel='stylesheet' type='text/css'>
<title>3D Fashionista</title>

<!-- Adding custom style sheets -->
<style>

</style>
</head>

<body style="background-image: url('images/background.png')">
	<nav style="z-index: 500"class="navbar navbar-inverse">
		<div class="container-fluid">
		<h1 style="display:none;position:abosulte;color:white"> HELLO TEST</h1>
		<h2 style="display:none;position:abosulte;color:white"> HELLO TEST</h2>
			<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			<span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span> 
		    </button>
				<a href="./index.html"
					style="font-family: Dancing Script, cursive; font-size: 32px">Alfie</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
      
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">Home</a></li>
				<li class="active"><a href="men.jsp">Men</a></li>
				<li class="active"><a href="women.jsp">Women</a></li>
				<li class="active"><a href="aboutUs.jsp">About Us</a></li>
			</ul>
				
			<ul class="nav navbar-nav navbar-right" style="margin-right:40px">
				<%Users user=(Users)session.getAttribute("loggedInUser");
					if(user!=null && user.getUserId()!=0){
						int day=user.getLastLoggedIn().getDate();
						int month=user.getLastLoggedIn().getMonth()+1;
						int year=user.getLastLoggedIn().getYear()+1900;
						int hh=user.getLastLoggedIn().getHours();
						int min=user.getLastLoggedIn().getMinutes();
					%>
					 <li class="dropdown">
						 <a href="/CMPE280_3DECommerce/logoutServlet" class="dropdown-toggle" data-toggle="dropdown"> Welcome <%=user.getFname()%>! Last logged in: <%=month%>/<%=day%>/<%=year%> <%=hh%>:<%=min%><b class="caret"></b></a>
						 <ul class="dropdown-menu">
						 	<li style="margin-left:5px"><a href="/CMPE280_3DECommerce/logoutServlet">Logout</a></li>
						 </ul>
						 </li>
					<%}else{%>
				
				<li><a href="login.jsp"><span
						class="glyphicon glyphicon-user"></span> Login</a></li>
					<%}%>
				<%
					int itemsInCart=0;
					List<ShoppingCart> cartList = (ArrayList<ShoppingCart>)session.getAttribute("itemsInCart");
					if(cartList!=null){
						itemsInCart=cartList.size();
					}
				%>
				 <li class="dropdown">
			          <a href="cartcheckout.jsp" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-shopping-cart"></span> <%=itemsInCart%> item(s)<b class="caret"></b></a>
			          <ul class="dropdown-menu">
			          	<%if(itemsInCart == 0){ %>
			            <li>No Items found</li>
			            <%}else{
			            	float totalCost=0f;
			            	for(int i=0; i<itemsInCart; i++){
			            		ShoppingCart cart = cartList.get(i);
			            		totalCost=totalCost+cart.getPriceOfTotalItems();
			            	%>
								<li><a href="/CMPE280_3DECommerce/productDetail?productId=<%=cart.getProductId()%>">
									<table style="font-size:12px;">
									<tr><td>
									<img alt="" src="<%=cart.getProducts().getTnImagePath() %>" width="50px" height="50px"></td>
									<td><p><%=cart.getProducts().getTitle() %></p>
									<p>Quantity: <%=cart.getTotalItems() %></p>
									</tr>
									</table>
								</a></li>		            	
			           <% }
			            	%>
			           			<li class="divider"></li>
			           			<b><center>Total Cost: <%=totalCost %></center></b>
			           			<li class="divider"></li>
			           			<a href="cartcheckout.jsp" class="btn btn-info" role="button" style="margin-left:5px">Checkout</a>
			           			
			           <%}%>
			          </ul>
			        </li>
			</ul>
		</div>
		</div>
	</nav>

	<br />
	<div style="margin-left: 30px; margin-right: 30px; align: center">
		<center>
			<h2 style="color: #9370DB">Men's Store</h2>
		</center>
		<br />
		<%List<Products> menProductList = (ArrayList<Products>) session.getAttribute("menList");
			for(int i=0; i<menProductList.size(); i++){
				Products product = menProductList.get(i);
				if(i%3==0){
			%>
		<div class="row">
			<%	} %>


			<!-- PROD GRID 
					============================================================ -->

			<!-- PROD. ITEM -->
			<div class="col-sm-6 col-md-4 hvr-wobble-vertical">
				<div class="thumbnail">
					<img src="<%=product.getImagePath() %>" width="285px" height="285px">
					<div class="caption">
						<h3 class=""><%=product.getTitle() %></h3>
						<p class=""><%=product.getProductName() %></p>
						<p class="lead">
							$<%=product.getPrice() %></p>
						<p>
							<a
								href="/CMPE280_3DECommerce/AddToCartServlet?page=men.jsp&productId=<%=product.getProductId()%>"
								class="btn btn-primary" role="button">Add to cart</a> <a
								href="/CMPE280_3DECommerce/productDetail?productId=<%=product.getProductId()%>"
								class="btn btn-default" role="button">View Product Detail</a>
						</p>
					</div>
				</div>
			</div>
			<%
			if(i%3==2 || i+1>menProductList.size()){
			%>
		</div>
		<%}
			}
			%>
	</div>
	<footer>
		
		<p style="right:20px;position:absolute;"> Copyrights © 2015 | All right reserved  | <a href="locations.jsp">Search Store</a></p>
		</div>
		</footer>
		
		<div id="google_translate_element"></div><script type="text/javascript">
function googleTranslateElementInit() {
  new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.FloatPosition.TOP_LEFT, multilanguagePage: true}, 'google_translate_element');
}
</script><script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</body>
</html>