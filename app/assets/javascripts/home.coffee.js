$(document).on('ready page:load', function(){
	  $('.bxslider').bxSlider({
			pager: false,
		//	auto: true,
		//	autoControls: true,
		//	adaptiveHeight: true,
		//	mode: 'fade',
			captions: true
		//	slideWidth: 600
		//	minSlides: 2,
		//	maxSlides: 3,
		//	moveSlides: 1,
		//	slideMargin: 10,
		});
		$('.dialog').dialog();
});

function bgcolor_yellow(obj){
	obj.style.backgroundColor = 'yellow';
}
