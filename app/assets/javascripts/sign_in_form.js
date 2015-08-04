$(document).ready(function(){
  $("#sign-in-button").on("click", function(e){
    e.preventDefault();
    $(".sign-form").toggleClass("sign-form-open");
  });
});



