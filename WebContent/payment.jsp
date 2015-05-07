<%@page import="com.fashion3d.beans.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion3d.beans.ShoppingCart"%>
<%@page import="java.util.List"%>
<html>
<head>
	<title>3D Fashionista - Payment</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<meta name="description" content="RGB Indexing of merchandise">
	<meta name="author" content="CMPE280 Team 03">
	<meta name="alfie content='10 days'">
	<meta name="distribution" content="web">
	<meta http-equiv="refresh" content="30">
	<meta name="keywords" content="html fashion,tshirt,jeans,shirt,shoes,3D" />
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
				           			<button type="button" class="btn btn-primary" style="margin-left:5px" onclick="cartcheckout.jsp">Checkout</button>
				           			
				           <%}%>
				          </ul>
				        </li>
				</ul>
			</div>
		</nav>
		<br/>
		<div class="container">
			  <form class="form-horizontal" role="form" action="UpdateCartServlet" method="post">
			    <fieldset>
			      <legend>Payment</legend>
			      <p>Hello <%=((Users)session.getAttribute("loggedInUser")).getFname()%>! We will be charging you $<%=request.getParameter("totalCost") %> on your credit card</p>
			      <div class="form-group">
			        <label class="col-sm-3 control-label" for="card-holder-name">Name on Card</label>
			        <div class="col-sm-6">
			          <input type="text" class="form-control" name="card-holder-name" id="card-holder-name" placeholder="Card Holder's Name">
			        </div>
			      </div>
			      <div class="form-group">
			        <label class="col-sm-3 control-label" for="card-number">Card Number</label>
			        <div class="col-sm-6">
			          <input type="text" class="form-control" name="card-number" id="card-number" placeholder="Debit/Credit Card Number">
			        </div>
			      </div>
			      <div class="form-group">
			        <label class="col-sm-3 control-label" for="expiry-month">Expiration Date</label>
			        <div class="col-sm-6">
			          <div class="row">
			            <div class="col-xs-3">
			              <select class="form-control col-sm-2" name="expiry-month" id="expiry-month">
			                <option>Month</option>
			                <option value="01">Jan (01)</option>
			                <option value="02">Feb (02)</option>
			                <option value="03">Mar (03)</option>
			                <option value="04">Apr (04)</option>
			                <option value="05">May (05)</option>
			                <option value="06">June (06)</option>
			                <option value="07">July (07)</option>
			                <option value="08">Aug (08)</option>
			                <option value="09">Sep (09)</option>
			                <option value="10">Oct (10)</option>
			                <option value="11">Nov (11)</option>
			                <option value="12">Dec (12)</option>
			              </select>
			            </div>
			            <div class="col-xs-3">
			              <select class="form-control" name="expiry-year">
			                <option value="13">2013</option>
			                <option value="14">2014</option>
			                <option value="15">2015</option>
			                <option value="16">2016</option>
			                <option value="17">2017</option>
			                <option value="18">2018</option>
			                <option value="19">2019</option>
			                <option value="20">2020</option>
			                <option value="21">2021</option>
			                <option value="22">2022</option>
			                <option value="23">2023</option>
			              </select>
			            </div>
			          </div>
			        </div>
			      </div>
			      <div class="form-group">
			        <label class="col-sm-3 control-label" for="cvv">Card CVV</label>
			        <div class="col-sm-3">
			          <input type="text" class="form-control" name="cvv" id="cvv" placeholder="Security Code">
			        </div>
			      </div>
			      <div class="form-group">
			        <div class="col-sm-offset-3 col-sm-9">
			          <button type="submit" class="btn btn-success">Pay Now</button>
			          <button type="button" class="btn btn-success"><a href="cartcheckout.jsp">Go Back</a></button>
			        </div>
			      </div>
			      </fieldset>
				</form>
			</div>
		</body>
</html>