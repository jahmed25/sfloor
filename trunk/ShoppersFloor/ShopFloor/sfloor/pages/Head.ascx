<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Head.ascx.cs" Inherits="sfloor_pages_Headl" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Shoppers floor</title>
<meta name="description" content="Default Description"/>
<meta name="keywords" content=""/>
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1"/>
<link rel="icon" href="" type="image/x-icon"/>
<script src="<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>

<script type="text/javascript">
    var staticPath = '<%=ConfigUtil.StaticPath() %>';
    var path = '<%=ConfigUtil.hostURL() %>';
    var serverPath = '<%=ConfigUtil.getServerPath() %>';
</script>
<script>

    jQuery(document).ready(function () {
       
        jQuery('.ajaxcartsuper-index-productview #mini_cart_block').hide(150);
        slideEffectAjax();

        //open popup
        jQuery("#log").on("click", function () {
            jQuery("#overlay_form").fadeIn(1000);
            jQuery(".background_overlay").fadeIn(500);
            positionPopup();
        });

        //close popup
        jQuery("#close, .background_overlay").on("click", function () {
            jQuery("#overlay_form").fadeOut(500);
            jQuery(".background_overlay").fadeOut(500);
        });
        jQuery(window).bind('resize', positionPopup);

        jQuery("[WL]").on('click', function () {
            var sku = jQuery(this).attr('sku');
            var param = { action: 'removeFromWL', sku: sku };
            jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx', data: param })
			    .success(function (msg) {
			        jQuery("[name='WLContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
			    });
        });
        jQuery("[cart]").on('click', function () {
            var sku = jQuery(this).attr('sku');
            var param = { action: 'removeFromCart', sku: sku };
            jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx', data: param })
			        .success(function (msg) {
			            jQuery("[name='cartContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
			        });
        });
        //maintain the popup at center of the page when browser resized
        jQuery("a[name='saveLater']").on('click', function () {
            var sku1 = jQuery(this).attr('sku');
            var inner = jQuery(this).attr('inner')
            jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=addFav', data: { sku: sku1} })
			.success(function (msg) {
			    reloadWL();
			});
        });
        //---------------
        
        //---------------
        //open popup
        jQuery('#checkoutlogin').on("click", function () {
            jQuery("#checkout_overlay_form").fadeIn(1000);
            jQuery(".checkout_background_overlay").fadeIn(500);
            checkout_positionPopup();
        });
        //close popup
        jQuery("#close, .checkout_background_overlay").on("click", function () {
            jQuery("#checkout_overlay_form").fadeOut(500);
            jQuery(".checkout_background_overlay").fadeOut(500);
        });
        jQuery(window).bind('resize', checkout_positionPopup);

        //open popup
        jQuery('#fgt_clk_hre').on("click", function () {
            jQuery("#overlay_form").fadeOut(500);
            jQuery(".background_overlay").fadeOut(500);
            jQuery("#checkout_overlay_form").fadeOut(500);

            jQuery(".checkout_background_overlay").fadeOut(500);
            jQuery("#fgt_overlay_form").fadeIn(1000);
            jQuery(".fgt_background_overlay").fadeIn(500);
            fgt_positionPopup();
        });
        jQuery('#logsign').on("click", function () {
            jQuery("#fgt_overlay_form").fadeOut(1000);
            jQuery(".fgt_background_overlay").fadeOut(500);
            jQuery("#checkout_overlay_form").fadeIn(500);

            jQuery(".checkout_background_overlay").fadeIn(500);

            jQuery("#overlay_form").fadeIn(500);
            jQuery(".background_overlay").fadeIn(500);
            fgt_positionPopup();
        });
        //close popup
        jQuery("#fgt_close, .fgt_background_overlay").on("click", function () {
            jQuery("#fgt_overlay_form").fadeOut(500);
            jQuery(".fgt_background_overlay").fadeOut(500);
        });
        jQuery(window).bind('resize', fgt_positionPopup);

    });
</script>
<link rel="shortcut icon" href="" type="image/x-icon" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/css.css' type="text/css"   media="all" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/custommenu.css'  type="text/css" media="screen" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/shoppersfloor.css' type="text/css"  media="all" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' type="text/css" />

<!--[if lt IE 8]>
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/ie6.css' media="all" />
    <![endif]-->
<!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/ie8.css' media="all" />
    <![endif]-->
<!--[if lt IE 7]>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ie7.js'></script>
    <![endif]-->
<!-- MENU -->



<!--For Header.ascx Start-->
<link href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' rel="stylesheet" type="text/css" />
<!--For Header.ascx End -->


<!-- For Menu.axcx  Start-->
<%--<link href='<%=ConfigUtil.StaticPath() %>new-css/internalpage.css' rel="stylesheet"  type="text/css" />--%>
<!-- For Menu.axcx  End-->

<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/sfloorall.js'></script>
<!-- For Menu.axcx  Start-->
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
<!-- For Menu.axcx  End-->



<!-- For Menu.axcx  Start-->
<style>
   #overlay_form
   {
   background: WHITE;
   z-index: 100000;
   }
   .background_overlay
   {
   position: fixed;
   left: 0px;
   top: 0px;
   width: 100%;
   height: 100%;
   z-index: 100000;
   background: black;
   opacity: 0.8;
   }
   #fgt_overlay_form
   {
   background: WHITE;
   z-index: 100000;
   }
   .fgt_background_overlay
   {
   position: fixed;
   left: 0px;
   top: 0px;
   width: 100%;
   height: 100%;
   z-index: 100000;
   background: black;
   opacity: 0.8;
   }
   .css-form input.ng-invalid.ng-dirty
   {
   border: 2PX SOLID #FA787E;
   }
   .css-form input.ng-valid.ng-dirty
   {
   border: 2PX SOLID #78FA89;
   }
   .css-form .help-block
   {
   color: #FA787E;
   font-size: 12px;
   }
</style>
<!--For Menu.ascx End-->


<!--For Header.ascx Start-->
<script type="text/javascript">
    function clearCart() {
        jQuery.ajax({ method: 'POST', url: path + "sfloor/pages/AjaxService.aspx?action=clearCart" })
   .success(function (msg) {
       jQuery("#cartDiv").html("<p style='color:red'>Your Cart Is Empty</p>")
       jQuery("#cCount").text("0");
       if (pageType == 'addToCart') {
           jQuery('.addtocartmain').html("<center><p style='color:red'>All item(s) has been Deleted from your Cart</center>")
       }

   });
    }
    function clearFav() {
        jQuery.ajax({ method: 'POST', url: path + "sfloor/pages/AjaxService.aspx?action=clearFav" })
   .success(function (msg) {
       jQuery("#wishListDiv").html("<p style='color:red'>Your Wish List Is Empty</p>")
       jQuery("#favCount").text("0");

   });
    }
</script>
<!--For Header.ascx End-->
<script>
function slideEffectAjax() {
    jQuery('.top-cart-contain').mouseenter(function () {
        jQuery(this).find(".top-cart-content").stop(true, true).show();
    });
    //hide submenus on exit
    jQuery('.top-cart-contain').mouseleave(function () {
        jQuery(this).find(".top-cart-content").stop(true, true).hide();
    });
}
//jQuery(document).ready(function () {
//    alert("Supercart");
//    
//    jQuery('.ajaxcartsuper-index-productview #mini_cart_block').hide(150);
//    slideEffectAjax();
//});
</script>

<!--Common1.js Start -->
<script type="text/javascript">
    function reloadWL() {
        jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/ReloadWL.aspx' })
			.success(function (msg) {
			    jQuery("[name='WLContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
			});
    }
    //position the popup at the center of the page
    function positionPopup() {
        if (!jQuery("#overlay_form").is(':visible')) {
            return;
        }
        jQuery("#overlay_form").css({
            left: (jQuery(window).width() - jQuery('#overlay_form').width()) / 2,
            top: (jQuery(window).width() - jQuery('#overlay_form').width()) / 7,
            position: 'absolute'
        });
    }

  
    //position the popup at the center of the page
    function checkout_positionPopup() {
        if (!jQuery("#checkout_overlay_form").is(':visible')) {
            return;
        }
        jQuery("#checkout_overlay_form").css({
            left: (jQuery(window).width() - jQuery('#checkout_overlay_form').width()) / 2,
            top: (jQuery(window).width() - jQuery('#checkout_overlay_form').width()) / 7,
            position: 'absolute'
        });
    }
    //position the popup at the center of the page
    function fgt_positionPopup() {
        if (!jQuery("#fgt_overlay_form").is(':visible')) {
            return;
        }
        jQuery("#fgt_overlay_form").css({
            left: (jQuery(window).width() - jQuery('#fgt_overlay_form').width()) / 2,
            top: (jQuery(window).width() - jQuery('#fgt_overlay_form').width()) / 7,
            position: 'absolute'
        });
    }

</script>
<!-- Common1.js End-->