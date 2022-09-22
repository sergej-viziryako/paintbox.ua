
jQuery(function() {
	ResizeMenu();
	ResizeMenuDesktop();
	ResizeMenuTablet();
	initStickyScrollBlock();
	initPopups();
	initSlick();
	initONInp();
	initQuantityNumber();
	initAccordion();
	initAttributesProducts();
	initGScroll();
	initMask();
	initSliderValue();
	initOpenClose();
	initFilterChecked();
	initAscDesc();
	initLightbox();
	initAnchors();
	initTabs();
	initTableRowShowHide();
	initLazy();
	initGoToTop();
	initInitialHeightFilter();
});

// init

function initInitialHeightFilter() {
	$('.slide-row-filter').each(function() {
	  var $this = $(this);
	  if ($this.find('.checkbox').length <= 5) { 
	      $this.addClass('initial');
	  }
	});
}

function initGoToTop() {
	$(window).scroll(function(){
		if ($(this).scrollTop() > 100) {
			$('#gototop').fadeIn().css("display","flex");
		} else {
			$('#gototop').fadeOut();
		}
	});
	$('#gototop').click(function(){
		$(".totop").animate({ scrollTop: 0 }, 900);
		return false;
	});
}

function initTableRowShowHide() {
    $('.switch').each(function() {
        var checkbox = $(this).children('input[type=checkbox]');
        var toggle = $(this).children('label.switch-toggle');
        if (checkbox.length) {
            checkbox.addClass('hidden');
            toggle.removeClass('hidden');
            if (checkbox[0].checked) {
                toggle.addClass('on');
                toggle.removeClass('off');
                toggle.text(toggle.attr('data-on'));
            } else {
                toggle.addClass('off');
                toggle.removeClass('on');
                toggle.text(toggle.attr('data-off'));
            };
        }
    });
    $('.switch-toggle').click(function(){
        var checkbox = $(this).siblings('input[type=checkbox]')[0];
        var toggle = $(this);
	$(this).parents(".table-compare").toggleClass("showhide");
        if (checkbox.checked) {
            toggle.addClass('off');
            toggle.removeClass('on');
            toggle.text(toggle.attr('data-off'));
        } else {
            toggle.addClass('on');
            toggle.removeClass('off');
            toggle.text(toggle.attr('data-on'));
        };
    });
}

function initTabs() {
	jQuery('.tabset-registration').tabset({
		tabLinks: 'a',
		attrib: 'title'
	});
	jQuery('.tabset-cabinet').tabset({
		tabLinks: 'a',
		attrib: 'title'
	});
}

function initAnchors() {
	new SmoothScroll({
		anchorLinks: 'a[href^="#"]:not([href="#"])',
		extraOffset: 0,
		wheelBehavior: 'none'
	});
}

function initLightbox() {
  lightbox.option({
   	'resizeDuration': 200,
   	'albumLabel': "",
   	'imageFadeDuration': 100
  })
}

function initAscDesc() {
	$('.sort a').on('click',function(e) {
			if($(this).hasClass('')) {
	    	$('.sort a').removeClass('asc').removeClass('desc').removeClass('active');
				$(this).addClass('asc').addClass('active');
	    }
	    else if($(this).hasClass('asc')) {
	    	$('.sort a').removeClass('asc').removeClass('desc').removeClass('active');
				$(this).addClass('desc').addClass('active');
	    }
	    else if($(this).hasClass('desc')) {
	    	$('.sort a').removeClass('asc').removeClass('desc').removeClass('active');
				$(this).addClass('asc').addClass('active');
	    }
	});
}

function initFilterChecked() {
	var boxes = $('.filters input');
	boxes.on('change', function () {
	  $('.filters').toggleClass("filters-checked", boxes.is(":checked"));
	  $('button.apply').prop('disabled', boxes.filter(':checked').length < 1);
	});
}

function initOpenClose() {
	jQuery('.openclose-row-filter').openClose({
		activeClass: 'active-row',
		opener: '.opener-row-filter',
		slider: '.slide-row-filter',
		animSpeed: 400,
		addClassBeforeAnimation: false,
		effect: 'slide'
	});
	jQuery('.open-close-sorting').openClose({
		activeClass: 'active-sorting',
		opener: '.opener-sorting',
		slider: '.slide-sorting',
		animSpeed: 0,
		hideOnClickOutside: true,
		effect: 'slide'
	});
}

