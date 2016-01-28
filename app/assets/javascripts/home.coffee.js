$(document).on('ready page:load', function(){
		$('.dialog').dialog();
});

$(document).ready(function () {
	//initialize swiper when document ready
	var mySwiper = new Swiper ('.swiper-container', {
		/*
			pagination: '.swiper-pagination',
			paginationClickable: true,
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev',
			spaceBetween: 30,
			loop: true,
			effect: 'fade',
			autoplay: 2500,
			autoplayDisableOnInteraction: false
			*/
		pagination: '.swiper-pagination',
			effect: 'coverflow',
			grabCursor: true,
			centeredSlides: true,
			slidesPerView: 'auto',
			loop: true,
			coverflow: {
				rotate: 50,
			stretch: 0,
			depth: 100,
			modifier: 1,
			slideShadows : true
			}
	});
	var mySwiper2 = new Swiper ('.swiper-container2', {
		pagination: '.swiper-pagination',
			slidesPerView: 3,
			slidesPerColumn: 2,
			paginationClickable: true,
			spaceBetween: 30,
			loop: true
	});
});
