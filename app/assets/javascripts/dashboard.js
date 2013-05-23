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


  $('#full-screen').on('click', function(){
    $('div.side-nav').hide('fast');
    $('div.navbar-top').hide('fast');
    $('#reduce-screen').show('fast');
  });

  $('#reduce-screen').on('click', function(){
    $('#reduce-screen').fadeOut('fast').hide();
    $('div.side-nav').show('fast');
    $('div.navbar-top').show('fast');
  });

  $('.alert').find('button.close').hide();
  $('.alert').show().delay(3000).fadeOut('slow');

  $('.github-spinner').show().delay(10000).fadeOut('slow');
  $('.github-notice').hide().delay(10000).fadeIn('slow');
  $('.travis-spinner').show().delay(10000).fadeOut('slow');
  $('.travis-notice').hide().delay(10000).fadeIn('slow');
  $('.pivotal-spinner').show().delay(10000).fadeOut('slow');
  $('.pivotal-notice').hide().delay(10000).fadeIn('slow');
});
