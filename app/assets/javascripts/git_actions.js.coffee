GitPoller =
  poll: ->
    setTimeout @request, 5000

  request: ->
    $.get($('.github').data('url'))

jQuery ->
  if $('.github').length > 0
    GitPoller.poll()