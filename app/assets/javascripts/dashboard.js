$(document).ready(function() {
  $('#projectTabs a:first').tab('show');

  if ($('#projectTabs').children('li').length === 0) {
    $('#projectTabs').find('.add_project').trigger('click');
  };

  $('li.side-nav').tooltip();

  function startCarousel(){
    delay = 10000; // We'll wanna set this as the data-field for some form
    
    var tabCarousel = setInterval(function() {
      var tabs = $('#projectTabs > li'),
          active = tabs.filter('.active'),
          next = active.next('li'),
          toClick = next.length ? next.find('a') : tabs.eq(0).find('a');

      toClick.trigger('click');
  }, delay); 
  };

  function stopCarousel(){
    clearInterval(tabCarousel)
  };

  // startCarousel(); 
});
