 $(document).ready(function(){

  $('#projectMembersList').on("click", "#add-member", function(){
    $("#add-member-form").removeClass("hide-form");
    $("#add-skill-form").addClass("hide-form");
  });

  $("#add-member-button").on("click", function(){
    $.ajax({
        type: "GET",
        url: "/projects/"+ $('#add-member-form').data('id')+'/members/new',
        data: $('#add-member-form').serialize(),
        success: function(data){
          console.log(data);

            $('#projectMembersList').find('.collection-item').remove();
            members=data.members;
            console.log(members);
            members.forEach(function(member) {
              availability = member.availability ? "Available" : "Unavailable";
              console.log(member);
              $("#projectMembersList").append(
              '<li class="collection-item avatar">'+
                '<div class="row">'+
                   '<div class="col s10">'+
                    '<img src="'+ member.avatar.url +'" alt="" class="circle">'+
                     '<span class="title">'+ member.name + '</span>'+
                     '<p>' + member.email + '<br>'+ 
                      '<div class="member-'+ availability.toLowerCase() + '">' +
                         availability+
                         '<div class="availability-circle"></div>'+
                      '</div>'+
                     '</p>'+ 
                   '</div>'+
                   '<div class="col s2">'+
                     '<a class="secondary-content right" rel="nofollow" data-method="delete" href="/projects/'+
                     data.project.id+'/members/' + member.id + '"><i class="fa fa-times"></i></a>'+ 
                   '</div>'+      
                 '</div>'+                  
              '</li>' );  
            });

            $('#membersList input:checked').parent().remove();

            $("#skills-div").removeClass("open");
            $("#members-div").removeClass("open");
            $("#add-member-form").addClass("hide-form");
            $("#add-skill-member").addClass("hidden");


      }
    });
  });
});