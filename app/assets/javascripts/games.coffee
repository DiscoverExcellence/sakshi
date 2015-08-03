# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.delete_link').click ->
    console.log($(this).data 'id')
    $('#delete_modal_link').attr("href","/games/"+$(this).data 'id')
    return
   return


#    $('document').ready ->
#      $('.delete-game').click ->
#          console.log($(this).data('game-id'))
#              $('#delete_game_link').attr("href","/games/"+$(this).data('game-id'))
#                  return
#                    return

