<%@page import="com.fashion3d.beans.Products"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="bootstrap/js/bootstrap-switch.js"></script>
		<style>
			body {
	        padding-top: 0px;
	        padding-bottom: 40px;
	        padding-top: 0px;
	        padding-bottom: 0px;
			font-family: 'Roboto', sans-serif;
	      }
		  
		  *{
		  box-sizing:border-box;
		  -webkit-box-sizing:border-box;
		  -moz-box-sizing:border-box;
		  }
			
		.navbar .container  {
			max-width: 1170px;
		}
		
		  h1,h2,h3,h4,h5,h6{
			font-weight:200;
		  }
		  .navbar-inverse .navbar-inner{
			-webkit-border-radius: 0px;
				-moz-border-radius: 0px;
					border-radius: 0px;
					background:#282828;
					border:none;
			}
			
			.page-header{
				border:none;
				padding: 10px 0px 0px;
				margin: 0px 0 0px;
			}
		</style>
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
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							Sign Up</a></li>
					<li><a href="login.jsp"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li><a class="btn" href=""> <img src="images/addtocart.png"
							alt="#">
					</a></li>
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
	                <p class="muted">Inclusive of all taxes. Free home delivery.</p>
	                <br>
	                <p><a href="#" class="btn btn-success btn-large">Add to Cart</a></p>
	            </div>
	        </div>
	    </div>
	    <!-- Footer section -->
	    <div class="container">
	        <hr>
	        <div class="row">
	            <div class="span12">
	                <p class="pull-left">Copyright © 2015 SJSU Students Web UI Development</p>
	                <p class="pull-right"><a href="locations.jsp">Search Store</a></p>
	            </div>
	        </div>
	    </div>
	</body>
</html>