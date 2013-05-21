@GitPoller =
  poll: ->
    setTimeout @request, 15000

  request: ->
    github = $(".tab-content").find(".active").find(".github")

    $.get($(github).data('git-url'), before: $(github).children().first().data('git-event-at'))

jQuery ->
  github = $(".tab-content").find(".active").find(".github")

  if $(github).length > 0
    GitPoller.poll()