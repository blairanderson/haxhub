GitPoller =
  poll: ->
    setTimeout @request, 5000

  request: ->
    $.get($('.github').data('git-url'), before: $('.github .feed-data').first().data('git-created-at'))

jQuery ->
  if $('.github').length > 0
    GitPoller.poll()