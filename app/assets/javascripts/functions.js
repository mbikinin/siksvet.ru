function resizeBackground(){
	image = $('#backgroundImage img');
	window_w = $(window).width();
	window_h = $(window).height();
	img_w = parseInt($(image).width());
	img_h = parseInt($(image).height());
	
	if ( window_w/window_h < img_w/img_h ){
	new_img_h = window_h;
	koef = window_h / img_h;
	new_img_w = Math.ceil(img_w*koef);
	$(image).attr({width: new_img_w, height: new_img_h});
	var left = -Math.ceil((new_img_w - window_w) / 2);
	$('#backgroundImage').css({'left': left+'px', 'top': 0});
	}
	else
	{
	new_img_w = window_w;
	koef = window_w / img_w;
	new_img_h = Math.ceil(img_h*koef);
	$(image).attr({width: new_img_w, height: new_img_h});
	var top = -Math.ceil((new_img_h - window_h) / 2);
	$('#backgroundImage').css({'left': 0, 'top': top+'px'});
	}
}
function resizeObjectBg(){
	image = $('#object_img img');
	window_w = $(window).width()-300;
	window_h = $(window).height()-100;
	image.css({'width': window_w})
}
$('#backgroundImage img').load(function(){
	resizeBackground();
});

function testinput(re, str){
   if (str.search(re) != -1)
	  return true
   else
	  return false
}
		
function miniSlideLeft() {
				clearInterval(timerminislides);
				var id = Number($('.winStory .left').attr('id').replace('slide_',''));
				var maxSlide = $('.winStory .preview').length;
				
				if (id == maxSlide) { var zoom = 0; }
				else { var zoom = id + 1; }
				if (id == maxSlide - 1) { var next = 0;}
				else if (id == maxSlide) { var next = 1; }
				else { var next = zoom + 1; }
				if (id == 0) { var prev = maxSlide; }
				else { var prev = id - 1; }
				$('#slide_'+zoom+' .image').css({zIndex:200});
				$('#slide_'+id+' .image').css({zIndex:150});
				$('#slide_'+zoom+' .text').hide();
				$('#slide_'+prev+' .image').css({opacity:0,zIndex:100});
				$('#slide_'+id+' .image img').animate({width:167,height:147},300);
				$('#slide_'+id+' .image').animate({width:167,height:147,opacity:1,left:35,marginTop:0},300);
					$('#slide_'+next+' .image').css({zIndex:100}).animate({left:36,opacity:0},300);
					$('#slide_'+zoom+' .image img').animate({width:150,height:132},300);
					$('#slide_'+zoom+' .image').animate({width:150,height:132,marginTop:6,opacity:0.3,left:224},300, function() {
						$('#slide_'+next).removeClass('right');
						$('#slide_'+id).removeClass('preview left');
						$('#slide_'+zoom).addClass('preview right');
						$('#slide_'+zoom).removeClass('viewed');
						$('#slide_'+id).addClass('viewed');
						$('#slide_'+prev+' .image').animate({left:-140,marginTop:6,opacity:0.3});
						$('#slide_'+prev).addClass('left');
						$('#slide_'+id+' .text').show();
					});
	timerminislides = setInterval(function() {
		miniSlideRight();
	}, 8000);
}
function miniSlideRight() {
				clearInterval(timerminislides);
				var id = Number($('.winStory .right').attr('id').replace('slide_',''));
				var maxSlide = $('.winStory .preview').length;
				if (maxSlide == id) { var next = 0; }
				else { next = id + 1; }
				if (id == 1) { var prev = maxSlide;}
				else if (id == 0) { var prev = maxSlide - 1;}
				else { var prev = id - 2; }
				if (id == 0) { var zoom = maxSlide; }
				else {var zoom = id - 1;}
				$('#slide_'+zoom+' .image').css({zIndex:200});
				$('#slide_'+id+' .image').css({zIndex:150});
				$('#slide_'+zoom+' .text').hide();
				$('#slide_'+next+' .image').css({opacity:0,zIndex:100});
				$('#slide_'+id+' .image').animate({width:167,height:147,marginTop:0,opacity:1,left:35},300);
				$('#slide_'+id+' .image img').animate({width:167,height:147},300);
					$('#slide_'+prev+' .image').css({zIndex:100}).animate({left:36,opacity:0},300);
					$('#slide_'+zoom+' .image img').animate({width:150,height:132},300);
					$('#slide_'+zoom+' .image').animate({width:150,height:132,marginTop:6,opacity:0.3,left:-140},300, function() {
						$('#slide_'+prev).removeClass('left'); 
						$('#slide_'+id).removeClass('preview right');
						$('#slide_'+zoom).addClass('preview left');
						$('#slide_'+zoom).removeClass('viewed');
						$('#slide_'+id).addClass('viewed');
						$('#slide_'+next+' .image').animate({left:224,marginTop:6,opacity:0.3});
						$('#slide_'+next).addClass('right');
						$('#slide_'+id+' .text').show();
					});
	timerminislides = setInterval(function() {
		miniSlideRight();
	}, 8000);
}

