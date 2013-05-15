$(document).ready(function() {
  $('#myModal').modal()

  $('#projectTabs a:first').tab('show');

  $('li.side-nav').tooltip();

  function startCarousel(){
    delay = 5000; // We'll wanna set this as the data-field for some form
    
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
