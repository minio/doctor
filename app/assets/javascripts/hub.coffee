# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change', ->
  #-----------------------
  # Dropdown Menu
  #-----------------------

  # Open
  $('body').on 'click', '.dropdown__toggle', (e) ->
    e.preventDefault()
    $('body').append '<div class="backdrop backdrop--dropdown" />'
    $(this).closest('.dropdown').addClass 'dropdown--open'
    return

  # Close
  $('body').on 'click', '.backdrop--dropdown', (e) ->
    e.preventDefault()
    $(this).remove()
    $('.dropdown--open').removeClass 'dropdown--open'
    return



  #-----------------------
  # Image Preview
  #-----------------------
  #Close function
  closeImgPreview = ->
    $closeTarget = $('.img-preview')
    $closeTarget.fadeOut 200
    setTimeout (->
      $closeTarget.remove()
      return
    ), 250
    return

  # Open
  $('body').on 'click', '*:not("a") > img:not(".img-preview__img")', ->
    $imgSrc = $(this).attr('src')
    $imgWrap =  '<div class="img-preview">' +
                  '<div class="img-preview__close img-preview__close--back"></div>' +
                  '<i class="img-preview__close img-preview__close--icon fa fa-close"></i>' +
                  '<img class="img-preview__img" src=' + $imgSrc + ' alt="">' +
                '</div>'
    $('body').append $imgWrap
    return

  # Close on icon/back click
  $('body').on 'click', '.img-preview__close', ->
    closeImgPreview()
    return

  # Close on ESC key
  $(document).keyup (e) ->
    if $('.img-preview')[0]
      if e.keyCode == 27
        closeImgPreview()
    return

  return