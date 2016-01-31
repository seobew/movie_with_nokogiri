$(document).on('ready page:load', function(){
		$('.dialog').dialog();
});

$(document).on('ready page:load', function () {
	//initialize swiper when document ready
	var mySwiper = new Swiper ('.swiper-container', {
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
	//		slidesPerView: 5,
			slidesPerView: 8,
			spaceBetweenSlides: 10,
			slidesPerColumn: 2,
		//	slidesPerGroup: 4,
		  slidesPerColumnFill: 'column',
			paginationClickable: true,
			spaceBetween: 20,
			freeMode: true,
			loop: false,
			breakpoints: {
				// when window width is <= 320px
				320: {
							 slidesPerView: 1,
			spaceBetweenSlides: 10
						 },
			// when window width is <= 480px
			480: {
						 slidesPerView: 2,
			spaceBetweenSlides: 20
					 },
			// when window width is <= 640px
			640: {
						 slidesPerView: 2,
						 spaceBetweenSlides: 10
					 },
			870: {
						 slidesPerView: 3,
						 spaceBetweenSlides: 10
					 },
			1150: {
						 slidesPerView: 4,
						 spaceBetweenSlides: 10
				},
			1300: {
						 slidesPerView: 5,
						 spaceBetweenSlides: 10
						},
			1550: {
						 slidesPerView: 6,
						 spaceBetweenSlides: 10
						},
			1850: {
						 slidesPerView: 7,
						 spaceBetweenSlides: 10
						}
			}
	});
	var mySwiper3 = new Swiper ('.swiper-container3', {
		pagination: '.swiper-pagination',
		slidesPerView: 4,
		spaceBetweenSlides: 8,
		slidesPerColumn: 2,
	//	slidesPerGroup: 4,
		slidesPerColumnFill: 'column',
		paginationClickable: true,
		spaceBetween: 20,
		freeMode: true,
		loop: false
	});
});
