$(function(){
  $.ajax({
      method: "GET",
      url: $(location).attr('pathname'),
      dataType: 'json'
    })
    .done(function( data ) {
      var string = $('#items').html();
      var template = Handlebars.compile(string);
      $('#container').append(template(data));
      $('.item').on('click', function(event){
        event.preventDefault();
        $.ajax({
            method: "GET",
            url: 'api/items/' + $(this).data('id'),
            dataType: 'json'
          })
          .done(function( data ) {
            var string = $('#item_show').html();
            var template = Handlebars.compile(string);
            $('#show').append(template(data));
        })
      })
    });
})
