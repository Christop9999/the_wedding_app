var ready;
ready = function() {
	
$(document).ready(function() {
  $('[data-toggle=offcanvas]').click(function() {
    $('.row-offcanvas').toggleClass('active');
  });
});
}
$(document).ready(ready);
$(document).on('page:load', ready);