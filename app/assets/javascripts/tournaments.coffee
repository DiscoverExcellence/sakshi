# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$ ->
#  $(document).on 'click', '.delete_tmnt_link',->
#    game = $(this).data('id')
#    tmnt = $(this).data('id2')
#    console.log("href","/games/"+ game + "/tournaments/" + tmnt)
#    $('#delete_modaltmnt_link').attr("href","/games/"+ game + "/tournaments/" + tmnt)
#    return

$ ->
  $('#add_another').click ->
   $('#add_more').nestedAttributes bindAddTo: $('#add_another')
