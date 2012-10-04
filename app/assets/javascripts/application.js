//= require jquery
//= require jquery_ujs
//= require objects
	$(window).bind('resize', function(){resizeBackground();});
	$('#slides').slides({
		preload: true,
		play: 5000,
		pause: 2500,
		hoverPause: true,
		animationStart: function(current){
			$('.caption').animate({
				bottom:-35
			},100);
		},
		animationComplete: function(current){
			$('.caption').animate({
				bottom:0
			},200);
		},
		slidesLoaded: function() {
			$('.caption').animate({
				bottom:0
			},200);
		}
	});
	$('.winStory .nav').click(function() {
		if ($(':animated').length == 0) {
			var nap = $(this).attr('id');
			if (nap == 'navWinRight') {
				miniSlideLeft();
			}
			if (nap == 'navWinLeft') {
				miniSlideRight();
			}
		}
	});
		/*$('.navPred > .elLeft > a').hover(function() {
		var pos = $(this).position();
		var url = $(this).attr('href');
		var img = $(this).find('img').attr('src');
		var text = $(this).find('p').html();
		var title = $(this).find('span').html();
		$('#modal p').html(text);
		$('#modal a').attr('href',url);
		$('#modal span').html(title);
		$('#modal img').attr({src:img,alt:title});
		$('#modal').css({left:pos.left - 58,top:pos.top+10}).show();
		return false;
	});
	$('.navPred > .elRight > a').hover(function() {
		var pos = $(this).position();
		var url = $(this).attr('href');
		var img = $(this).find('img').attr('src');
		var text = $(this).find('p').html();
		var title = $(this).find('span').html();
		$('#modalR p').html(text);
		$('#modalR a').attr('href',url);
		$('#modalR span').html(title);
		$('#modalR img').attr({src:img,alt:title});
		$('#modalR').css({left:pos.left-306,top:pos.top}).show();
		return false;
	});
	$('.modal').hover(function() {
		return true;
	},
	function() {
	  $('.modal').hide();
	});
	
	$('.navPredSlider > div > a').hover(function(){
		/*var pos = $(this).position();
		var url = $(this).attr('href');
		var img = $(this).find('img').attr('src');
		var text = $(this).find('p').html();
		var title = $(this).find('span').html();
		$('#modalR p').html(text);
		$('#modalR a').attr('href',url);
		$('#modalR span').html(title);
		$('#modalR').css({left:pos.left-58,top:pos.top}).show();
		$(this).find('img').attr('src',$(this).find('img').attr('src').replace('.png','H.png'));
	},
	function() {
		$(this).find('img').attr('src',$(this).find('img').attr('src').replace('H.png','.png'));
	});
	/*$('.modal').hover(function() {
		return true;
	},
	function() {
	  $('.modal').hide();
	});*/
	
	mainSlidesLoad();
	$('.navigator a').click(function() {
		var id = Number($(this).attr('id').replace('mainSlideNav_',''));
		clearInterval(timerslides);
		mainSlideLeft(id);
	});
	$('.subMenuClick').click(function() {
		$('.twosubmenu').hide();
		$('#'+$(this).attr('rel')).show();
		return false;
	});
/*	$('.slides_container1').hover(function() {
		clearInterval(timerslides);
	},function() {
		timerslides = setInterval(function() {
		mainSlideLeft();
	}, 4000);
	});
	$('.navPred').hover(function() {
		clearInterval(timerslides);
	},function() {
		timerslides = setInterval(function() {
		mainSlideLeft();
	}, 4000);
	});
	$('.modal').hover(function() {
		clearInterval(timerslides);
	},function() {
		timerslides = setInterval(function() {
		mainSlideLeft();
	}, 4000);
	});*/