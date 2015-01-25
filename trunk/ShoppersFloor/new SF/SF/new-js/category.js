jQuery(document).ready(function () {

    jQuery("#catsubCatTxt").live("keyup",function(){
        var searchKey=jQuery(this).val().trim().toLowerCase();
        if(searchKey.length==0){
            jQuery("#datalist_categoryname tr").show();
            return;
        }
        jQuery("#datalist_categoryname tr").hide();
        jQuery("#datalist_categoryname tr li a").each(function(){
                if(jQuery(this).text().trim().toLowerCase().startsWith(searchKey))
                     jQuery(this).parents("tr").show();
        });
        
    });
    jQuery("#brandTxt").live("keyup",function(){
        var searchKey=jQuery(this).val().trim().toLowerCase();
        if(searchKey.length==0){
            jQuery("#datalist_brandname tr").show();
            return;
        }
        jQuery("#datalist_brandname tr").hide();
        jQuery("#datalist_brandname tr li label").each(function(){
                if(jQuery(this).text().trim().toLowerCase().startsWith(searchKey))
                     jQuery(this).parents("tr").show();
        });
        
    });

    ApplyPrevNext();

    jQuery("a[data='" + jQuery('#pTypeNav').text().trim() + "']").css('color', 'rgba(252,178,104,1)');
    //open popup
    // Ajax on click on brand links
    jQuery("[brands]").live("click", function () {
        
        //alert(barndsList);
        jQuery('.background_overlay').show();
        jQuery('#spinner').show();
        jQuery('#error').val('false');
        jQuery("#PType").val('');
        jQuery('#sortPrice').val('');
        jQuery('#range').val('');
        var brand = getBrands();
        var cat = jQuery("#catNav").text() == null ? null : jQuery("#catNav").text().trim();
        var subCat = jQuery("#subCatNav").text() == null ? null : jQuery("#subCatNav").text().trim();
        url = path + "sfloor/pages/CategoriesScroll.aspx";
        // alert("brand " + brand + ", cat:" + cat+" subCat:"+subCat);
        jQuery.ajax({
            url: url,
            data: { PBrand: brand, cat: cat, subCat: subCat, pageNo: 0 },
            async: false,
            before: function () {
                jQuery('.background_overlay').show();
                jQuery('#spinner').show();
            },
            error: function () {
                jQuery('.background_overlay').hide();
                jQuery('#spinner').hide();
            }
        }).done(function (msg) {
            jQuery('.background_overlay').hide();
            jQuery('#spinner').hide();
            jQuery("#categories").html(jQuery(msg).filter("#categories").html());
            jQuery("#PBrand").val(jQuery(msg).filter("#PBrand").val());
        });
    });
    // Ajax calling  for sorting by ascending or descending	
    jQuery("#price_select").live("change", function () {
        jQuery('.background_overlay').show();
        jQuery('#spinner').show();
        jQuery('#error').val('false');
        var SortPrice = jQuery(this).val();
        jQuery('#sortPrice').val(SortPrice);
        var cat = jQuery("#catNav").text();
        var subCat = jQuery("#subCatNav").text();
        var PType = jQuery("#PType").val();
        var PBrand =  getBrands();
        if (SortPrice != 0) {
            url = path + "sfloor/pages/CategoriesScroll.aspx";
            jQuery.ajax({
                url: url,
                data: { SortPrice: SortPrice, cat: cat, subCat: subCat, PType: PType, PBrand: PBrand, pageNo: 0 },
                async: false,
                before: function () {
                    jQuery('.background_overlay').show();
                    jQuery('#spinner').show();

                },
                error: function () {
                    jQuery('.background_overlay').hide();
                    jQuery('#spinner').hide();

                }
            }).done(function (msg) {
                jQuery('.background_overlay').hide();
                jQuery('#spinner').hide();
                jQuery("#categories").html(jQuery(msg).filter("#categories").html());
                jQuery("#pageNo").val(jQuery(msg).filter("#pageNo").val());
            });
        }
    });
    // Ajax calling to sort by price
    jQuery("#priceRangeBtn").live("click", function () {
        jQuery('.background_overlay').show();
        jQuery('#spinner').show();
        jQuery('#error').val('false');
        var th = jQuery(this);
        var cat = jQuery("#catNav").text().trim();
        var subCat = jQuery("#subCatNav").text().trim();
        var PType = jQuery("#PType").val().trim();
        var PBrand =  getBrands();
        var min = jQuery("#minTxt").val().trim();
        var max = jQuery("#maxTxt").val().trim();
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
                jQuery('.background_overlay_cat').show();
                jQuery('#spinner').show();

                
            },
            error: function () {
                jQuery('.background_overlay_cat').hide();
                jQuery('#spinner').hide();

            }
        }).done(function (msg) {
            jQuery('.background_overlay_cat').hide();
            jQuery('#spinner').hide();
            jQuery("#categories").html(jQuery(msg).filter("#categories").html());
            jQuery("#pageNo").val(jQuery(msg).filter("#pageNo").val());
            jQuery(th).attr("checked", true);

        });
    });

    var a;
    jQuery(window).scroll(function (e) {
        if (jQuery(document).height() - 60 <= jQuery(window).scrollTop() + jQuery(window).height()) {
            loadProduct();

        }
    });
    jQuery("#showMoreLink").live("click",function (e) {
            loadProduct();
    });
    
});
	
