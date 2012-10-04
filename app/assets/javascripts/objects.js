$("#object_img .floor").live("mouseover",
	function(){
		$(this).css("background", "url('/assets/floor_bg.png')");
		$('.floor_text').show()
		$('.floor_text').html($(this).attr("rel") + " этаж")
	}
);
$("#object_img .floor").live("mouseout",
	function(){
		$(this).css("background", "none");
	}
);
