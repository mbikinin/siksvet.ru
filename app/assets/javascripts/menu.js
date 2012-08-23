$(document).ready(function() {
	$('.about').hover(function() {
		$('.about > .f').addClass('active');
		$('#about').show();
	},
	function() {
		$('.about > .f').removeClass('active');
		$('#about').hide();
	});
});
$(document).ready(function() {
	$('.capability').hover(function() {
		$('.capability > .f').addClass('active');
		$('#capability').show();
	},
	function() {
		$('.capability > .f').removeClass('active');
		$('#capability').hide();
	});
});