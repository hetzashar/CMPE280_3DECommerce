<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion3d.beans.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion3d.beans.Users"%>
<%@page import="com.fashion3d.beans.Products"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/header.css">
	<script src="bootstrap/js/bootstrap-switch.js"></script>
	<title>3D Fashionista</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.js"></script>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css">
    <link rel="stylesheet" href="css/colorPicker.css">
    <script src ="js/colorPicker.js"></script>
	</head>

	<body>
		<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<a href="./index.html"><img src="images/logo.jpg"
							style="height: 30px; margin-top: 20px;"></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<ul class="nav navbar-nav nav-tab">
						<li class="active"><a href="index.jsp">Home</a></li>
						<li class="active"><a href="men.jsp">Male</a></li>
						<li class="active"><a href="women.jsp">Female</a></li>
						<li class="active"><a href="#">About Us</a></li>
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
			</nav>
			
		<br/>
		<%Products prod = (Products)session.getAttribute("productInSession"); %>
		<div class="container">
	        <div class="row">
	            <div class="col-md-4">
	                <img src="<%=prod.getImagePath() %>" class="img-polaroid" alt="<%=prod.getTitle()%>" height="450px" width="350px">
	            </div>
	            <div class="col-md-7">
	                <h2><%=prod.getTitle()%></h2>
	                <h4 class="muted"><%=prod.getProductName() %></h4>
	                <p><%=prod.getProductDescription() %></p>
	                <hr>
	                <h3>Price - $<%=prod.getPrice()%></h3>
	                <h3>Choose Color</h3>
	                <!-- Color Picker | Load color pallete from DB -->
	                <select id = "colorPicker" name="colorpicker-shortlist">
					  <option value="#7bd148">Green</option>
					  <option value="#5484ed">Bold blue</option>
					  <option value="#a4bdfc">Blue</option>
					  <option value="#46d6db">Turquoise</option>
					  <option value="#7ae7bf">Light green</option>
					  <option value="#51b749">Bold green</option>
					  <option value="#fbd75b">Yellow</option>
					  <option value="#ffb878">Orange</option>
					  <option value="#ff887c">Red</option>
					  <option value="#dc2127">Bold red</option>
					  <option value="#dbadff">Purple</option>
					  <option value="#e1e1e1">Gray</option>
					</select>
	                <p class="muted">Inclusive of all taxes. Free home delivery.</p>
	                <br>
	                <p><a href="/CMPE280_3DECommerce/AddToCartServlet?page=productdetail.jsp&productId=<%=prod.getProductId()%>" class="btn btn-success btn-large">Add to Cart</a></p>
	            </div>
	        </div>
	    </div>
	    <!-- Footer section -->
	    <div class="container">
	        <hr>
	        <div class="row">
	            <div class="span12">
	                <p class="pull-left">Copyright � 2015 SJSU Students Web UI Development</p>
	                <p class="pull-right"><a href="locations.jsp">Search Store</a></p>
	            </div>
	        </div>
	    </div>
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.js"></script>

	    
	</body>
</html>