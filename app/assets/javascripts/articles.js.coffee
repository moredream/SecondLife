# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
article_editor_ready = ->
  $('#article_editor').validate
    debug: false,
    rules:
      'article[title]': required: true
      'article[group_list][]': required: true


$(document).ready(article_editor_ready)
$(document).on('page:load', article_editor_ready)

$(document).on 'page:change', ->
  $('#tag_panel').hide()
  $('#article-search-off').hide()

  $('#article_group').select2
    placeholder: "Choose Groups."
    allowClear: true

  $('#article-search').click (event) =>
    event.preventDefault()
    $('#tag_panel').show()
    $('#article-search').hide()
    $('#article-search-off').show()

  $('#article-search-off').click (event) =>
    event.preventDefault()
    $('#tag_panel').hide()
    $('#article-search').show()
    $('#article-search-off').hide()

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
