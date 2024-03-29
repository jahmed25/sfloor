﻿jQuery(window).on('scroll', function () {
    var top = jQuery(this).scrollTop();
    var filter = jQuery('#floating_filter');
    var filter_height = jQuery('#floating_filter').outerHeight(true);
    var listing_height = jQuery('.listing_right').height();
    var threshold_start = jQuery('#filter_float_threshold_start').offset().top;
    var threshold_end = jQuery('#filter_float_threshold_end').position().top - 206;

    if (top <= threshold_start) {
        //jQuery('#floating_filter').nav_filter('static', 0);
        setFilterPosition('static', 0);
    } else if (top > threshold_start && top < ((threshold_end + 475) - filter_height)) {
        //jQuery('#floating_filter').nav_filter('fixed', 45 );
        setFilterPosition('fixed', 30);
    } else {
        var pos = (((threshold_end + 80) - filter_height) - top) + 100;
        //if(pos > (listing_height - (jQuery('#filter_float_threshold_end').position().top - listing_height))) {
        //listing_height -= 100;
        //pos = listing_height - (jQuery('#filter_float_threshold_end').position().top - listing_height);
        //pos = listing_height - (jQuery('#filter_float_threshold_end').position().top - listing_height);
        //}
        //jQuery('#floating_filter').nav_filter('fixed', pos);
        setFilterPosition('fixed', pos);
    }
});



jQuery.fn.nav_filter = function (pos, top) {
    this.css('top', top);
    this.css("position", pos);
    //this.css("left", (jQuery(window).width() / 2) - (this.outerWidth() / 2));
    return this;
}

function setFilterPosition(pos, top) {
    jQuery('#floating_filter').css({
        'top': top,
        'position': pos
    });
}
