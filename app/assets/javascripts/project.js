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
  
  $("#create-project").on("click", function(){
    $('#secondary-form form').submit();
    /*$.ajax({
      type: "PUT",
      url: '/projects/' + data.project.id + '/update_members'});*/
  });
  
});