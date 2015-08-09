$(document).ready(function(){

  $("#show-form, #refresh-form").on("click", function(e){
    e.preventDefault();

   $.ajax({
      type: "POST",
      url: "/projects",
      data: $('#main-form form').serialize(),
      success: function(data){
        console.log(data);
        $("#main-form").removeClass("offset-s3");
        $("#secondary-form").removeClass("hide-form");
        $("#main-form-button").removeClass("hide-form");
        $("#create-button").removeClass("hide-form");
        $("#show-form").addClass("hide-form");

        $('#membersList').html('');
        data.members.forEach(function(member) {
            $("#membersList").append(
              '<div class="col s12 m6 l4">' +
                '<input type="checkbox" value="' + member.id + '" name="project[member_ids][]" id="project_member_ids_' + member.id + '">' +
                '<label for="project_member_ids_' + member.id + '">' + member.name + '</label>' +
              '</div>');
        });

        $('#secondary-form form').attr({ 
          action: '/projects/' + data.project.id + '/update_members',
        });

        /*$('#secondary-form form').attr('action','/projects/' + data.project.id + '/update_members'});*/
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  });

  $('.modal-trigger').leanModal();

  $("#create-project").on("click", function(){
    $('#secondary-form form').submit();
  });

  $("#add-skill, #add-member").on("click", function(){
    $("#skills-div").addClass("box-left");
    $("#members-div").addClass("box-right");
    $("#add-skill-member").removeClass("hide-form").addClass("box-bottom");
  });

  $("#add-skill").on("click", function(){
    $("#add-skill-form").removeClass("hide-form");
  });

  $("#add-member").on("click", function(){
    $("#add-member-form").removeClass("hide-form");
  });

  $("#add-member-button").on("click", function(e){

    $.ajax({
        type: "GET",
        url: "/projects/"+ $('#add-member-form').data('id')+'/members/new',
        data: $('#add-member-form').serialize(),
        success: function(data){
          console.log(data);

          //$('#projectMembersList').html('');
            member=data.new_member;
            availability = member.availability ? "Available" : "Unavailable";
            console.log(member);
            $("#projectMembersList").append(
            '<li class="collection-item avatar">'+
              '<div class="row">'+
                 '<div class="col s10">'+
                  '<i class="fa fa-picture-o circle"></i>'+
                   '<span class="title">'+ member.name + '</span>'+
                   '<p>' + member.email + '<br>'+ availability +
                   '</p>'+ 
                 '</div>'+
                 '<div class="col s2">'+
                   '<a class="secondary-content right" rel="nofollow" data-method="delete" href="/projects/'+
                   data.project.id+'/members/' + member.id + '"><i class="fa fa-times"></i></a>'+ 
                 '</div>'+      
               '</div>'+                  
            '</li>' );  
      }
    });
  });
});