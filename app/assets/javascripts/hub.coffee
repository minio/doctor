# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#-----------------------
# Syntax Highlighting
#-----------------------
$(document).on 'ready page:load', ->
  $('pre code').each (i, block) ->
    hljs.highlightBlock block
    return
  return


$(document).on 'page:change', ->
  $body = $('body')

  #------------------------------
  # Scroll to sidebar link
  #------------------------------
  $pathname = window.location.pathname
  $('.main__sidebar').scrollTop $('a[href="' + $pathname + '"]').offset().top - 82 #82 is the height(px) of header


  #-----------------------
  # Dropdown Menu
  #-----------------------

  # Open
  $body.on 'click', '.dropdown__toggle', (e) ->
    e.preventDefault()
    $(this).parent().append '<div class="backdrop backdrop--dropdown" />'
    $(this)
      .closest('.dropdown')
      .addClass 'dropdown--open'
    return

  # Close
  $body.on 'click', '.backdrop--dropdown', (e) ->
    e.preventDefault()
    $(this).remove()
    $('.dropdown--open').removeClass 'dropdown--open'
    return



  #-----------------------
  # Image Preview
  #-----------------------
  # Close function
  closeImgPreview = ->
    $closeTarget = $('.img-preview')
    $closeTarget.fadeOut 200

    callBack = -> $closeTarget.remove()
    setTimeout callBack, 250
    return

  # Open
  $body.on 'click', '*:not("a") > img:not(".img-preview__img")', ->
    $imgSrc = $(this).attr('src')
    $imgWrap =  '<div class="img-preview">' +
                  '<div class="img-preview__close img-preview__close--back"></div>' +
                  '<i class="img-preview__close img-preview__close--icon fa fa-close"></i>' +
                  '<img class="img-preview__img" src=' + $imgSrc + ' alt="">' +
                '</div>'
    $body.append $imgWrap
    return

  # Close on icon/back click
  $body.on 'click', '.img-preview__close', ->
    closeImgPreview()
    return

  # Close on ESC key
  $(document).keyup (e) ->
    if $('.img-preview')[0]
      if e.keyCode == 27
        closeImgPreview()
    return



  #-----------------------------
  # Page loading indicator
  #-----------------------------
  $(document).one 'page:fetch', ->
    $loader = '<div class="page-loader"><i /></div>'
    $('.main__page').prepend $loader
    return

  $(document).one 'page:receive', ->
    $('.page-loader').remove()
    return



  #-----------------------------
  # Mobile Sidebar
  #-----------------------------

  #Open
  $body.on 'click', '.header__trigger', ->
    $sidebarBckdrop =   '<div class="backdrop backdrop--sidebar" />'

    $body
      .addClass('prevent-scroll')
      .append $sidebarBckdrop
    $('.main__sidebar').addClass 'toggled'
    return

  #Close
  $body.on 'click', '.backdrop--sidebar', ->
    $body.removeClass 'prevent-scroll'
    $(this).remove()
    $('.main__sidebar').removeClass 'toggled'
    return



  #-----------------------------
  # Header Affix
  #-----------------------------
  $('.main__sidebar').affix offset: top: 82 #header height


  #-----------------------------
  # Notification Toggle
  #-----------------------------
  $('.notify').addClass('notify--show').delay(5000).queue ->
    $(this).removeClass('notify--show').dequeue()
    return

  return