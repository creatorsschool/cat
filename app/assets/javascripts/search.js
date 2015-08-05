$(function() {
  $("#search-error").html('');

  $('#search-form').on('submit', function(event) {
    event.preventDefault();

    input = $('#search-form input#name').val();

    $.ajax("/members/search?name=" + input, {
      success: function(data) {
        console.log(data);
        $('#membersList').html('');
        data.forEach(function(member) {
          $('#membersList').append(
            '<div class="col s4 card">' +
              '<i class="fa fa-picture-o circle"></i>' +
               '<span class="name">Name:'+ member.name + '</span>' +
               '<p><span class="email">E-mail:' + member.email + '</span><br>' +
               (member.availability ? "Available" : "Unavailable") + '</p>' +
               '<span class="working_hours">Working Hours:' + member.working_hours + '</span>' +
               '<div id="skillsList">' + memberSkills(member) +'</div>' +
             '</div>'
          );
        });

        function memberSkills(member) {
          str = "Skills:";
          member.skills.forEach(function(skill) {
            str += '<p>' + skill.name + '</p>';
          });
          return str;
        }
      },
      error: function(data) {
        $("#search-error").html(data.responseText);
      }
    });
  });
});

// $(function() {

//   $('#search_form input').on('keyup', function(event) {
//     event.preventDefault();

//     input = $('#search_form input').val();

//     $.ajax("/search?search=" + input, {
//       success: function(data) {
//         $('#postsList').html('');

//         data.forEach(function(post) {
//           $('#postsList').append('<li>' + post.title + '</li>')
//         });
//       }
//     });
//   });

// });