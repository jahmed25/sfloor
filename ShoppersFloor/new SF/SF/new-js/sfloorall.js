
jQuery(document).ready(function(){
    jQuery("#pt_menu_link ul li").each(function(){
        var url = document.URL;
        jQuery("#pt_menu_link ul li a").removeClass("act");
        jQuery('#pt_menu_link ul li a[href="'+url+'"]').addClass('act');
    }); 
    
    jQuery('.pt_menu_no_child').hover(function(){
        jQuery(this).addClass("active");
    },function(){
        jQuery(this).removeClass("active");
    })
    
    jQuery('.pt_menu').hover(function(){
        if(jQuery(this).attr("id") != "pt_menu_link"){
            jQuery(this).addClass("active");
        }
    },function(){
        jQuery(this).removeClass("active");
    })
    
    jQuery('.pt_menu').hover(function(){
       /*show popup to calculate*/
       jQuery(this).find('.popup').css('display','inline-block');
       
       /* get total padding + border + margin of the popup */
       var extraWidth       = 0
       var wrapWidthPopup   = jQuery(this).find('.popup').outerWidth(true); /*include padding + margin + border*/
       var actualWidthPopup = jQuery(this).find('.popup').width(); /*no padding, margin, border*/
       extraWidth           = wrapWidthPopup - actualWidthPopup;    
       
       /* calculate new width of the popup*/
       var widthblock1 = jQuery(this).find('.popup .block1').outerWidth(true);
       var widthblock2 = jQuery(this).find('.popup .block2').outerWidth(true);
       var new_width_popup = 0;
       if(widthblock1 && !widthblock2){
           new_width_popup = widthblock1;
       }
       if(!widthblock1 && widthblock2){
           new_width_popup = widthblock2;
       }
       if(widthblock1 && widthblock2){
            if(widthblock1 >= widthblock2){
                new_width_popup = widthblock1;
            }
            if(widthblock1 < widthblock2){
                new_width_popup = widthblock2;
            }
       }
       var new_outer_width_popup = new_width_popup + extraWidth;
       
       /*define top and left of the popup*/
       var wraper = jQuery('.pt_custommenu');
       var wWraper = wraper.outerWidth();
       var posWraper = wraper.offset();
       var pos = jQuery(this).offset();
       
       var xTop = pos.top - posWraper.top + CUSTOMMENU_POPUP_TOP_OFFSET;
       var xLeft = pos.left - posWraper.left;
       if ((xLeft + new_outer_width_popup) > wWraper) xLeft = wWraper - new_outer_width_popup;

       jQuery(this).find('.popup').css('top',xTop);
       jQuery(this).find('.popup').css('left','0px');
       
       /*set new width popup*/
       jQuery(this).find('.popup').css('width','100%');
       jQuery(this).find('.popup .block1').css('width','');
       
       /*return popup display none*/
       jQuery(this).find('.popup').css('display','none');
       
       /*show hide popup*/
       if(CUSTOMMENU_POPUP_EFFECT == 0) jQuery(this).find('.popup').stop(true,true).slideDown('slow');
       if(CUSTOMMENU_POPUP_EFFECT == 1) jQuery(this).find('.popup').stop(true,true).fadeIn(300);
       if(CUSTOMMENU_POPUP_EFFECT == 2) jQuery(this).find('.popup').stop(true,true).show('slow');
    },function(){
       if(CUSTOMMENU_POPUP_EFFECT == 0) jQuery(this).find('.popup').stop(true,true).slideUp();
       if (CUSTOMMENU_POPUP_EFFECT == 1) jQuery(this).find('.popup').stop(true, true).fadeOut(300);
       if(CUSTOMMENU_POPUP_EFFECT == 2) jQuery(this).find('.popup').stop(true,true).hide('fast');
   })
   });
   jQuery(document).ready(function () {

       // hide #back-top first
       jQuery("#back-top").hide();

       // fade in #back-top
       jQuery(function () {
           jQuery(window).scroll(function () {
               if (jQuery(this).scrollTop() > 100) {
                   jQuery('#back-top').fadeIn();
               } else {
                   jQuery('#back-top').fadeOut();
               }
           });
           // scroll body to 0px on click
           jQuery('#back-top').click(function () {
               jQuery('body,html').animate({
                   scrollTop: 0
               }, 800);
               return false;
           });
       });

   });

   //fixed navbar
//   jQuery(function () {
//       var header = jQuery('.nav-container').offset().top;
//       jQuery(window).scroll(function () {
//           if (jQuery(window).scrollTop() > header) {
//               jQuery('.nav-container').addClass("sticky");
//           } else {
//               jQuery('.nav-container').removeClass("sticky");
//           }
//       });
   //   });
  
   jQuery(function () {
       var nav = jQuery('.nav-container');
       var cartstick = jQuery('.cart-stick');
       var searchstick = jQuery('.search-stick');
   var scrolled = false;
   jQuery(window).scroll(function () {
       if (80 < jQuery(window).scrollTop() && !scrolled) {
           nav.addClass('sticky').animate({ top: '0px' });
           cartstick.addClass('cart-sticky').animate({ top: '0px' });
           searchstick.addClass('search-sticky').animate({ top: '0px' });
           scrolled = true;
       }
       if (80 > jQuery(window).scrollTop() && scrolled) {
           nav.removeClass('sticky').css('top', '0px');
           cartstick.removeClass('cart-sticky').animate({ top: '0px' });
           searchstick.removeClass('search-sticky').animate({ top: '0px' });
           scrolled = false;
       }

   });

});
// 
//   jQuery(function () {
//       var header = jQuery('.cart-stick').offset().top;
//       jQuery(window).scroll(function () {
//           if (jQuery(window).scrollTop() > header) {
//               jQuery('.cart-stick').addClass("cart-sticky");
//           } else {
//               jQuery('.cart-stick').removeClass("cart-sticky");
//           }
//       });
//   });
//   jQuery(function () {
//       var header = jQuery('.search-stick').offset().top;
//       jQuery(window).scroll(function () {
//           if (jQuery(window).scrollTop() > header) {
//               jQuery('.search-stick').addClass("search-sticky");
//           } else {
//               jQuery('.search-stick').removeClass("search-sticky");
//           }
//       });
//   });