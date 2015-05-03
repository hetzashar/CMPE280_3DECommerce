<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	media="screen">
<!-- 	<link href="bootstrap/css/bootstrap-switch.min.css" rel="stylesheet"> -->
<!-- 	<link href="bootstrap/css/bootstrap.min.css" > -->
<!-- 	<link href="bootstrap/css/bootstrap-datepicker3.min.css" /> -->
<!-- 	<link href="bootstrap/css/common.css" rel="stylesheet"> -->
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/stylee.css">
	<link rel="stylesheet" href="css/normalize.css">
	
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">	
<!-- 	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> -->
<!--         <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> -->
  
<title></title>
</head>
<body>

	
	
    <div class="containerr">
<section id="content">
		<form role="form"  id = "myform" action="RegisterServlet" method="POST"  onsubmit="return checkForm(this);">
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h1>&nbsp;&nbsp;&nbsp;&nbsp;Register</h1>
    
	<div >
        <input path="username"  id="username" type="text" name="username" value=""  required="required"  placeholder="Enter username">
    </div>
    <div >
        <input path="fname" id="fname" type="text" name="fname" value=""  required="required" placeholder="Enter First Name"
        pattern="^[a-zA-Z ,.'-]+$">
    </div>
    <div >
        <input path="lname" id="lname" type="text" name="lname" value="" required="required"  placeholder="Enter Last Name"
        pattern="^[a-zA-Z ,.'-]+$">
    </div>
    <div >
        <input path="email" id="email" type="email" name="email" value=""  required="required" 
        placeholder="Enter email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$">
    </div>
    <div>
        <input path="password" id="password" type="password" name="password"
                placeholder="Enter Password" pattern="^\S{6,}$" title="At least one number, one lowercase and one uppercase letter. Minimum 4 characters" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;"">
    </div>
    <div>
    	 <input id="validate_password" type="password" name="vpassword" placeholder="Enter Password again" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" required="required">
    </div>
    <div>
		<input type="submit" value="Sign Up"  />
	</div>
  </form>    
  </section>
 </div>
 <script>
// just for the demos, avoids form submit
jQuery.validator.setDefaults({
  debug: true,
  success: "valid"
});
$( "#myform" ).validate({
  rules: {
    password: "required",
    validate_password: {
      equalTo: "#password"
    }
  }
});
</script>
</body>



<script type="text/javascript" src="js/script.js"></script>
 <script src="http://code.jquery.com/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap-switch.js"></script>
<script src="${validatePassword}/js/script.js"></script>

</html>