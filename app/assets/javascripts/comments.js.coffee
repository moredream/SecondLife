# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  if $("#comments").length and $('.pagination').length
    $('#append_and_paginate').prepend('<a id="append_more_results" href="javascript:void(0);">Show more comments</a>');
    $('.pagination').hide();
    $('#append_more_results').click ->
      url = $('.pagination .next a').attr('href')
      if url
        $('.pagination').text('Fetching more comments...')
        $.getScript(url)