function initSliderValue() {
  $("#slider").slider({
    range: true,
    min: 0,
    max: 1000,
    values: [ 0, 1000 ],
    slide: function( event, ui ) {
      $( "#amount1" ).val( ui.values[ 0 ] );
      $( "#amount2" ).val( ui.values[ 1 ] );
    }
  });
  $("#amount1").change(function() {
    $("#slider").slider('values',0,$(this).val());
  });
  $("#amount2").change(function() {
    $("#slider").slider('values',1,$(this).val());
  });
}

function initLazy() {
	$('.lazy').Lazy();
}

function initMask() {
  $("#phone-callback").mask("+38(999) 999-9999");
  $("#phone-contact").mask("+38(999) 999-9999");
  $(".phone-callback").mask("+38(999) 999-9999");
  $(".phone-oneclick").mask("+38(999) 999-9999");
}

function initGScroll() {
	$('.scrollbar-dynamic').scrollbar();
	$('.scrollbar-outer').scrollbar();
	$('.scrollbar-macosx').scrollbar();
}

function initAttributesProducts() {
	$(".products li .more").click(function () {
		$(this).toggleClass("moreactive");
		$(this).parents("li").toggleClass("moreliactive");
	});
}

function initStickyScrollBlock() {
	ResponsiveHelper.addRange({
		'1024..': {
			on: function() {
				jQuery('.header .section-header-catalog').stickyScrollBlock({
					animDelay: 0,
					animSpeed: 0,
					extraTop: 0,
					activeClass: 'section-fixed-position',
					container: '#wrapper',
					positionType: 'fixed',
					showAfterScrolled: true
				});
			},
			off: function() {
				jQuery('.clear-filter').stickyScrollBlock('destroy');
			}
		}
	});
	ResponsiveHelper.addRange({
		'..1023': {
			on: function() {
				jQuery('.header').stickyScrollBlock({
					animDelay: 0,
					animSpeed: 0,
					extraTop: 0,
					activeClass: 'header-fixed-position',
					container: '#wrapper',
					positionType: 'fixed',
					showAfterScrolled: false
				});
			},
			off: function() {
				jQuery('.clear-filter').stickyScrollBlock('destroy');
			}
		}
	});
}

function initPopups() {
	jQuery('.popup-holder-menu').contentPopup({
		mode: 'click',
		popup: '.popup-menu',
		btnOpen: '.open-menu',
		btnClose: '.close-menu',
		openClass: 'popup-active-menu',
		clickEvent: 'click'
	});
	jQuery('.popup-holder-catalog').contentPopup({
		mode: 'click',
		popup: '.popup-catalog',
		btnOpen: '.open-catalog',
		btnClose: '.close-catalog',
		openClass: 'popup-active-catalog',
		clickEvent: 'click'
	});
	jQuery('.popup-holder-contacts').contentPopup({
		mode: 'click',
		popup: '.popup-contacts',
		btnOpen: '.open-contacts',
		btnClose: '.close-contacts, .open-callback',
		openClass: 'popup-active-contacts',
		clickEvent: 'click'
	});
	jQuery('.popup-holder-callback').contentPopup({
		mode: 'click',
		popup: '.popup-callback',
		btnOpen: '.open-callback',
		btnClose: '.close-callback, .popup-callback button.send',
		openClass: 'popup-active-callback',
		clickEvent: 'click'
	});
	jQuery('.popup-holder-thanks').contentPopup({
		mode: 'click',
		popup: '.popup-thanks',
		btnOpen: '.open-thanks',
		btnClose: '.close-thanks',
		openClass: 'popup-active-thanks',
		clickEvent: 'click'
	});
	jQuery('.popup-holder-filter').contentPopup({
		mode: 'click',
		popup: '.popup-filter',
		btnOpen: '.open-filter',
		btnClose: '.close-filter',
		openClass: 'popup-active-filter',
		clickEvent: 'click'
	});
	jQuery('.popup-holder-registr').contentPopup({
		mode: 'click',
		popup: '.popup-registr',
		btnOpen: '.open-registr',
		btnClose: '.close-registr',
		openClass: 'popup-active-registr',
		clickEvent: 'click'
	});
	jQuery('.popup-holder-credit').contentPopup({
		mode: 'click',
		popup: '.popup-credit',
		btnOpen: '.open-credit',
		btnClose: '.close-credit, .popup-credit button.send',
		openClass: 'popup-active-credit',
		clickEvent: 'click'
	});
}

