
 $(document).ready(function(){

  $("#add-skill").on("click", function(){
    $("#add-skill-form").removeClass("hide-form");
    $("#add-member-form").addClass("hide-form");
  });


  $("#add-skill-button").on("click", function(e){

    $.ajax({
        type: "GET",
        url: "/projects/"+ $('#add-skill-form').data('id')+'/skills/new',
        data: $('#add-skill-form').serialize(),
        success: function(data){
            $('#projectskillsList').find('.collection-item').remove();
            skills=data.skills;
            skills.forEach(function(skill) {
              console.log(skill);
              $("#projectskillsList").append(
              '<li class="collection-item">'+
                '<div>'+
                 skill.name +
                 '<a class="secondary-content" rel="nofollow" data-method="delete" href="/projects/'+
                 data.project.id+'/skills/' + skill.id + '"><i class="fa fa-times"></i></a>'+ 
               '</div>'+                    
              '</li>' );  
            });

            $('#skillsList input:checked').parent().remove();

            $("#skills-div").removeClass("open");
            $("#members-div").removeClass("open");
            $("#add-skill-form").addClass("hide-form");
            $("#add-skill-member").addClass("hidden");
      }
    });
  });
});