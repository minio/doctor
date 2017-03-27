# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:click', (event) ->
  if event.target.getAttribute('href').charAt(0) == '#'
    return event.preventDefault()
  return



$(document).on 'turbolinks:load', ->
  $body = $('body')

  #-----------------------
  # Syntax Highlighting
  #-----------------------
  $('pre code').each (i, block) ->
    hljs.highlightBlock block
    return


  #------------------------------
  # Scroll to sidebar link
  #------------------------------
  if $('.sidebar--scroll')[0]
    $pathname = window.location.pathname
    if $pathname != '/'
      $('.sidebar--scroll').scrollTop $('a[href="' + $pathname + '"]').offset().top


  #------------------------------
  # Search
  #------------------------------
  $body.on 'focus', '.search__input', () ->
    $('.header').addClass('header--toggled')

  $body.on 'blur', '.search__input', () ->
    $('.header').removeClass('header--toggled')

  if $('.search__input')[0]
    if gon.algoliatoken
      #Doc Search
      docsearch
        apiKey: gon.algoliatoken
        indexName: 'minio'
        inputSelector: '.search__input'
        appendTo: 'body'
        autoselect: true


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
  $body.on 'click', '.content *:not("a") > img:not(".img-preview__img")', ->
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
  # Toggle Sidebar
  #-----------------------------

  #Open
  $body.on 'click', '.top-menu__trigger, .actions__trigger', (e) ->
    e.preventDefault()
    $('.sidebar').toggleClass('sidebar--toggled')
    $body.toggleClass('sidebar-toggled');
    return

  #Close
  $body.on 'click', '.sidebar__close, .sidebar-backdrop', ->
    $body.removeClass 'sidebar-toggled'
    $('.sidebar').removeClass 'sidebar--toggled'
    return


  #-----------------------------
  # Notification Toggle
  #-----------------------------
  $('.notify').addClass('notify--show').delay(5000).queue ->
    $(this).removeClass('notify--show').dequeue()
    return


  #-----------------------------
  # Responsive Table
  #-----------------------------
  $('table').each ->
    if !$(this).parent().is('.table-responsive')
      $(this).wrap '<div class="table-responsive" />'
    return

  #-----------------------------
  # Tooltip
  #-----------------------------
  if $('[data-toggle="tooltip"]')[0]
    $('[data-toggle="tooltip"]').tooltip()


  #-----------------------------
  # Copy to clipboard
  #-----------------------------

  # Add 'Copy' button
  $('pre').each ->
    if $(this).find('.copy-to-clipboard').length == 0
      $(this).prepend '<span class="copy-to-clipboard">Copy</span>'

  # Initiate Clipboard.js
  clipboard = new Clipboard('.copy-to-clipboard', text: (trigger) ->
    trigger.nextElementSibling.innerText
  )

  clipboard.on 'success', (e) ->
    e.clearSelection()
    e.trigger.textContent = 'Copied to clipboard'
    setTimeout (->
      e.trigger.textContent = 'Copy'
      return
    ), 2000
    return

  return