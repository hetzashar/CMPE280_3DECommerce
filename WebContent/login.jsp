<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>3D Fashionista - Login</title>
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
<link rel="stylesheet" href="stylee.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>


<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/stylee.css">

<link rel="stylesheet" type="text/css" href="css/style.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script>

</script>

<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<title>3D Fashionista</title>

<style>
video#bgvid {
	position: fixed;
	right: 0;
	bottom: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100;
	background: url(polina.jpg) no-repeat;
	background-size: cover;
	-webkit-filter: blur(14px);
	opacity: 0.4;
}

section#content {
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}
</style>
</head>

<body background="images/texture.jpg">


	<div class="container">
		<video muted autoplay loop poster="polina.jpg" id="bgvid"> <source
			src="fashion.mp4" type="video/mp4"></video>
		<section id="content">
		<form role="form" action="LoginServlet" method="post">
			<h1>Login</h1>
			<div>
				<input type="text" name="username" placeholder="Username"
					required="required" id="username" />
			</div>
			<div>
				<input type="password" name="password" placeholder="Password"
					required="required" id="password" />
			</div>
			<div>
				<input type="submit" value="Log in" align="right" />
				<!-- 				<a href="#">Lost your password?</a> -->
				<a style="text-decoration:none;"href="signup.jsp">Register</a>
			</div>

		</form>
		<!-- form -->
		<div class="button"></div>
		<!-- button --> </section>
		<!-- content -->
		
		
		
	</div>
	<!-- container -->
	
		<footer>
		<div class="row">
		<p> Copyrights 2015 </p>
		</div>
		</footer>
</body>
<script type="text/javascript" src="js/script.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap-switch.js"></script>
		
</html>
