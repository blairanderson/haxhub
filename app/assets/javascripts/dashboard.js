$(document).ready(function() {
  $('#projectTabs a:first').tab('show');

  if ($('#projectTabs').children('li').length === 0) {
    $('#projectTabs').find('.add_project').trigger('click');
  };

  $('li.side-nav').tooltip();

  function startCarousel(delay){

    var intervalID = setInterval(function() {
      var tabs = $('#projectTabs > li'),
          active = tabs.filter('.active'),
          next = active.next('li'),
          toClick = next.length ? next.find('a') : tabs.eq(0).find('a');

      toClick.trigger('click');
    }, delay);

    return intervalID
  };

  $('#fast-carousel').on('click', function(){
    clearInterval($('#carousel').data('interval-id'));
    var intervalID = startCarousel(5000);
    $('#carousel').data('interval-id', intervalID);
  });
  $('#slow-carousel').on('click', function(){
    clearInterval($('#carousel').data('interval-id'));
    var intervalID = startCarousel(15000);
    $('#carousel').data('interval-id', intervalID);
  });
  $('#stop-carousel').on('click', function(){
    clearInterval($('#carousel').data('interval-id'));
  });
});
