//= require jquery
//= require jquery_ujs
//= require lazybox
//= require objects
	$(window).bind('resize', function(){resizeBackground();});
	
	$(document).ready(function(){
		$('a[rel*=lazybox]').lazybox();
	});