$(document).ready(function() {
	/*$('nav.warp > .main > div > a').hover(function() {
		if (!$(this).hasClass('f')) {
		$('nav.warp .active').addClass('sactive');
		$('nav.warp .active').removeClass('active');
		$(this).addClass('active');
		}
	},
	function() {
		$('nav.warp .active').removeClass('active');
		$('.sactive').addClass('active');
		$('.sactive').removeClass('sactive');
	});*/
	$('.companyD').hover(function() {
		$('.twosubactive').addClass('twosubactiveS').removeClass('twosubactive');
		$('#navWarp .companyNav').addClass('twosubactive');
	});
	$('.productD').click(function() {
		$('.twosubactive').addClass('twosubactiveS').removeClass('twosubactive');
		$('#navWarp .productNav').addClass('twosubactive');
		return false;
	});
	$('#navWarp nav').hover(function() { return true; },
	function() {
		$('#navWarp nav').removeClass('twosubactive').removeClass('twosubactiveS');
		if ($('#navWarp nav').hasClass('setAct')) $('#navWarp .setAct').addClass('twosubactive');
	});
	$('.about').hover(function() {
		$('nav.warp .active').addClass('sactive');
		$('nav.warp .active').removeClass('active');
		$('.about > .f').addClass('ractive');
		$('#about').show();
	},
	function() {
		$('.about > .f').removeClass('ractive');
		$('#about').hide();
		$('.sactive').addClass('active');
		$('.sactive').removeClass('sactive');
	});
});
$(document).ready(function() {
	$('.capability').hover(function() {
		$('nav.warp .active').addClass('sactive');
		$('nav.warp .active').removeClass('active');
		$('.capability > .f').addClass('ractive');
		$('#capability').show();
	},
	function() {
		$('.capability > .f').removeClass('ractive');
		$('#capability').hide();
		$('.sactive').addClass('active');
		$('.sactive').removeClass('sactive');
	});
});