function ResizeMenu() {
	$(window).resize(function() {
    var width = $(document).width();
	    if (width < 1007) {
	    	$('.header .catalog-block').appendTo( $('.popup-catalog .popup-catalog-content') );
	    	$('.header .menu').appendTo( $('.popup-menu .popup-menu-content') );
	    	$('.header .lang').appendTo( $('.popup-menu .popup-menu-content') );
		}
	    if (width < 751) {
	    	$('.header .search').prependTo( $('.popup-catalog .popup-catalog-content') );
	    }
	    if (width >= 1007) {
			$('.popup-catalog .catalog-block').appendTo( $('.header .catalog-inner-block') );
			$('.popup-menu .menu').appendTo( $('.header .menu-block') );
			$('.popup-menu .lang').appendTo( $('.header .lang-block') );
		}
	    if (width >= 751) {
	    	$('.popup-catalog .search').prependTo( $('.header .search-block') );
	    }
	});
}

function ResizeMenuDesktop() {
    if ($(window).width() < 1007) {
    	$('.header .catalog-block').appendTo( $('.popup-catalog .popup-catalog-content') );
    	$('.header .menu').appendTo( $('.popup-menu .popup-menu-content') );
    	$('.header .lang').appendTo( $('.popup-menu .popup-menu-content') );
	}
    else {
    }
}

function ResizeMenuTablet() {
    if ($(window).width() < 751) {
    	$('.header .search').prependTo( $('.popup-catalog .popup-catalog-content') );
    }
    else {
    }
}

function initAccordion() {
	ResponsiveHelper.addRange({
		'0..1023': {
			on: function() {
				jQuery('.accordion-catalog').slideAccordion({
					opener: '.opener',
					slider: '.slide',
					addClassBeforeAnimation: true,
					animSpeed: 0,
					collapsible:true
				});
			},
			off: function() {
				jQuery('.accordion-catalog').slideAccordion('destroy');
			}
		}
	});
	ResponsiveHelper.addRange({
		'0..1023': {
			on: function() {
				jQuery('.accordion-catalog-internal').slideAccordion({
					opener: '.opener-internal',
					slider: '.slide-internal',
					allowClickWhenExpanded: true,
					addClassBeforeAnimation: true,
					animSpeed: 0,
					collapsible:true,
				});
			},
			off: function() {
				jQuery('.accordion-catalog-internal').slideAccordion('destroy');
			}
		}
	});
	ResponsiveHelper.addRange({
		'0..1023': {
			on: function() {
				jQuery('.accordion-catalog-inner').slideAccordion({
					opener: '.opener-inner',
					slider: '.slide-inner',
					addClassBeforeAnimation: true,
					animSpeed: 0,
					collapsible:true,
				});
			},
			off: function() {
				jQuery('.accordion-catalog-inner').slideAccordion('destroy');
			}
		}
	});
	jQuery('.accordion-filter').slideAccordion({
	    opener: '>.opener-filter',
	    slider: '>.slide-filter',
	    animSpeed: 0,
	    activeClass: 'active'
	});
	jQuery('.accordion-questansw').slideAccordion({
		opener: '>.opener',
		slider: '>.slide',
		animSpeed: 300,
		activeClass: 'active'
	});
}

