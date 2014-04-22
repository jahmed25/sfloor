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
    $("a[name='saveLater']").on('click', function () {
        var sku1 = $(this).attr('sku');
        var inner=$(this).attr('inner')
        $.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=addFav', data: { sku: sku1} })
			.success(function (msg) {
			    var json = msg;//JSON.parse(msg);
			    if (json.error != null)
			        return;
			    var div = "<div class='wishlist-content'>" +
				"<a  class='imglist' href='" + path + "?htm=" + json.sku + "'><img  src='" + serverPath + json.image + "' width='30px' height='30px'/>" +
				"<div class='main-cont'><p class='brand'>" + json.brand + "</p>" +
				"<p class='empty'>" + json.name + "</p>" +
				"<p class='subtotal'>" +
					"MRP <span class='pricecut'>Rs. " + json.mrp + "</span><br>" +
					"Actual Price <span class='price'>Rs. " + json.price + "</span>" +
					"</p></div>" +
				"</div>";
			    if (inner == 'true') {
			        var wc = parent.document.getElementById('wishContent');
			        var wd = parent.document.getElementById('wishListDiv');
			        if ($(wc).text().length == 0) {
			            var v1 = "<a href='" + path + "FavList' style='color:blue'>View ALL</a>";
			            v1 += "<a href='#' style='float:right;color:red' onclick='clearFav()'>Clear All</a><div id='wishContent'>" + div + "</div>";
			            $(wd).html(v1);
			        } else {
			            $(wd).prepend(div);
			        }
			        var fav = parent.document.getElementById('favCount');
			        var count = $(fav).text();
			        count = parseInt(count) + 1;
			        $(fav).text(count);

			    } else {
			        if ($("#wishContent").text().length == 0) {
			            var v1 = "<a href='" + path + "FavList' style='color:blue'>View ALL</a>";
			            v1 += "<a href='#' style='float:right;color:red' onclick='clearFav()'>Clear All</a><div id='wishContent'>" + div + "</div>";
			            $("#wishListDiv").html(v1);
			        } else {
			            $("#wishContent").prepend(div);
			        }
			        var count = $("#favCount").text();
			        count = parseInt(count) + 1;
			        $("#favCount").text(count);
			    }
			});
    });

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
    $("a[pop]").on('click', function () {
        $('#quickViewObj').attr("data", path + "sfloor/pages/QuickView.aspx?sku=" + $(this).attr('pop'));
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