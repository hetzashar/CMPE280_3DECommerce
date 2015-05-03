/**
 * 
 */
$(document).ready(function()
{
    $('#thumbCarousel').carousel({
		interval: 3000
	})
});

/* affix the Carousel Buttons to Carousel Item on scroll */
$('.nav-carousel').bind({
	offset:
	{
		top: $('#thumbCarousel').height()-$('.nav-carousel').height()
	}
});

$(document).ready( function()
{
	var carouselContainer = $('.carousel');
	var slideInterval = 2500;
	
	$('#carousel').carousel({
		interval:   slideInterval
	});
	
	var clickEvent = false;
	$('#thumbCarousel').on('click', '.nav-carousel a', function() {
			clickEvent = true;
			$('.nav-carousel li').removeClass('active');
			$(this).parent().addClass('active');	
	}).on('slid.bs.carousel', function(e)
	{
		if(!clickEvent)
		{
			var count = $('.nav-carousel').children().length -1;
			var current = $('.nav-carousel li.active');
			current.removeClass('active').next().addClass('active');
			var id = parseInt(current.data('slide-to'));
			if(count == id)
			{
				$('.nav-carousel li').first().addClass('active');	
			}
		}
		clickEvent = false;
	});
});

$(document).ready(function()
{

	$('.slide1, .slide2, .slide3').hover(function()
	{
		$(this).find('.caption').delay(200).slideDown(350);
	},
	function()
	{
		$(this).find('.caption').delay(200).slideUp(350);
	});
	
	$('.fade1, .fade2').hover(
		function(){
			$(this).find('.caption').delay(200).fadeIn(350);
		},
		function(){
			$(this).find('.caption').delay(200).fadeOut(350);
		}
	);
});