
article_editor_ready = ->
  $('#article_editor').validate
    debug: false,
    rules:
      'article[title]': required: true
      'article[group_list][]': required: true


$(document).ready(article_editor_ready)
$(document).on('page:load', article_editor_ready)

$(document).on 'page:change', ->
  
  $('#article_group').select2
    placeholder: "Choose Groups."
    allowClear: true

  $('.sg-shortcuts').hide()

  $('#tagkey').click (event) =>
    $('.sg-shortcuts').toggle()
    event.preventDefault()

onEndless = ->
  if $('.pagination').length and $('#articles').length
    $(window).off 'scroll', onEndless
    url = $('.pagination .next a').attr('href')
    $('.pagination').hide()
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
      $('.pagination').show().text('Loading more ...')
      $.getScript url, ->
        $(window).on 'scroll', onEndless
    else
      $(window).on 'scroll', onEndless

$(window).on 'scroll', onEndless

$(window).scroll()
