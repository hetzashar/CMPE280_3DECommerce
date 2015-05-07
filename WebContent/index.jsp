<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.fashion3d.beans.Users"%>
<%@page import="com.fashion3d.beans.ShoppingCart"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion3d.beans.Products"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.fashion3d.db.ConnectionPool"%>
<html>
<head lang="en">
<title>3D Fashionista</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="chrome=1">
<meta name="description" content="RGB Indexing of merchandise">
<meta name="author" content="CMPE280 Team 03">
<meta name="alfie content='10 days'">
<meta name="distribution" content="web">
<meta http-equiv="refresh" content="30">
<meta name="keywords" content="html fashion,tshirt,jeans,shirt,shoes,3D" />
<meta name="generator" content="ArchimedesCMS from Artlogic - http://www.artlogic.net/" />
<meta name="viewport" content="width = 320" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link
	href='http://fonts.googleapis.com/css?family=Dancing+Script:400,700'
	rel='stylesheet' type='text/css'>
<script src="http://code.createjs.com/createjs-2013.05.14.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$('ul.nav li.dropdown').hover(function() {
	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
	}, function() {
	  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
	});
</script>
<style>
body {
	background: black;
	padding: 0;
	margin: 0;
	font-weight: bold;
	overflow: hidden;
}

#sphere-area {
	height: 350px;
	position: relative;
	width: 100%;
}

canvas {
  position: absolute;
  top: 0;
  left: 0;
}

#sphere-area img {
	width: 500px;
	height: 500px;
	position: absolute;
	top: 50px;
	left: 250px;
}

#sphere-area #mtee {
	opacity: 0;
}

#sphere-area #dress {
	opacity: 0;
}

.modal-dialog {
	width: 100%;
	height: 100%;
	padding: 0;
}

.modal-content {
	height: 100%;
	border-radius: 0;
}
</style>

<script type='text/javascript'
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js'></script>
<script type='text/javascript' src='js/jquery.easing.1.2.js'></script>
<script type='text/javascript' src='js/jquery.circulate.js'></script>
<script type='text/javascript' src='js/example.js'></script>
<script>
			$(document).ready(function() { 
					$("#sphere-area").hide();
			});
				
		</script>

