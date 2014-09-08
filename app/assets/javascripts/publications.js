$(document).ready(function(){
  $('a#add-author').on('click', function() {
    $.get('/publications/new', function(data) {
      alert(data);
      // $(data).appendTo('#authors');
      // $(data).appendTo('#kkk');
      $('#kkk').append(data);
    //  $(data).insertAfter('#kkk');
    //  $('#authors').append(data).find('div#authors').remove;
      // return false;
    });
  });
});

//$(document).ready(ready);
//$(document).on('page:load', ready);
