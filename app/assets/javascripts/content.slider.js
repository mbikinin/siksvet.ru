/*			Content carousel slider for divs, v 1.4
			Requered JQuery v > 1.4 && content.slider.css
			Writed by nencu
			Special for ArtSoda Company, 2012 year
			mailto: nencu@kzp.in
*/

function testinput(re, str){
   if (str.search(re) != -1)
	  return true
   else
	  return false
}
function slideChange(elem,id,min,maxSlide) {
	if ($(':animated').length == 0) {
		if (testinput(/zoomed/,elem.getAttribute('class'))) {
			return false;
		}
		if (testinput(/right/,elem.getAttribute('class'))) {
			if (maxSlide == id) { var next = min; }
			else { next = id + 1; }
			if (id == min+ 1) { var prev = maxSlide;}
			else if (id == min) { var prev = maxSlide - 1;}
			else { var prev = id - 2; }
			if (id == min) { var zoom = maxSlide; }
			else {var zoom = id - 1;}
			
			$('#slide_'+zoom).css({zIndex:200});
			$('#slide_'+id).css({zIndex:150});
			$('#slide_'+next).css({opacity:0,zIndex:100});
			$('#slide_'+id).animate({width:279,height:166,marginTop:20,opacity:1,left:85},300);
			$('#slide_'+id+' img').animate({width:279,height:166},300);
				$('#slide_'+prev).css({zIndex:150}).animate({left:95,opacity:0},300);
				$('#slide_'+zoom+' img').animate({width:177,height:105},300);
				$('#slide_'+zoom).animate({width:177,height:105,marginTop:55,opacity:0.4,left:10},300, function() {
					$('#slide_'+prev).removeClass('left'); 
					$('#slide_'+prev).addClass('preview'); 
					$('#slide_'+id).removeClass('preview right');
					$('#slide_'+zoom).css({zIndex:100}).addClass('left');
					$('#slide_'+zoom).removeClass('viewed');
					$('#slide_'+id).addClass('viewed');
					$('#slide_'+next).animate({left:260,marginTop:55,opacity:0.4});
					$('#slide_'+next).removeClass('preview').addClass('right');
				});
		}
		if (testinput(/left/,elem.getAttribute('class'))) {
			if (id == maxSlide) { var zoom = min; }
			else { var zoom = id + 1; }
			if (id == maxSlide - 1) { var next = min;}
			else if (id == maxSlide) { var next = min + 1; }
			else { var next = zoom + 1; }
			if (id == min) { var prev = maxSlide; }
			else { var prev = id - 1; }
			$('#slide_'+zoom).css({zIndex:200});
			$('#slide_'+id).css({zIndex:150});
			$('#slide_'+prev).css({opacity:0,zIndex:100});
			$('#slide_'+id+' img').animate({width:279,height:166},300);
			$('#slide_'+id).animate({width:279,height:166,opacity:1,left:85,marginTop:20},300);
				$('#slide_'+next).css({zIndex:100}).animate({left:95,opacity:0},300);
				$('#slide_'+zoom+' img').animate({width:177,height:105},300);
				$('#slide_'+zoom).animate({width:177,height:105,marginTop:55,opacity:0.4,left:260},300, function() {
					$('#slide_'+next).removeClass('right');
					$('#slide_'+id).removeClass('preview left');
					$('#slide_'+zoom).css({zIndex:100}).addClass('right');
					$('#slide_'+zoom).removeClass('viewed');
					$('#slide_'+id).addClass('viewed');
					$('#slide_'+prev).animate({left:10,marginTop:55,opacity:0.4});
					$('#slide_'+prev).removeClass('preview').addClass('left');
				});
		}
	}
	return false;
}

$(document).ready(function () {
	var elems = $('.contentSlider div');
	for (var i = 0;i<elems.length;i++) {
		elems[i].setAttribute('id','slide_'+i);
	}
	$('.contentSlider div').addClass('slide preview');
	var sliders = $('.contentSlider');
	for (var i = 0;i<sliders.length;i++) {
		var elems = sliders[i].getElementsByTagName('div');
		var all = elems.length - 1;
		var min = elems[0].getAttribute('id').replace('slide_','');
		var max = elems[all].getAttribute('id').replace('slide_','');
		elems[0].setAttribute('class','slide left');
		elems[1].setAttribute('class','slide viewed');
		elems[2].setAttribute('class','slide right');
		for (var e = 0;e<elems.length;e++) {
			elems[e].setAttribute('onclick','slideChange(this,'+elems[e].getAttribute('id').replace('slide_','')+','+min+','+max+')');
		}
	}
});