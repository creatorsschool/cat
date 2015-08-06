$(document).ready(function(){
  $("#sign-in-button").on("click", function(e){
  	console.log("yelp");
    e.preventDefault();
    $(".sign-form").toggleClass("sign-form-open");
  });
});



