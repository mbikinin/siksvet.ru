$(window).load(function () {
  imageLoad(); 
});
	function imageLoad() {
		$('#slide_0').addClass('zoomed');
		$('#slide_0').removeClass('preview');
		$('#slide_1').addClass('right');
		imgslideOut(document.getElementById('slide_1'));
	}
	function testinput(re, str){
	   if (str.search(re) != -1)
		  return true
	   else
		  return false
	}
	function getHeight(Owidth,Oheight,normalWidth) {
		var delta = Owidth / normalWidth;
		imageHeight = Math.round(Oheight / delta);
		return imageHeight;
	}
	function imgslideOut(elem) {
			var id = Number(elem.id.replace('slide_',''));
			if (testinput(/zoomed/,elem.getAttribute('class'))) {
				return false;
			}
			$('#image_view').attr('src',$(elem).attr('src')).css({display:'block'});
			var imageWidth  = $('#image_view').width();
			var imageHeight = $('#image_view').height();
			$('#image_view').removeAttr('src').css({display:'none'});
			if(screen.width<1050) {
				var normalHeight = getHeight(imageWidth,imageHeight,800);
				var zoomedAnim = {opacity:1,width:800,height:normalHeight,top:0,left:0,marginLeft:100};
				var normalLeft = 200;
				var normalRight = 800;
			}
			if(screen.width > 1050) {
				var normalHeight = getHeight(imageWidth,imageHeight,980);
				var zoomedAnim = {opacity:1,width:980,height:normalHeight,top:0,left:0};
				var normalLeft = 300;
				var normalRight = 900;
			}
			var maxSlide = document.getElementById('slider').getElementsByTagName('img').length + 1;
			if (testinput(/right/,elem.getAttribute('class'))) {
				if (id != maxSlide) { var next = id + 1; }
				if (id != 1) { var prev=id - 2;	}
				var zoom = id - 1;
				if (id == maxSlide - 2) { var next = 0; }
				if (id == 0) {
					var zoom = maxSlide - 2;
					var prev = maxSlide - 3;
				}
				if (id == 1) var prev = maxSlide - 2;
				
				$(elem).animate(zoomedAnim,300);
				$('#slide_'+prev).animate({left:normalLeft,opacity:0},300);
				$('#slide_'+zoom).removeAttr('title');
				$('#slide_'+zoom).animate({width:389,height:285,opacity:0.2,top:180,left:-normalLeft},300, function() {
					$('#slide_'+prev).removeClass('left'); 
					$('#slide_'+prev).css({display:'none',opacity:0.2});
					$(elem).removeClass('preview right');
					$('#slide_'+zoom).addClass('preview left');
					$('#slide_'+zoom).removeClass('zoomed');
					$(elem).addClass('zoomed');
					$('#slide_'+next).css({display:'block'});
					$('#slide_'+next).animate({left:normalRight});
					$('#slide_'+next).addClass('right');
				});
			}
			if (testinput(/left/,elem.getAttribute('class'))) {
				var zoom = id + 1;
				var next= id + 2;
				if (id > 0) { var prev = id - 1; }
				if (id == 0) { var prev = maxSlide - 2; }
				if (id == maxSlide - 2) {
					var zoom = 0;
					var next = 1;
				}
				if (id == maxSlide - 3) var next = 0;
				$(elem).animate(zoomedAnim,300);
				$('#slide_'+next).animate({right:0,left:0,opacity:0},300);
				$('#slide_'+zoom).removeAttr('title');
				$('#slide_'+zoom).animate({width:389,height:285,opacity:0.2,top:180,left:normalRight},300, function() {
					$('#slide_'+next).removeClass('right');
					$('#slide_'+next).css({display:'none',opacity:0.2});
					$(elem).removeClass('preview left');
					$('#slide_'+zoom).addClass('preview right').removeClass('zoomed');
					$(elem).addClass('zoomed');
					$('#slide_'+prev).css({display:'block'});
					$('#slide_'+prev).animate({left:-normalLeft});
					$('#slide_'+prev).addClass('left');
				});
			}
		$("#portfolio").css({height:normalHeight+'px'});
	}