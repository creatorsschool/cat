 $(document).ready(function(){

  $("#add-member").on("click", function(){
    $("#add-member-form").removeClass("hide-form");
  });

  $("#add-member-button").on("click", function(){
    $.ajax({
        type: "GET",
        url: "/projects/"+ $('#add-member-form').data('id')+'/members/new',
        data: $('#add-member-form').serialize(),
        success: function(data){
          console.log(data);

            $('#projectMembersList').html('');
            $("#projectMembersList").append(
                '<li class="collection-header">'+
                  '<h4>Members'+
                    '<a id="add-member" href="#">'+
                      '<i class="fa fa-plus-circle small icon-center right"></i>'+
                    '</a>'+
                  '</h4>'+
                '</li>'
              );
            members=data.members;
            console.log(members);
            members.forEach(function(member) {
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
            });
            $("#skills-div").removeClass("open");
            $("#members-div").removeClass("open");
            $("#add-member-form").addClass("hide-form");
            $("#add-skill-member").addClass("hidden");


      }
    });
  });
});