</head>
<body>
	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="./index.html"
					style="font-family: Dancing Script, cursive; font-size: 32px">Alfie</a>
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
	<br>

	<div>
	
		<script src="js/build/three.min.js"></script>

		<script src="js/renderers/Projector.js"></script>
		<script src="js/renderers/CanvasRenderer.js"></script>

		<script src="js/libs/stats.min.js"></script>
		<script>
			
			var container, stats;

			var camera, scene, renderer;

			var geometry, group;

			var mouseX = 0, mouseY = 0;

			var windowHalfX = window.innerWidth / 2;
			var windowHalfY = window.innerHeight / 2;

			document.addEventListener( 'mousemove', onDocumentMouseMove, false );

			init();
			animate();

			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );

				camera = new THREE.PerspectiveCamera( 60, window.innerWidth / window.innerHeight, 1, 10000 );
				camera.position.z = 500;

				scene = new THREE.Scene();
				
				
				
			
					
				
				
				var geometry = new THREE.BoxGeometry(180,180,180,1,1,1);

				var material= [];
				for(i=0;i<250;i++){
			    var randomNumber = Math.floor(Math.random() * (7 - 1)) + 1;
			    //var toCall = 'cubeMaterials' + randomNumber;
			    //console.log(toCall)
			    if(randomNumber == 1){
			    	var cubeMaterials =      [ 
			    						    
						                    new THREE.MeshBasicMaterial({color:0x00ff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
						                    new THREE.MeshBasicMaterial({color:0x0000ff, transparent:true, opacity:0, side: THREE.DoubleSide}),
						                    new THREE.MeshBasicMaterial({color:0xffff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
						                    new THREE.MeshBasicMaterial({color:0xff00ff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
						                    new THREE.MeshBasicMaterial({color:0x00ffff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
						                    new THREE.MeshLambertMaterial({map: THREE.ImageUtils.loadTexture('images/firstever-2.png')}),
						                     ]
			    }
			    	else if(randomNumber == 2){
					var cubeMaterials = 		[ 
											    
							                    new THREE.MeshBasicMaterial({color:0x00ff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
							                    new THREE.MeshBasicMaterial({color:0x0000ff, transparent:true, opacity:0, side: THREE.DoubleSide}),
							                    new THREE.MeshBasicMaterial({color:0xffff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
							                    new THREE.MeshBasicMaterial({color:0xff00ff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
							                    new THREE.MeshBasicMaterial({color:0x00ffff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
							                    new THREE.MeshLambertMaterial({map: THREE.ImageUtils.loadTexture('images/firstever-3.png')}),
							                    ]
			    		
			    	}
			    
			    	else if(randomNumber == 3){
						var cubeMaterials = 		[ 
												    
								                    new THREE.MeshBasicMaterial({color:0x00ff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x0000ff, transparent:true, opacity:0, side: THREE.DoubleSide}),
								                    new THREE.MeshBasicMaterial({color:0xffff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0xff00ff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x00ffff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshLambertMaterial({map: THREE.ImageUtils.loadTexture('images/firstever.png')}),
								                    ]
				    		
				    	}
			    
			    	else if(randomNumber == 4){
						var cubeMaterials = 		[ 
												    
								                    new THREE.MeshBasicMaterial({color:0x00ff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x0000ff, transparent:true, opacity:0, side: THREE.DoubleSide}),
								                    new THREE.MeshBasicMaterial({color:0xffff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0xff00ff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x00ffff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshLambertMaterial({map: THREE.ImageUtils.loadTexture('images/firstever-1.png')}),
								                    ]
				    		
				    	}
			    
			    	else if(randomNumber == 5){
						var cubeMaterials = 		[ 
												    
								                    new THREE.MeshBasicMaterial({color:0x00ff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x0000ff, transparent:true, opacity:0, side: THREE.DoubleSide}),
								                    new THREE.MeshBasicMaterial({color:0xffff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0xff00ff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x00ffff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshLambertMaterial({map: THREE.ImageUtils.loadTexture('images/firstever-4.png')}),
								                    ]
				    		
				    	}
			    
			    	else if(randomNumber == 6){
						var cubeMaterials = 		[ 
												    
								                    new THREE.MeshBasicMaterial({color:0x00ff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x0000ff, transparent:true, opacity:0, side: THREE.DoubleSide}),
								                    new THREE.MeshBasicMaterial({color:0xffff00, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0xff00ff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshBasicMaterial({color:0x00ffff, transparent:true, opacity:0, side: THREE.DoubleSide}), 
								                    new THREE.MeshLambertMaterial({map: THREE.ImageUtils.loadTexture('images/firstever-5.png')}),
								                    ]
				    		
				    	}
			    
				material[i] = new THREE.MeshFaceMaterial(cubeMaterials);
				}
				
				
				
				group = new THREE.Group();

				for ( var i = 0; i < 250; i ++ ) {

					var mesh = new THREE.Mesh( geometry, material[i] );
					mesh.position.x = Math.random() * 2000 - 1000;
					mesh.position.y = Math.random() * 2000 - 1000;
					mesh.position.z = Math.random() * 2000 - 1000;
					mesh.rotation.x = Math.random() * 2 * Math.PI;
					mesh.rotation.y = Math.random() * 2 * Math.PI;
					mesh.matrixAutoUpdate = false;
					mesh.updateMatrix();
					group.add( mesh );

				}
				
				

				scene.add( group );

				renderer = new THREE.CanvasRenderer();
				renderer.setClearColor( 0xff0000 );
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );

				stats = new Stats();
				stats.domElement.style.position = 'absolute';
				stats.domElement.style.top = '0px';
				stats.domElement.style.zIndex = 100;
				container.appendChild( stats.domElement );

				//

				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onWindowResize() {

				windowHalfX = window.innerWidth / 2;
				windowHalfY = window.innerHeight / 2;

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			function onDocumentMouseMove(event) {

				mouseX = ( event.clientX - windowHalfX ) * 10;
				mouseY = ( event.clientY - windowHalfY ) * 10;

			}

			//

			function animate() {

				requestAnimationFrame( animate );

				render();
				stats.update();

			}
			 // Load the background texture
        var texture = THREE.ImageUtils.loadTexture( 'images/wallpaper.jpg' );
        var backgroundMesh = new THREE.Mesh(
            new THREE.PlaneGeometry(2, 2, 0),
            new THREE.MeshBasicMaterial({
                map: texture
            }));

        backgroundMesh .material.depthTest = false;
        backgroundMesh .material.depthWrite = false;

        // Create your background scene
        var backgroundScene = new THREE.Scene();
        var backgroundCamera = new THREE.Camera();
        backgroundScene .add(backgroundCamera );
        backgroundScene .add(backgroundMesh );

			function render() {

				camera.position.x += ( mouseX - camera.position.x ) * .05;
				camera.position.y += ( - mouseY - camera.position.y ) * .05;
				camera.lookAt( scene.position );

				var currentSeconds = Date.now();
				group.rotation.x = Math.sin( currentSeconds * 0.0007 ) * 0.5;
				group.rotation.y = Math.sin( currentSeconds * 0.0003 ) * 0.5;
				group.rotation.z = Math.sin( currentSeconds * 0.0002 ) * 0.5;

			
				renderer.autoClear = false;
            renderer.clear();
            renderer.render(backgroundScene , backgroundCamera );
            renderer.render(scene, camera);

			}

		</script>


			
			

	</div>

	
	<%
		PreparedStatement pst = null;
		List<Products> menList = new ArrayList<Products>();
		List<Products> womenList = new ArrayList<Products>();
		ResultSet rs = null;
		Connection conn = null;
		Products bean = new Products();

		try {
			conn = ConnectionPool.getConnectionFromPool();

			pst = conn.prepareStatement("SELECT * FROM PRODUCTS");
			rs = pst.executeQuery();

			while (rs.next()) {
				String category=rs.getString("CATEGORY");
				bean = new Products();
				bean.setProductId(rs.getInt("PRODUCT_ID"));
				bean.setCategory(category);
				bean.setProductName(rs.getString("PRODUCT_NAME"));
				bean.setProductCount(rs.getInt("PRODUCT_COUNT"));
				bean.setBuyersCount(rs.getInt("BUYERS_COUNT"));
				bean.setTnImagePath(rs.getString("TN_IMAGE_PATH"));
				bean.setInitialColor(rs.getString("INITIAL_COLOR"));
				bean.setAddedBy(rs.getInt("ADDED_BY"));
				bean.setProductDescription(rs.getString("PRODUCT_DESCRIPTION"));
				bean.setPrice(rs.getFloat("PRICE"));
				bean.setImagePath(rs.getString("BIG_IMAGE_PATH"));
				bean.setTitle(rs.getString("TITLE"));
				if(category.equals("MEN")){
					menList.add(bean);					
				}else{
					womenList.add(bean);
				}
			}
			session.setAttribute("menList", menList);
			session.setAttribute("womenList", womenList);
			

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				ConnectionPool.addConnectionBackToPool(conn);
			}
			if (pst != null) {
				pst.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
	%>
	<footer class="row-fluid">
		      <div class="span3">
		        <h4 class="line3 center standart-h4title"><span>Navigation</span></h4>
		        <ul class="footer-links">
		          <li><a href="contactus.jsp">Contact Us</a></li>
		          <li><a href="neareststore.jsp">Nearest Store</a></li>
		        </ul>
		      </div>
		  
		<div class="span12">
			<hr>
		        <p>3D Fashionista Developed by SJSU Students</p>
		</div>
			  
		</footer>
		<script src="js/stars.js"></script>
		<script src='js/3dClick.js'></script>
		<script>
		mesh.on('click', function(){
		    console.log('clicked');
		});
		</script>
		
</body>
</html>