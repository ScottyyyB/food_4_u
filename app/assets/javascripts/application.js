//=require jquery
//=require gmaps
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  var scrollLink = $('.scroll');

  scrollLink.click(function(event) {
    event.preventDefault();
    $('body,html').animate({
      scrollTop: $(this.hash).offset().top
    }, 1500);
  });
  initiateMap()
});
