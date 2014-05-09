# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "ready event:change", ->
  $('.adoption_store .entry > img').click ->
    $(this).parent().find( 'input[name="Consider"]').click()

