# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
   $("#new_payment").on("ajax:complete", (e, data, status, xhr) ->
   	$("#notice").append "<p>Payment Complete!</p>"
  	).on "ajax:error", (e, xhr, status, error) ->
    	$("#notice").append "<p>ERROR</p>"
