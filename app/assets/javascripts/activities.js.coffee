@PivPoller =
  poll: ->
    setTimeout @request, 5000

  request: ->
    pivotal = $(".tab-content").find(".active").find(".pivotal")

    $.get($(pivotal).data('pivotal-url'), before: $(pivotal).children().first().data('pivotal-event-at'))

jQuery ->
  pivotal = $(".tab-content").find(".active").find(".pivotal")

  
  PivPoller.poll()