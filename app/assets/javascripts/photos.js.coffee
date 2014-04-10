# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('#fileupload').fileupload
    dataType: "script",
    dropZone: "",
    replaceFileInput: 'photo[image]',
    paramName: 'photo[image]',
    maxNumberOfFiles: 3,
    maxFileSize: 1000000,
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
    context: $('#fileupload')[0]

# $(document).on 'page:change', ->
#   $('a.gallery').colorbox({  rel:'group1'  })

# $(document).on 'page:change', ->
#   $('#fileupload').fileupload

#     dataType: 'script',
#     replaceFileInput: 'photo[image]',
#     context: $('#fileupload')[0]
#     done: (e, data) ->
#       $(e).fileupload('option', 'done')




