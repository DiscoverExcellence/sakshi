// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree
//= require jquery_nested_form

window.setTimeout(function(){
document.getElementsByClassName("flash")[0].style.display="none"},3000)

$(function(){
  return $(document).on('click', '.delete_link', function() {
    var _href = $('#delete_modal_link').attr("href");
    $('#delete_modal_link').attr("href", _href + "/" + $(this).data('id')); 
  });
});

