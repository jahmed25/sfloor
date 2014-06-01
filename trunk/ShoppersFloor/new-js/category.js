jQuery(document).ready(function () {

    jQuery("a[data='" + jQuery('#pTypeNav').text().trim() + "']").css('color', 'rgba(252,178,104,1)');
    //open popup
    // Ajax on click on brand links
    jQuery(".lnkbtn_category").on("click", function () {
        jQuery('#error').val('false');
        jQuery("#PType").val('');
        jQuery('#sortPrice').val('');
        jQuery('#range').val('');
        var brand = jQuery(this).text() == null ? null : jQuery(this).text().trim();
        var cat = jQuery("#catNav").text() == null ? null : jQuery("#catNav").text().trim();
        var subCat = jQuery("#subCatNav").text() == null ? null : jQuery("#subCatNav").text().trim();
        url = path + "sfloor/pages/CategoriesScroll.aspx";
        // alert("brand " + brand + ", cat:" + cat+" subCat:"+subCat);
        jQuery.ajax({
            url: url,
            data: { PBrand: brand, cat: cat, subCat: subCat, pageNo: 0 },
            async: false,
            before: function () {
                jQuery('#spinner').show();
            },
            error: function () {
                jQuery('#spinner').hide();
            }
        }).done(function (msg) {
            jQuery('#spinner').hide();
            jQuery("#categories").html(jQuery(msg).filter("#categories").html());
            jQuery("#PBrand").val(jQuery(msg).filter("#PBrand").val());
        });
    });
    // Ajax calling  for sorting by ascending or descending	
    jQuery("#price_select").on("change", function () {
        jQuery('#error').val('false');
        var SortPrice = jQuery(this).val();
        jQuery('#sortPrice').val(SortPrice);
        var cat = jQuery("#catNav").text();
        var subCat = jQuery("#subCatNav").text();
        var PType = jQuery("#PType").val();
        var PBrand = jQuery("#PBrand").val();
        if (SortPrice != 0) {
            url = path + "sfloor/pages/CategoriesScroll.aspx";
            jQuery.ajax({
                url: url,
                data: { SortPrice: SortPrice, cat: cat, subCat: subCat, PType: PType, PBrand: PBrand, pageNo: 0 },
                async: false,
                before: function () {
                    jQuery('#spinner').show();
                },
                error: function () {
                    jQuery('#spinner').hide();
                }
            }).done(function (msg) {
                jQuery('#spinner').hide();
                jQuery("#categories").html(jQuery(msg).filter("#categories").html());
                jQuery("#pageNo").val(jQuery(msg).filter("#pageNo").val());
            });
        }
    });
    // Ajax calling to sort by price
    jQuery("#priceRangeBtn").on("click", function () {
        jQuery('#error').val('false');
        var th = jQuery(this);
        var cat = jQuery("#catNav").text();
        var subCat = jQuery("#subCatNav").text();
        var PType = jQuery("#PType").val();
        var PBrand = jQuery("#PBrand").val();
        var min = jQuery("#minTxt").val();
        var max = jQuery("#maxTxt").val();
        if (min.length == 0 || min.length == 0) {
            jQuery('#errRange').css('display', 'block');
            return;
        }
        jQuery('#errRange').css('display', 'none');
        url = path + 'sfloor/pages/CategoriesScroll.aspx';
        jQuery.ajax({
            url: url,
            data: { min: min, max: max, cat: cat, subCat: subCat, PType: PType, PBrand: PBrand, pageNo: 0 },
            async: false,
            before: function () {
                jQuery('#spinner').show();
            },
            error: function () {
                jQuery('#spinner').hide();
            }
        }).done(function (msg) {
            jQuery('#spinner').hide();
            if (jQuery(msg).find(jQuery("#categories tbody tr").length > 0)) {
                jQuery("#categories").html(jQuery(msg).filter("#categories").html());
                jQuery("#pageNo").val(jQuery(msg).filter("#pageNo").val());
                jQuery(th).attr("checked", true);
            }

        });
    });

    var a;
    jQuery(window).scroll(function (e) {
        if (jQuery(document).height() - 60 <= jQuery(window).scrollTop() + jQuery(window).height()) {
            loadProduct();

        }
    });
});
	
// for load product on demand by scrolling
function loadProduct() {
	var pageNo = jQuery("#pageNo").val();
	var cat = jQuery("#catNav").text();
	var subCat = jQuery("#subCatNav").text();
	var brand = jQuery("#PBrand").val();
	var ptype = jQuery('#PType').val();
	var SortPrice = jQuery('#sortPrice').val();
	var Range = jQuery('#range').val();
	if (jQuery('#error').val() == 'true')
		return;
	url = path+"sfloor/pages/CategoriesScroll.aspx";
	jQuery.ajax({
		url: url,
		async: false,
		data: { cat: cat, subCat: subCat, pageNo: pageNo, PBrand: brand, PType: ptype, SortPrice: SortPrice, Range: Range },
		error: function (err) {
			jQuery('#error').val('true');
			jQuery("#loading-div-background").hide();
		}
	}).done(function (msg) {
		// alert(jQuery(msg).filter("#categories").html());
		if (jQuery(msg).filter("#categories").html() != undefined) {
			jQuery("#categories").append(jQuery(msg).filter("#categories").html());
			jQuery("#pageNo").val(jQuery(msg).filter("#pageNo").val());
		}
	});
}

jQuery(document).ready(function () {
    //open popup
    jQuery("a[pop]").on('click', function () {
        jQuery('#quickViewObj').attr("data", path + "sfloor/pages/QuickView.aspx?sku=" + jQuery(this).attr('pop'));
        jQuery("#overlay_form_quick").fadeIn(1000);
        jQuery(".background_overlay_quick").fadeIn(500);
        positionPopupQuick();
    });

    //close popup
    jQuery("#closequickview, .background_overlay_quick").click(function () {
        jQuery("#overlay_form_quick").hide();
        jQuery(".background_overlay_quick").hide();
    });
    jQuery(window).bind('resize', positionPopupQuick);
    //maintain the popup at center of the page when browser resized
});
//position the popup at the center of the page
function positionPopupQuick() {
    if (!jQuery("#overlay_form_quick").is(':visible')) {
        return;
    }
    jQuery("#overlay_form_quick").css({
        left: (jQuery(window).width() - jQuery('#overlay_form_quick').width()) / 2,
        top: (jQuery(window).width() - jQuery('#overlay_form_quick').width()) / 7,
        position: 'absolute'
    });
}