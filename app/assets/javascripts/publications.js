$(document).ready(function(){
  $('a#add-author').on('click', function() {
    $.get('/publications/new', function(data) {
//      alert(data);
      $(data).appendTo('#authors');
//      $('#authors').append(data);
      return false;
    });
  });
});

//$(document).ready(ready);
//$(document).on('page:load', ready);
