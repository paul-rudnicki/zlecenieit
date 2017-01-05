/*--------------------------------------------------

URL:gozawi.com

---------------------------------------------------*/

/***************************************************
1. ON LOAD JQUERY
***************************************************/

(function($) {

		Placeholdem( document.querySelectorAll( '[placeholder]' ) );
		
		
	    $('.sidebar .search  input[type=text]').css('width', '100%').css('width', '-=50px');
		
		
		$('.user-content').css('width', '100%').css('width', '-=75px');
		$('.add-offer').css('width', '100%').css('width', '-=25px');

        if ($(window).width() < 800) 
        {
            $(".main-sidebar").remove().insertAfter($(".main-text"));
        }
		
})(jQuery);

$(window).resize(function() {
	$('.sidebar .search  input[type=text]').css('width', '100%').css('width', '-=50px');
	$('.user-content').css('width', '100%').css('width', '-=75px');
	
	if ($(window).width() < 800) 
	{
		$(".main-sidebar").remove().insertAfter($(".main-text"));
	} else {
		$(".main-sidebar").remove().insertBefore($(".main-text"));
	}
			
	$('.service-wrapper').hoverIntent(
	function () {
		$(this).find('.service-info').stop( true, true ).animate({ opacity:1 }, 500);
	},
	function () {
		$(this).find('.service-info').stop( true, true ).animate({ opacity:0 }, 500);
	}
	);
			
});

/****************************************************************************
2. TABS
****************************************************************************/

 $('ul.promo-tabs').each(function(){
    var $active, $content, $links = $(this).find('a');
    $active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
    $active.addClass('active');

    $content = $($active[0].hash);

    $links.not($active).each(function () {
      $(this.hash).hide();
    });

    $(this).on('click', 'a', function(e){

      $active.removeClass('bold');
      $content.hide();

      $active = $(this);
      $content = $(this.hash);

      $active.addClass('bold');
      $content.show();

      e.preventDefault();
    });
});

 $('ul.new-tabs').each(function(){
    var $active, $content, $links = $(this).find('a');
    $active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
    $active.addClass('active');

    $content = $($active[0].hash);

    $links.not($active).each(function () {
      $(this.hash).hide();
    });

    $(this).on('click', 'a', function(e){

      $active.removeClass('bold');
      $content.hide();

      $active = $(this);
      $content = $(this.hash);

      $active.addClass('bold');
      $content.show();

      e.preventDefault();
    });
});

/****************************************************************************
3. LOGIN
****************************************************************************/

$(function() {
	var state = true;
	$( ".login-show" ).click(function() {
		event.preventDefault();
		if ( state ) {
			$('.top-login').toggle('slow', function() {
				return false;
			});
			$('.login-show').addClass('show-enabled');
		} else {
			$('.top-login').toggle('slow', function() {
				return false;
			});
			$('.login-show').removeClass('show-enabled');;
		}
		state = !state;
	});
});

$('.login-close').click(function(event) {
event.preventDefault();
  $('.top-login').hide('slow', function() {
	return false;
  });
  $('.login-show').removeClass('show-enabled');
});

/****************************************************************************
4. HOVER
****************************************************************************/

(function($) {
	$('.service-wrapper').hoverIntent(
	function () {
	    $(this).find('.service-info').stop( true, true ).animate({ opacity:1 }, 500);
		},
		function () {
		 $(this).find('.service-info').stop( true, true ).animate({ opacity:0 }, 500);
		}
	);
})(jQuery);


(function($) {
	$('.newsletter-form a').hover(
	function () {
	    $('.newsletter-form .icon').stop( true, true ).animate({ 'backgroundColor':'#55a3d4' }, 300);
		$('.newsletter-form .icon').stop( true, true ).animate({ 'color':'#fff' }, 300);
		},
		function () {
		 $('.newsletter-form .icon').stop( true, true ).animate({ 'backgroundColor':'#fff' }, 300);
		 $('.newsletter-form .icon').stop( true, true ).animate({ 'color':'#1d1d33' }, 300);
		}
	);
})(jQuery);

/****************************************************************************
5. MOBILE MENU
****************************************************************************/

$('.choose-mobile-button').click(function(event) {
event.preventDefault();
  $('.mobile-menu').toggle('slow', function() {
	return false;
  });
});

$(window).resize(function(){
	if($(".mobile-menu").is(":visible")){
		$('.mobile-menu').hide('slow', function() {
			return false;
		  });	
	}
});