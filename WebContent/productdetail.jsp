<%@page import="java.util.HashMap"%>
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
		<%Products prod = (Products)session.getAttribute("productInSession"); 
		HashMap<String, String> colorMap=prod.getColorListMap();
		int size = colorMap.size();
		String hues = prod.getHues();
		
		String[] hueList = hues.split(",");
		%>
		<div class="container">
	        <div class="row">
	            <div class="col-md-6">
	            	<canvas id="canvas" width="500px" height="500px"></canvas>
	            	<script type="text/javascript">
	            		//var list
						var canvas = document.getElementById("canvas");
						var ctx = canvas.getContext("2d");
				
						var img = new Image();
						img.crossOrigin = "anonymous";
						img.onload = start;
						img.src = "<%=prod.getImagePath()%>";
						
						
						function start(){
							ctx.drawImage(img, 0, 0);
						}
						
						function changeColor(shiftColor) {
							var shift;
							<% for(String i:colorMap.keySet()){ %>
								if(shiftColor == '<%=i%>'){
								//	alert('finally true');
									shift=<%=colorMap.get(i)%>
								}
							
							<%}%>
							alert('we are in change color function'+shiftColor+' '+shift);
							ctx.drawImage(img, 0, 0);
							recolorPants(shift);
							return true;
						}
				
						function recolorPants(colorshift) {
				
							var imgData = ctx.getImageData(0, 0, canvas.width, canvas.height);
							var data = imgData.data;
				
							for (var i = 0; i < data.length; i += 4) {
								red = data[i + 0];
								green = data[i + 1];
								blue = data[i + 2];
								alpha = data[i + 3];
				
								// skip transparent/semiTransparent pixels
								if (alpha < 200) {
									continue;
								}
				
								var hsl = rgbToHsl(red, green, blue);
								var hue = hsl.h * 360;
				
								// change blueish pixels to the new color
								
								<%
									if(hueList.length==4){%>
									if (<%=hueList[0]%> <= hue <= <%=hueList[1]%> && <%=hueList[2]%> <= hue <= <%=hueList[3]%>) {
										var newRgb = hslToRgb(hsl.h + colorshift, hsl.s, hsl.l);
										data[i + 0] = newRgb.r;
										data[i + 1] = newRgb.g;
										data[i + 2] = newRgb.b;
										data[i + 3] = 255;
									}
								<%}else if(hueList.length==2){%>
								if (<%=hueList[0]%> <= hue <= <%=hueList[1]%>) {
									var newRgb = hslToRgb(hsl.h + colorshift, hsl.s, hsl.l);
									data[i + 0] = newRgb.r;
									data[i + 1] = newRgb.g;
									data[i + 2] = newRgb.b;
									data[i + 3] = 255;
								}
								<%}else if(hueList.length==1){%>
								if (hue==<%=hueList[0]%>) {
									var newRgb = hslToRgb(hsl.h + colorshift, hsl.s, hsl.l);
									data[i + 0] = newRgb.r;
									data[i + 1] = newRgb.g;
									data[i + 2] = newRgb.b;
									data[i + 3] = 255;
								}
								
								<%}%>
								
								
									
								
							}
							ctx.putImageData(imgData, 0, 0);
						}
				
				
						function rgbToHsl(r, g, b) {
							r /= 255, g /= 255, b /= 255;
							var max = Math.max(r, g, b),
								min = Math.min(r, g, b);
							var h, s, l = (max + min) / 2;
				
							if (max == min) {
								h = s = 0; // achromatic
							} else {
								var d = max - min;
								s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
								switch (max) {
									case r:
										h = (g - b) / d + (g < b ? 6 : 0);
										break;
									case g:
										h = (b - r) / d + 2;
										break;
									case b:
										h = (r - g) / d + 4;
										break;
								}
								h /= 6;
							}
				
							return ({
								h: h,
								s: s,
								l: l,
							});
						}
				
				
						function hslToRgb(h, s, l) {
							var r, g, b;
				
							if (s == 0) {
								r = g = b = l; // achromatic
							} else {
								function hue2rgb(p, q, t) {
									if (t < 0) t += 1;
									if (t > 1) t -= 1;
									if (t < 1 / 6) return p + (q - p) * 6 * t;
									if (t < 1 / 2) return q;
									if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
									return p;
								}
				
								var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
								var p = 2 * l - q;
								r = hue2rgb(p, q, h + 1 / 3);
								g = hue2rgb(p, q, h);
								b = hue2rgb(p, q, h - 1 / 3);
							}
				
							return ({
								r: Math.round(r * 255),
								g: Math.round(g * 255),
								b: Math.round(b * 255),
							});
						}
					</script>
	            </div>
	            <div class="col-md-5">
	                <h2><%=prod.getTitle()%></h2>
	                <h4 class="muted"><%=prod.getProductName() %></h4>
	                <p><%=prod.getProductDescription() %></p>
	                <hr>
	                <h3>Price - $<%=prod.getPrice()%></h3>
	                <h3>Choose Color</h3>
	                <!-- Color Picker | Load color pallete from DB -->
	                <select id = "colorPicker" name="colorpicker-shortlist" onchange="return changeColor(this.value)">
	                
	                	<%
	                	
	                	for(String i:colorMap.keySet()){ %>
					 	 	<option value="<%=i%>"></option>
					 	 <%} %>
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
	                <p class="pull-left">Copyright © 2015 SJSU Students Web UI Development</p>
	                <p class="pull-right"><a href="locations.jsp">Search Store</a></p>
	            </div>
	        </div>
	    </div>
	    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.js"></script>

	    
	</body>
</html>