function initSlick() {
	$('.slider-topslider').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 4000,
	  dots: false,
	  arrows: false,
	  infinite: true,
	  speed: 500,
	  fade: true,
	  cssEase: 'linear'
	});
	$('.slider-mainslider').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 4000,
	  arrows: true,
	  dots: false,
	  infinite: true,
	  speed: 300,
	  fade: true,
	  cssEase: 'swing'
	});
	$('.responsive-products').slick({
	  dots: false,
	  infinite: true,
	  speed: 300,
	  slidesToShow: 4,
	  slidesToScroll: 1,
	  lazyLoad: 'ondemand',
	  responsive: [
	    {
	      breakpoint: 1200,
	      settings: {
	        slidesToShow: 4,
	        slidesToScroll: 1
	      }
	    },
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 3,
	        slidesToScroll: 1
	      }
	    },
	    {
	      breakpoint: 768,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 1
	      }
	    },
	    {
	      breakpoint: 350,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1
	      }
	    }
	  ]
	});
	$('.responsive-brands').slick({
	  dots: false,
	  infinite: true,
	  speed: 300,
	  slidesToShow: 5,
	  slidesToScroll: 1,
	  lazyLoad: 'ondemand',
	  responsive: [
	    {
	      breakpoint: 1200,
	      settings: {
	        slidesToShow: 4,
	        slidesToScroll: 1
	      }
	    },
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 3,
	        slidesToScroll: 1
	      }
	    },
	    {
	      breakpoint: 768,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 1
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 1
	      }
	    },
	    {
	      breakpoint: 320,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1
	      }
	    }
	  ]
	});
	$('.slider-for').slick({
	  infinite: false,
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  arrows: false,
	  fade: true,
	  asNavFor: '.slider-nav'
	});
	$('.slider-nav').slick({
	  asNavFor: '.slider-for',
	  centerPadding: '0',
	  focusOnSelect: true,
	  slidesToScroll: 1,
	  dots: false,
	  infinite: false,
	  speed: 300,
	  slidesToShow: 5,
	  centerMode: false,
	  responsive: [
	    {
	      breakpoint: 1399,
	      settings: {
	        slidesToShow: 4
	      }
	    },
	    {
	      breakpoint: 1199,
	      settings: {
	        slidesToShow: 4
	      }
	    },
	    {
	      breakpoint: 1024,
	      settings: {
	        slidesToShow: 5
	      }
	    },
	    {
	      breakpoint: 768,
	      settings: {
	        slidesToShow: 4
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 3
	      }
	    },
	    {
	      breakpoint: 350,
	      settings: {
	        slidesToShow: 2
	      }
	    }
	  ]
	});
	$('.slider-nav').on('setPosition', function(event, slick){
	  var length_slid = $('.slider-nav .slick-slide').length;
	  if ( 
	    (length_slid <= 5) && ($(window).width() >= 1382) || (length_slid <= 4) && ($(window).width() >= 1007) && ($(window).width() < 1382) || (length_slid <= 5) && ($(window).width() >= 751) && ($(window).width() < 1007) || (length_slid <= 4) && ($(window).width() >= 463) && ($(window).width() < 751) || (length_slid <= 3) && ($(window).width() >= 333) && ($(window).width() < 463) || (length_slid <= 2) && ($(window).width() < 333) ) {
	    $('.slider-nav').addClass("stop-transform");  
	  }else{
	    $('.slider-nav').removeClass("stop-transform");
	  }
	});
}

function initONInp() {
	$(document).on('change', 'input[type="number"]', function (event) {
	    this.value = this.value.replace(/[^0-9]+/g, '');
	    if (this.value < 1) this.value = 0;
	});
	$(document).on('keypress', 'input[type="number"]', function (event) {
	    return (((event.which > 47) && (event.which < 58)) || (event.which == 13));
	});
}

function initQuantityNumber() {
    jQuery('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input[type=\"number\"]');
    jQuery('.quantity').each(function() {
      var spinner = jQuery(this),
        input = spinner.find('input[type="number"]'),
        btnUp = spinner.find('.quantity-up'),
        btnDown = spinner.find('.quantity-down'),
        min = input.attr('min'),
        max = input.attr('max');
      btnUp.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue >= max) {
          var newVal = oldValue;
        } else {
          var newVal = oldValue + 1;
        }
        spinner.find("input[type=\"number\"] ").val(newVal);
        spinner.find("input[type=\"number\"]").trigger("change");
      });
      btnDown.click(function() {
        var oldValue = parseFloat(input.val());
        if (oldValue <= min) {
          var newVal = oldValue;
        } else {
          var newVal = oldValue - 1;
        }
        spinner.find("input[type=\"number\"]").val(newVal);
        spinner.find("input[type=\"number\"]").trigger("change");
      });
    });
}

// body
"use strict";
$(function() {
    $(".youtube").each(function() {
        $(this).css('background-image', 'url(https://i.ytimg.com/vi/' + this.id + '/sddefault.jpg)');
        $(this).append($('<div/>', {'class': 'play'}));
        $(document).delegate('#'+this.id, 'click', function() {
            var iframe_url = "https://www.youtube.com/embed/" + this.id + "?autoplay=1&autohide=1&enablejsapi=1&html5=1";
            if ($(this).data('params')) iframe_url+='&'+$(this).data('params');
            var iframe = $('<iframe/>', {'allow': 'autoplay; encrypted-media', 'frameborder': '0', 'src': iframe_url, 'width': $(this).width(), 'height': $(this).height() })
            $(this).replaceWith(iframe);
        });
    });
});

$(function(){
	// Антиспам
	$('.ajax_form').append('<input type="text" name="org" value="" class="_org" style="visibility:hidden; height: 0; width: 0; padding: 0; border:none;"/>')
})
