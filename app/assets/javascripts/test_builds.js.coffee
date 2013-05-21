@TbPoller =
  poll: ->
    setTimeout @request, 5000

  request: ->
    travis = $(".tab-content").find(".active").find(".travis")

    $.get($(travis).data('travis-url'), before: $(travis).children().first().data('travis-event-at'))

jQuery ->
  travis = $(".tab-content").find(".active").find(".travis")

  if $(travis).length > 0
    TbPoller.poll()