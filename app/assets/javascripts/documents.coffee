# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
updateTips = (t) ->
  $(".validateTips").text(t).addClass 'ui-state-highlight'
  setTimeout (->
    $(".validateTips").removeClass 'ui-state-highlight', 1500
  ), 500

$(document).on 'ready page:change', ->
  newDocForm = $('.new-doc').find('form')
  newDocForm.submit (e) ->
    e.preventDefault()
    docName = newDocForm.find('#document_name').val()
    $.get('/document/check_name',
      name: docName
      cat_id: $('#document_category_id').val()).success (data) ->
      if data.show_dialog
        categorySeoName = $('#document_category_id option:selected').text().replace(/\s+/g, '-').toLowerCase()
        docSeoName = docName.replace(/\s+/g, '-').toLowerCase()
        $('#slug-name').val(categorySeoName + '/' + docSeoName)
        $('#dialog-confirm').dialog('open')
      else
        newDocForm.unbind().submit()

$(document).on 'ready page:change', ->
  $('#dialog-confirm').dialog
    resizable: false
    height: 'auto'
    width: 400
    modal: true
    autoOpen: false
    buttons:
      'Continue': ->
        $.get('/document/check_slug',
          slug: $('#slug-name').val()).success (data) ->
          if data.show_error
            $('#slug-name').addClass('ui-state-error')
            updateTips('Selected slug was already taken')
          else
            $('#document_slug').val($('#slug-name').val())
            $('.new-doc').find('form').unbind().submit()
            $('#slug-name').removeClass( "ui-state-error" );
            $(this).dialog 'close'

      Cancel: ->
        $(this).dialog 'close'
        $(".validateTips").text('A document with that name already exist. Please, pick the document slug name')
