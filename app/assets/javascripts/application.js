//= require jquery
//= require jquery_ujs
//= require lazybox
//= require objects
	
	
	$(document).ready(function(){
		$(window).bind('resize', function(){resizeBackground();});
		$('a[rel*=lazybox]').lazybox();
	});