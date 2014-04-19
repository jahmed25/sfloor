$(document).ready(function () {
    //open popup
    $("#log").click(function () {
        $("#overlay_form").fadeIn(1000);
        $(".background_overlay").fadeIn(500);
        positionPopup();
    });

    //close popup
    $("#close, .background_overlay").click(function () {
        $("#overlay_form").fadeOut(500);
        $(".background_overlay").fadeOut(500);
    });
    $(window).bind('resize', positionPopup);
    //maintain the popup at center of the page when browser resized
});
//position the popup at the center of the page
function positionPopup() {
    if (!$("#overlay_form").is(':visible')) {
        return;
    }
    $("#overlay_form").css({
        left: ($(window).width() - $('#overlay_form').width()) / 2,
        top: ($(window).width() - $('#overlay_form').width()) / 7,
        position: 'absolute'
    });
}

 $(document).ready(function () {
    //open popup
    $("[pop]").click(function () {
        $("#overlay_form_quick").fadeIn(1000);
        $(".background_overlay_quick").fadeIn(500);
        positionPopupQuick();
    });

    //close popup
    $("#closequickview, .background_overlay_quick").click(function () {
        $("#overlay_form_quick").fadeOut(500);
        $(".background_overlay_quick").fadeOut(500);
    });
    $(window).bind('resize', positionPopup);
    //maintain the popup at center of the page when browser resized
});
//position the popup at the center of the page
function positionPopupQuick() {
    if (!$("#overlay_form_quick").is(':visible')) {
        return;
    }
    $("#overlay_form_quick").css({
        left: ($(window).width() - $('#overlay_form_quick').width()) / 2,
        top: ($(window).width() - $('#overlay_form_quick').width()) / 7,
        position: 'absolute'
    });
}