// for load product on demand by scrolling
function loadProduct() {
    jQuery('#loadImg').show();
    jQuery("#showMoreLink").hide();
	var pageNo = jQuery("#pageNo").val();
	var cat = jQuery("#catNav").text();
	var subCat = jQuery("#subCatNav").text();
	var brand = jQuery("#PBrand").val();
	var ptype =  getBrands();
	var SortPrice = jQuery('#sortPrice').val();
	var Range = jQuery('#range').val();
	if (jQuery('#error').val() == 'true')
		return;
	url = path+"sfloor/pages/CategoriesScroll.aspx";
	jQuery.ajax({
		url: url,
		async: false,
		data: { cat: cat, subCat: subCat, pageNo: pageNo, PBrand: brand, PType: ptype, SortPrice: SortPrice, Range: Range },
        before: function () {
                jQuery('#loadImg').show();
                jQuery("#showMoreLink").hide();
            },
		error: function (err) {
			jQuery('#error').val('true');
			jQuery("#loadImg").hide();
            jQuery("#showMoreLink").text("No More items");
		},
        
	}).done(function (msg) {
           jQuery('#loadImg').hide();
           jQuery("#showMoreLink").show();
		if (jQuery(msg).filter("#categories").html() != undefined) {
		    jQuery("#categories").append(jQuery(msg).filter("#categories").html());
			jQuery("#pageNo").val(jQuery(msg).filter("#pageNo").val());
		}else{
           jQuery("#showMoreLink").text("No More items").show();
        }
	});
}

jQuery(document).ready(function () {
    //open popup
    jQuery("a[pop]").live('click', function () {
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

function ApplyPrevNext() {

    jQuery('[next]').live("click", function () {

        var selectEl = jQuery('ul[sku="' + jQuery(this).attr('next') + '"]').find(".disp").removeClass('disp');
        if (jQuery(selectEl).find('img').attr('src') == jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li:last').find('img').attr('src')) {
            jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li').hide('slow');
            jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li:first').show('slow').addClass('disp');
        } else {
            jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li').hide('slow');
            jQuery(selectEl).next().show('slow').addClass('disp'); ;
        }


    });
    jQuery('[prev]').live("click", function () {
        var selectEl = jQuery('ul[sku="' + jQuery(this).attr('prev') + '"]').find(".disp").removeClass('disp');
        if (jQuery(selectEl).find('img').attr('src') == jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li:first').find('img').attr('src')) {
            jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li').hide('slow');
            jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li:last').show('slow').addClass('disp');
        } else {
            jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li').hide('slow');
            jQuery(selectEl).prev().show('slow').addClass('disp'); ;
        }

    });

}
function getBrands(){
    var barndsList="";
    jQuery("input[type='checkbox'][brands]:checked").each(function(){
        barndsList+=""+jQuery(this).attr("brands").trim()+"~";
    });
    barndsList=barndsList.substring(0,barndsList.length-1);
    return barndsList;
}
        