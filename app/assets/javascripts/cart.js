$(function(){
  $.ajax({
    method: "GET",
    url: $(location).attr('pathname'),
    dataType: 'json'
  })
  .done(function( data ) {
    var string = $('#cart').html();
    var template = Handlebars.compile(string);
    $('#container').append(template(data));
  });

  $('.add_to_cart').on('ajax:success', function(event, data, status, xhr){
   if(data.error){

     data.error.name.forEach(function(e){
       $('body').prepend(e);
     })
   }else{
     $('#container').empty();
     var string = $('#cart').html();
     var template = Handlebars.compile(string);
     var compiled_template = template(data);
     $('#container').append(compiled_template);
    }
  })
})
