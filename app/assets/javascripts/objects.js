$(document).on("mouseover", "#object_img .floor",
	function(){
		$(this).css("background", "url('/assets/floor_bg.png')");
		$('.floor_text').show()
		$('.floor_text').html($(this).attr("rel") + " этаж")
	}
);
$(document).on("mouseout", "#object_img .floor", 
	function(){
		$(this).css("background", "none");
	}
);
