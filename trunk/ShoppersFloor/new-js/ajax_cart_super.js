function slideEffectAjax() {
    $('.top-cart-contain').mouseenter(function () {
        $(this).find(".top-cart-content").stop(true, true).show();
    });
    //hide submenus on exit
    $('.top-cart-contain').mouseleave(function () {
        $(this).find(".top-cart-content").stop(true, true).hide();
    });
}

$(document).ready(function () {
    $('.ajaxcartsuper-index-productview #mini_cart_block').hide(150);
    slideEffectAjax();
});
