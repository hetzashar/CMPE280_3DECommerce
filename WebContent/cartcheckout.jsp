<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="bootstrap/js/bootstrap-switch.js"></script>
	<style type="text/css">
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
		
		footer{
		  	background:none;
		  	color:#2b2b2b;
			}
		
		footer a{
		   color:#2b2b2b;
		  text-decoration:underline;
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
			.brand{
				
				margin-left:20px;
				font-weight:700;
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
		<div class="container">
			<div class="row">
				<div class="col-xs-8">
					<div class="panel panel-info">
						<div class="panel-heading">
							<div class="panel-title">
								<div class="row">
									<div class="col-xs-6">
										<h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
									</div>
									<div class="col-xs-6">
										<button type="button" class="btn btn-primary btn-sm btn-block">
											<span class="glyphicon glyphicon-share-alt"></span> Continue shopping
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-2"><img class="img-responsive" src="http://placehold.it/100x70">
								</div>
								<div class="col-xs-4">
									<h4 class="product-name"><strong>Product name</strong></h4><h4><small>Product description</small></h4>
								</div>
								<div class="col-xs-6">
									<div class="col-xs-6 text-right">
										<h6><strong>25.00 <span class="text-muted">x</span></strong></h6>
									</div>
									<div class="col-xs-4">
										<input type="text" class="form-control input-sm" value="1">
									</div>
									<div class="col-xs-2">
										<button type="button" class="btn btn-link btn-xs">
											<span class="glyphicon glyphicon-trash"> </span>
										</button>
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-xs-2"><img class="img-responsive" src="http://placehold.it/100x70">
								</div>
								<div class="col-xs-4">
									<h4 class="product-name"><strong>Product name</strong></h4><h4><small>Product description</small></h4>
								</div>
								<div class="col-xs-6">
									<div class="col-xs-6 text-right">
										<h6><strong>25.00 <span class="text-muted">x</span></strong></h6>
									</div>
									<div class="col-xs-4">
										<input type="text" class="form-control input-sm" value="1">
									</div>
									<div class="col-xs-2">
										<button type="button" class="btn btn-link btn-xs">
											<span class="glyphicon glyphicon-trash"> </span>
										</button>
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="text-center">
									<div class="col-xs-9">
										<h6 class="text-right">Added items?</h6>
									</div>
									<div class="col-xs-3">
										<button type="button" class="btn btn-default btn-sm btn-block">
											Update cart
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<div class="row text-center">
								<div class="col-xs-9">
									<h4 class="text-right">Total <strong>$50.00</strong></h4>
								</div>
								<div class="col-xs-3">
									<button type="button" class="btn btn-success btn-block">
										Checkout
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>