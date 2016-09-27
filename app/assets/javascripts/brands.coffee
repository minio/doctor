# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require jquery-mask/jquery.mask.min

$(document).on 'page:change', ->

  #-----------------------------
  # Color Picker
  #-----------------------------
  if $('.form-group__field--color')[0]
    $('.form-group__field--color').minicolors()

    ## Validation(mask)
    $('.form-group__field--color').mask 'ASSSSSS', 'translation':
      A: pattern: /['#']/
      S: pattern: /[A-Za-z0-9]/

