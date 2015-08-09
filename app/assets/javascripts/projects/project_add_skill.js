
 $(document).ready(function(){

  $("#add-skill").on("click", function(){
    $("#add-skill-form").removeClass("hide-form");
  });


  $("#add-skill-button").on("click", function(e){

    $.ajax({
        type: "GET",
        url: "/projects/"+ $('#add-skill-form').data('id')+'/skills/new',
        data: $('#add-skill-form').serialize(),
        success: function(data){
          console.log(data);

          //$('#projectskillsList').html('');
            skill=data.new_skill;
            availability = skill.availability ? "Available" : "Unavailable";
            console.log(skill);
            $("#projectskillsList").append(
            '<li class="collection-item">'+
              '<div>'+
               skill.name +
               '<a class="secondary-content" rel="nofollow" data-method="delete" href="/projects/'+
               data.project.id+'/skills/' + skill.id + '"><i class="fa fa-times"></i></a>'+ 
             '</div>'+                    
            '</li>' );  
      }
    });
  });
});