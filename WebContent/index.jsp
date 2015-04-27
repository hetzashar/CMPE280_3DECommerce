<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		  <title>Bootstrap Case</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta name="generator" content="ArchimedesCMS from Artlogic - http://www.artlogic.net/" />
			<meta name="viewport" content="width = 320" />
			<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
			<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
		<style>	
		body {
				background:black;
				padding:0;
				margin:0;
				font-weight: bold;
				overflow:hidden;
			}
		.jumbotron {
			background-image:url("images/2.jpg");
			width:100%;
			min-height:100px;
		}
		#sphere-area { height: 350px; position: relative; width: 100%; }
		#sphere-area img { width: 500px; height: 500px; position: absolute; top: 50px; left: 250px; }
		#sphere-area #mtee { opacity: 0; }
		#sphere-area #dress { opacity: 0; }
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
		
		<script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js'></script>
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
        <a href="./index.html"><img src="images/img1.png" style="height: 60px; margin-top: 10px;"></a> 	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
  		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    </div>

		
      <ul class="nav navbar-nav nav-tab">
        <li class="active"><a href="#">Home</a></li>
		<li class="active"><a href="#">About</a></li>
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Male <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1</a></li>
            <li><a href="#">Page 2</a></li>
          </ul>
        </li>
         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Female <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1</a></li>
            <li><a href="#">Page 2</a></li>
          </ul>
        </li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
	 
    </div>
	
  
</nav>
  <br>
  

 
  


	
  
   <div id="main-content" style="position: relative; z-index: 1; left: 0; top: 0">	
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
		
		
		
		 var material = new THREE.MeshLambertMaterial({
			
			map: THREE.ImageUtils.loadTexture('images/download.jpg')
		});
		
		var geometry = new THREE.BoxGeometry( 100, 100, 100 );

		group = new THREE.Group();

		for ( var i = 0; i < 200; i ++ ) {

			var mesh = new THREE.Mesh( geometry, material );
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
		
		<div class="jumbotron" id="jumbo" style="position: absolute; z-index: 2">
			<center>
			<h1>ALFIE</h1>      
			<p>Get Ready!</p>      
			<a href="#" class="btn btn-info btn-lg" id="button"data-toggle="modal" data-target="#myModal">Launch</a>
			<audio id="player" preload>
								<source src="music/music.wav" type="audio/wav">
									Your browser does not support the audio element.
								</audio>
			</center>
   
  
 

 
<script>
			
			$(document).ready(function() {
				var playing = false;
			$('a[href="#"]').click(function() {
				
				$("#myModal").show();
				$("#sphere-area").show();
				if (playing == false) {
				document.getElementById('player').play();
				playing = true;
				

			} 	else {
				document.getElementById('player').pause();
				playing = false;
				
      }

				
			});
			$(window).load(function() {


    function startBallOne() {
        $("#ftee").circulate({
            speed: 4000,
            height: 100,
            width: -400,
            sizeAdjustment: 40,
            loop: true,
            zIndexValues: [1, 1, 3, 3]
        });
    }
    
    function startBallTwo() {
        $("#mtee").circulate({
            speed: 4000,
            height: 120,
            width: -400,
            sizeAdjustment: 35,
            loop: true,
            zIndexValues: [2, 2, 2, 2]
        })
    }
    
    function startBallThree() {
        $("#dress").circulate({
            speed: 4000,
            height: 140,
            width: -400,
            sizeAdjustment: 30,
            loop: true,
            zIndexValues: [3, 3, 1, 1]
        }).fadeIn();
    }
            
    startBallOne();
    setTimeout(startBallTwo, 2000);
    setTimeout(startBallThree, 4000);
    
});
				
				
			
				

					
			});
						
		
		</script> 
</div>
</div>		
  
 <div id="myModal" class="modal fade">
  						<div class="modal-dialog">
  							<div class="modal-content">
								
  								<div class="modal-header">
  									<button type="button" id="modalButton" class="close" data-dismiss="modal" aria-hidden="true">×</button>
  									<script>
										 $(document).ready(function() {	
										  var playing = true;

											$('#modalButton').click(function() {
											

											if (playing == true) {
											document.getElementById('player').pause();
											  playing = false;
											 

										  } 

									  });
									});
									</script>
  								</div>
  								<div class="modal-body">
									<div id="sphere-area">
									<center>
									<img src="images/ftee.jpg" alt="ball" id="ftee" />
									<img src="images/mtee.jpg" id="mtee" alt="" />
									<img src="images/dress.jpg" id="dress" alt="" />
									</center>
									</div>
  								</div>
  								
  							</div>
  						</div>
  					</div>
	
	
</div>
				



</div>
	</body>
</html>