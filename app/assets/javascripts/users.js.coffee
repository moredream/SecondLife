user_editor_ready = ->
  $('#user_editor').validate
    debug: false,
    rules:
      'user[username]': required: true

$(document).ready(user_editor_ready)
$(document).on('page:load', user_editor_ready)

avata_editor_ready = ->
  $('#avata_editor').validate
    debug: false,
    rules:
      'user[image]': required: true

$(document).ready(avata_editor_ready)
$(document).on('page:load', avata_editor_ready)



jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_crop_x').val(coords.x)
    $('#user_crop_y').val(coords.y)
    $('#user_crop_w').val(coords.w)
    $('#user_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview').css
                  width: Math.round(64/coords.w * $('#cropbox').width()) + 'px'
                  height: Math.round(64/coords.h * $('#cropbox').height()) + 'px'
                  marginLeft: '-' + Math.round(64/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(64/coords.h * coords.y) + 'px'


accountpanel = ->
  $('#profile').hide()
  $('#info').hide()
  $('#password').hide()
  $('#account').hide()


$(document).on 'page:change', ->
  accountpanel()

  $('#my-avata').click (event) =>
    accountpanel()
    $('#profile').show()
    event.preventDefault()

  $('#my-info').click (event) =>
    accountpanel()
    $('#info').show()
    event.preventDefault()

  $('#my-password').click (event) =>
    accountpanel()
    $('#password').show()
    event.preventDefault()

   $('#my-account').click (event) =>
    accountpanel()
    $('#account').show()
    event.preventDefault()