function addBg(elem) {
	$(elem).find('img').attr('src',$(elem).find('img').attr('src').replace('.png','H.png'));
}
function removeBg(elem) {
	$(elem).find('img').attr('src',$(elem).find('img').attr('src').replace('H.png','.png'));
}

function mainSlidesLoad() {
	var i = 0;
	$('.slides_container1 .slide').each(function() {
		this.setAttribute('id','mainSlide_'+i);
		i++;
	});
	var i = 0;
	$('.navigator a').each(function() {
		this.setAttribute('id','mainSlideNav_'+i);
		i++;
	});
/*	var i = 0;
	$('.navPredSlider div').each(function() {
		this.setAttribute('id','navPredSlide_'+i);
		i++;
	});*/
	$('#mainSlide_0').removeClass('slide').addClass('viewed');
	//$('.navPredSlider').css({left:0});
		timerslides = setInterval(function() {
		mainSlideLeft();
	}, 1);
	timerminislides = setInterval(function() {
		miniSlideRight();
	}, 1);
}
function getClassesForNav(id) {
	switch(id) {
		case 0:
		var pos = ['navActive','right1','right2','left2','left1'];
		var letters = ['c','d','e','a','b'];
		break;
		case 1:
		var pos = ['left1','navActive','right1','right2','left2'];
		var letters = ['b','c','d','e','a'];
		break;
		case 2:
		var pos = ['left2','left1','navActive','right1','right2'];
		var letters = ['a','b','c','d','e'];
		break;
		case 3:
		var pos = ['right2','left2','left1','navActive','right1'];
		var letters = ['e','a','b','c','d'];
		break;
		case 4:
		var pos = ['right1','right2','left2','left1','navActive'];
		var letters = ['d','e','a','b','c'];
		break;
	}
	$('.navigator a').removeAttr('class');
	for (var i=0;i<pos.length;i++) {
		var e = i+1;
		src = '/assets/'+e+letters[i]+'.png';
		$('#mainSlideNav_'+i+' img').attr('src',src);
		$('#mainSlideNav_'+i).addClass(pos[i]);
	}
}
function navPredLeft() {
	//var classes = ['elLeft','elLeft','elLeft','elRight','elRight'];
	$('.navPredSlider div').removeAttr('class');
	$('.navPredSlider div:first').clone().appendTo('.navPredSlider');
	var i = 0;
	$('.navPredSlider').animate({left:-253},400,function() {
		$('.navPredSlider div:first').remove();
		$('.navPredSlider').css({left:0});
	});
	/*$('.navPredSlider div').each(function() {
		this.setAttribute('class',classes[i]);
		//alert(i+': '+classes[i]);
		i++;
	});*/
}
function mainSlideLeft(sId) {
	clearInterval(timerslides);
	if ($(':animated').length == 0) {
		var id = Number(($('.slides_container1 .viewed').attr('id').replace('mainSlide_','')));
		var maxSlide = $('.slides_container1 .slide').length;
		if (sId == undefined) {
			if (id < maxSlide) var newId = id + 1;
			else if (id == maxSlide) var newId = 0;
		}
		else {
			var newId = sId;
		}
		$('.slides_container1 .slide').css({marginLeft:1920});
		$('#mainSlide_'+id).animate({marginLeft:-1920},400);
		$('#mainSlide_'+newId).animate({marginLeft:0},400);
		getClassesForNav(newId);
		navPredLeft();
		$('#mainSlide_'+id).removeClass('viewed').addClass('slide');
		$('#mainSlide_'+newId).removeClass('slide').addClass('viewed');
	}
	timerslides = setInterval(function() {
		mainSlideLeft();
	}, 8000);
}
