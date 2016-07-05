# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Dropdown Menu
$(document).ready ->
  $('body').on 'click', '.dropdown__toggle', (e) ->
    e.preventDefault()
    $('body').append '<div class="backdrop backdrop--dropdown" />'
    $(this).closest('.dropdown').addClass 'dropdown--open'
    return

  #Close
  $('body').on 'click', '.backdrop--dropdown', (e) ->
    e.preventDefault()
    $(this).remove()
    $('.dropdown--open').removeClass 'dropdown--open'
    return
  return