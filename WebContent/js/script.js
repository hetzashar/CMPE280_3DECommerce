( function( $ ) {
$( document ).ready(function() {
$('#cssmenu').prepend('<div id="bg-one"></div><div id="bg-two"></div><div id="bg-three"></div><div id="bg-four"></div>');
});
var password = document.getElementById("password")
, validate_password = document.getElementById("validate_password");

function validatePassword(){
if(password.value != validate_password.value) {
  validate_password.setCustomValidity("Passwords Don't Match");
} else {
  confirm_password.setCustomValidity('');
}
}

password.onchange = validatePassword;
validate_password.onkeyup = validatePassword;
} )( jQuery );
