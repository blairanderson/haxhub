@GitPoller =
  poll: ->
    setTimeout @request, 5000

  request: ->
    github = $(".tab-content").find(".active").find(".github")

    $.get($(github).data('git-url'), before: $(github).children().first().data('git-event-at'))

jQuery ->
  github = $(".tab-content").find(".active").find(".github")

  GitPoller.poll()