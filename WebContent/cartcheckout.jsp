<%@page import="com.fashion3d.beans.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion3d.beans.ShoppingCart"%>
<%@page import="java.util.List"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="bootstrap/js/bootstrap-switch.js"></script>
	<link rel="stylesheet" href="css/header.css">
	<title>3D Fashionista</title>	
	</head>

	<body>
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
		<br/>
		<form action="UpdateCartServlet" method="get" role="form">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">
								<div class="row">
									<div class="col-xs-9">
										<h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
									</div>
									<div class="col-xs-3">
										<button type="button" class="btn btn-primary btn-sm btn-block">
											<span class="glyphicon glyphicon-share-alt"></span> <a href="index.jsp" style="color:white;">Continue shopping</a>
										</button>
									</div>
								</div>
							</div>
						</div>
						
						<div class="panel-body">
							<div class="row">
							<% float totalCost=0f;
			            	   for(int i=0; i<itemsInCart; i++){
			            			ShoppingCart cart = cartList.get(i);
			            			totalCost=totalCost+cart.getPriceOfTotalItems(); %>
								<div class="col-xs-2"><img class="img-responsive" src="<%=cart.getProducts().getTnImagePath()%>" width="100px" height="70px">
								</div>
								<div class="col-xs-4">
									<h4 class="product-name"><strong><%=cart.getProducts().getProductName() %></strong></h4><h4><small><%=cart.getProducts().getProductDescription()%></small></h4>
								</div>
								<div class="col-xs-6">
									<div class="col-xs-6 text-right">
										<h6><strong><%=cart.getProducts().getPrice() %> <span class="text-muted">x</span></strong></h6>
									</div>
									<div class="col-xs-2">
										<input type="text" class="form-control input-sm" placeholder="<%=cart.getTotalItems()%>" value="<%=cart.getTotalItems()%>" name="itemCount<%=cart.getCartId()%>" id="itemCount<%=cart.getCartId()%>">
									</div>
									<div class="col-xs-1">
										<a href="/CMPE280_3DECommerce/DeleteCartServlet?cartId=<%=cart.getCartId()%>" class="btn btn-link btn-xs">
											<span class="glyphicon glyphicon-trash"> </span>
										</a>
									</div>
									<div class="col-xs-1">
										<a href="/CMPE280_3DECommerce/UpdateCartServlet?cartId=<%=cart.getCartId()%>&page=cartcheckout.jsp&pricePerItem=<%=cart.getProducts().getPrice()%>&isComplete=N" class="btn btn-link btn-xs">
											<span class="glyphicon glyphicon-refresh"> </span>
										</a>
									</div>
								</div>
							</div>
							<hr>
							<% }
				            %>
						</div>
						<div class="panel-footer">
							<div class="row text-center">
								<div class="col-xs-9">
									<h4 class="text-right">Total <strong><%=totalCost%></strong></h4>
								</div>
								<div class="col-xs-3">
									<button type="button" class="btn btn-success btn-block">
										<a href="payment.jsp?totalCost=<%=totalCost%>" style="color:white">Checkout</a>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</body>
</html>