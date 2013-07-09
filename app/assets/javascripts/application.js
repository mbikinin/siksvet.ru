//= require jquery
//= require jquery_ujs
//= require lazybox
//= require objects
	
	
	$(document).ready(function(){
		$(window).bind('resize', function(){resizeBackground();});
		
		$('a[rel*=lazybox]').lazybox();
		
			/****
	 **  Эффект загрузки для remote true
	 ****/
		$('a[data-remote],input[data-remote], form[data-remote]')
		.bind("ajax:beforeSend", function(et, e){ $("#loading").show();	})
		.bind("ajax:complete", function(et, e){  $("#loading").hide(); })
		.bind("ajax:after", function(et, e){  $("#loading").hide(); });
	});