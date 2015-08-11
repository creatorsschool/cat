$(document).ready(function(){

  $("#skills-checkbox ").on("click", function(e){
   //e.preventDefault();

   $.ajax({
      type: "GET",
      url: "/projects/select_members",
      data: $('#main-form form').serialize(),
      success: function(data){
        console.log(data);
        $("#main-form").removeClass("offset-s3");
        $("#secondary-form").removeClass("hide-form");
        $("#create-button").removeClass("hide-form");

        $('#membersList').html('');
        data.members.forEach(function(member) {
            $("#membersList").append(
              '<div class="col s12 m6 l4">' +
                '<input type="checkbox" value="' + member.id + '" name="project[member_ids][]" id="project_member_ids_' + member.id + '">' +
                '<label for="project_member_ids_' + member.id + '">' + member.name + '</label>' +
              '</div>');
        });

        //$('#secondary-form form').attr({ 
        //  action: '/projects/' + data.project.id + '/update_members',
        //});

        /*$('#secondary-form form').attr('action','/projects/' + data.project.id + '/update_members'});*/
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  });

  

  $('.modal-trigger').leanModal();

  $("#add-skill,#add-member").on("click", function(e){
    e.preventDefault();
    $("#skills-div").addClass("open");
    $("#members-div").addClass("open");
    $("#add-skill-member").removeClass("hidden");
  });

  $('html').on('click',function(e){
    if (!$.contains($('.row.boxes')[0],e.target)){
      console.log('qqq');
      $("#skills-div").removeClass("open");
      $("#members-div").removeClass("open");
      $("#add-skill-member").addClass("hidden");
    }
  });

  $("#search-button").on("click",function(){
    $("#search-input").toggleClass("hide-form");
  });

  $('#search-input input').on('keyup', function(event) {
    event.preventDefault();

    $.ajax({
      url: "/projects/search",
      data: $('#search-input input').serialize(),
      success: function(data) {
        
        $('#projectsList').html('');
        data.projects.forEach(function(project) {
          $('#projectsList').append(
            '<li class="collection-item">'+
                '<div>'+
                 project.name +
                 '<a class="secondary-content" rel="nofollow" data-method="delete" href="/projects/'+
                 project.id + '"><i class="fa fa-times"></i></a>'+ 
                 '<a class="secondary-content" href="/projects/'+ project.id + '">'+
               '</div>'+                    
              '</li>' );  
        });
      }
    });
  });

});