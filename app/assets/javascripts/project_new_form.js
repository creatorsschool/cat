$(document).ready(function(){
  $("#show-form").on("click", function(e){
    //console.log(e);
    e.preventDefault();
    $(".member-select").removeClass("hide-form");
  });
});