<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Head.ascx.cs" Inherits="sfloor_pages_Headl" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Shoppers floor</title>
<meta name="description" content="Default Description"/>
<meta name="keywords" content=""/>
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1"/>
<link rel="icon" href="" type="image/x-icon"/>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/jquery-ui.css?v=10002"/>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/owl.carousel.js?v=10002"></script>
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/owl.carousel.css?v=10002"/>
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/owl.theme.css?v=10002"/>
 
<%--      <script type="text/javascript">
          jQuery(document).ready(function () {
              if (jQuery.browser.msie) {
                  if (jQuery.browser.version == '6.0') {
                      jQuery('body').addClass('ie9');
                      alert('Upgrade ur browser upto ie10');
                  }
                  else if (jQuery.browser.version == '7.0') {
                      jQuery('body').addClass('ie9');
                      alert('Upgrade ur browser upto ie10');
                  }
                  else if (jQuery.browser.version == '8.0') {
                      jQuery('body').addClass('ie9');
                      alert('Upgrade ur browser upto ie10');
                  }
                  else if (jQuery.browser.version == '9.0') {
                      jQuery('body').addClass('ie9');
                      alert('Upgrade ur browser upto ie10');
                  }
              }
              else if (jQuery.browser.webkit) {
              }
              else if (jQuery.browser.mozilla) {
              }
              else if (jQuery.browser.opera) {
              }
          });</script>
--%><script type="text/javascript">
    var staticPath = '<%=ConfigUtil.StaticPath() %>';
    var path = '<%=ConfigUtil.hostURL() %>';
    var serverPath = '<%=ConfigUtil.getServerPath() %>';
</script>
<script type="text/javascript">
    function removeWLItem(sku) {
      var param = { action: 'removeFromWL', sku: sku };
      jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx', data: param })
			    .success(function (msg) {
			        jQuery("[name='WLContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
			        if (jQuery(".wishlist-container[sku='" + sku +"' ]").length > 0) {
                        if(jQuery(".wishlist-container").size()==1){
                              jQuery(".wishlist-head").html("<center><br><br> <span style='color:red'>There zero item in your Wishlist !!</span><br><br></center>").after("<br>");
                          }
                          jQuery(".wishlist-container[sku='" + sku + "' ]").remove();

			        }
			    });
              }

              jQuery(document).ready(function () {

                  jQuery("body").hide().fadeIn(2000);
                  var cache = {}, lastXhr;
                  jQuery("[searchbtn]").live("click", function () {
                      window.location = path + "Search?searchId=" + jQuery("#searchId").val() + "&searchType=" + jQuery("#searchType").val();
                  });
                  jQuery("#search").live("enter", function () {
                      window.location = path + "Search?searchId=" + jQuery("#searchId").val() + "&searchType=" + jQuery("#searchType").val();
                  });
                  jQuery("#search").autocomplete({
                      source: function (request, response) {
                          var searchKey = jQuery("#search").val();
                          if (searchKey in cache) {
                              response(cache[searchKey]);
                              return;
                          }

                          lastXhr = jQuery.ajax({
                              type: "POST",
                              url: path + 'sfloor/pages/AjaxService.aspx?action=search',
                              data: { searchKey: searchKey },
                              success: function (data, status, xhr) {
                                  var results;
                                  if (xhr === lastXhr) {
                                      results = jQuery.map(data, function (el, index) {

                                          return {
                                              searchVal: el.SearchVal,
                                              name: el.Name,
                                              img: el.Src,
                                              type: el.Type
                                          };
                                      });
                                      cache[searchKey] = results;
                                      response(results);
                                  }

                              },
                              error: function (msg) {
                                 // alert(msg.status + ' ' + msg.statusText);
                              }
                          });
                      },
                      select: function (event, ui) {
                          //window.location = path + "Search?Pid=" + ui.item.pid;
                          this.value = ui.item.name;
                          if (jQuery("#searchId").length == 0) {
                              jQuery("body").append("<input type='hidden' id='searchId' value='" + ui.item.searchVal + "' />");
                              jQuery("body").append("<input type='hidden' id='searchType' value='" + ui.item.type + "' />");

                          } else {
                              jQuery("#searchId").val(ui.item.searchId);
                              jQuery("#searchType").val(ui.item.type);
                          }
                          return false;
                      }
                  }).data("ui-autocomplete")._renderItem = function (ul, item) {

                      if (item.type == "product") {
                          if (jQuery(ul).find("#search_prod").length == 0)
                              jQuery(ul).append("<li><div style='text-align:left; background-color:#F1F1F1' id='search_prod'><B>Products</B><div></li>");
                          return jQuery("<li />")
								.append("<a style='text-overflow: ellipsis;' type='" + item.type + "' sku='" + item.searchVal + "'><img src='" + serverPath + item.img + "' height='60px' width='60px' />" + item.name + "</a>")
							.appendTo(ul);
                      }
                      else if (item.type == "category") {
                          if (jQuery(ul).find("#search_cat").length == 0)
                              jQuery(ul).append("<li><div style='text-align:left;background-color:#F1F1F1' id-'search_cat'><B>Categories</B><div></li>")
                          return jQuery("<li />")
								.append("<a style='text-overflow: ellipsis;' type='" + item.type + "' sku='" + item.searchVal + "'>" + item.name + " </a>")
							.appendTo(ul);
                      }
                      else if (item.type == "Brand") {
                          if (jQuery(ul).find("#search_brand").length == 0)
                              jQuery(ul).append("<li><div style='text-align:left;background-color:#F1F1F1' id-'search_brand'><B>Brands</B><div></li>")
                          return jQuery("<li />")
								.append("<a style='text-overflow: ellipsis;' type='" + item.type + "' sku='" + item.searchVal + "'>" + item.name + " </a>")
							.appendTo(ul);
                      }
                      else if (item.type == "subcategory") {
                          if (jQuery(ul).find("#search_subCat").length == 0)
                              jQuery(ul).append("<li><div style='text-align:left;background-color:#F1F1F1' id-'search_subCat'><B>Sub-Categories</B><div></li>")
                          return jQuery("<li />")
								.append("<a style='text-overflow: ellipsis;' type='" + item.type + "' sku='" + item.searchVal + "'>" + item.name + " </a>")
							.appendTo(ul);
                      }
                      return ul;
                  };

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

                  jQuery("[WL]").live('click', function () {
                      var sku = jQuery(this).attr('sku');
                      removeWLItem(sku);
                  });
                  jQuery("[cart]").live('click', function () {
                      var sku = jQuery(this).attr('sku');
                      var param = { action: 'removeFromCart', sku: sku };
                      jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx', data: param })
			        .success(function (msg) {
			            jQuery("[name='cartContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
			        });
                  });
                  //maintain the popup at center of the page when browser resized
                  jQuery("a[name='saveLater']").live('click', function () {

                      var sku1 = jQuery(this).attr('sku');
                      var inner = jQuery(this).attr('inner');
                      jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=toggleFav', data: { sku: sku1} })
			        .success(function (msg) {
			            if (msg.status == 'done')
			                reloadWL(sku1);
			            else
			                alert("Opps!! something went wrong, Please try again");
			        });
                  });

                  //---------------

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
                  jQuery('#logsign').live("click", function () {
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
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/css.css?v=10001' type="text/css"   media="all" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/custommenu.css?v=10002'  type="text/css" media="screen" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/shoppersfloor.css?v=10002' type="text/css"  media="all" />

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
<link href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css?v=10001' rel="stylesheet" type="text/css" />
<!--For Header.ascx End -->


<!-- For Menu.axcx  Start-->
<%--<link href='<%=ConfigUtil.StaticPath() %>new-css/internalpage.css' rel="stylesheet"  type="text/css" />--%>
<!-- For Menu.axcx  End-->

<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/sfloorall.js?v=10002'></script>
<!-- For Menu.axcx  Start-->
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js?v=10002'></script>
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
   z-index: 10000;
   background:rgba(0, 0, 0, 0.7);
   }
   .background_overlay_cat
   {
   position: fixed;
   left: 0px;
   top: 0px;
   width: 100%;
   height: 100%;
   z-index: 100000;

   background:rgba(0, 0, 0, 0.7);
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
   background:rgba(0, 0, 0, 0.7);
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
       if (jQuery(".wishlist-head").length > 0) {
           jQuery(".wishlist-container").remove();
           jQuery(".wishlist-head").html("<center><br><br> <span style='color:red'>There zero item in your Wishlist !!</span><br><br></center>").after("<br>");
       }
   });
    }
</script>
<!--For Header.ascx End-->
<%--<script>
function slideEffectAjax() {
    jQuery('.top-cart-contain').mouseenter(function () {
        jQuery(this).find(".top-cart-content").show();
        if (jQuery("#dontHide").length > 0) {
           jQuery("#dontHide").remove();
        }
    });
    //hide submenus on exit
   jQuery('.top-cart-contain').mouseout(function (e) {
    
        if (jQuery("#dontHide").length == 0) {
            jQuery(this).find(".top-cart-content").hide();
        }
    });
}
jQuery(document).ready(function () {
    slideEffectAjax();
});
</script>
--%><script>
    function slideLogin() {
        jQuery('.top-cart-contain, .acc_sec').mouseenter(function () {
            jQuery(this).find(".top-cart-content").stop(true, true).show();
        });
        //hide submenus on exit
        jQuery('.top-cart-contain, .acc_sec').mouseleave(function () {
            jQuery(this).find(".top-cart-content").stop(true, true).hide();
        });
    }

jQuery(document).ready(function () {
   // jQuery('.ajaxcartsuper-index-productview #mini_cart_block').hide(150);
    slideLogin();
});
</script>

<!--Common1.js Start -->
<script type="text/javascript">
    function reloadWL(sku) {
        jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/ReloadWL.aspx' })
			.success(function (msg) {
			    if (jQuery("[name='WLContainer']").length > 0)
			        jQuery("[name='WLContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
			    else
			        window.top.jQuery("[name='WLContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
			    jQuery("#wishListDiv").show();
			    jQuery("#wlNotificationInfo").show('slow');
			    toggleClass(jQuery("[name='saveLater'][sku='" + sku + "']"));
			    
			});
    }
    function toggleClass(tag) {
        if (jQuery(tag).hasClass('wish-list1')) {
            jQuery(tag).removeClass('wish-list1');
            jQuery(tag).addClass('wishlist-active');
            jQuery(tag).find('span').text('Remove From WishList');
        } else {
            jQuery(tag).removeClass('wishlist-active');
            jQuery(tag).addClass('wish-list1');
            jQuery(tag).find('span').text('Save For Later');
        }
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
    jQuery(function () {
        jQuery("#acc_sec").hover(function () {
            jQuery(".background_overlay").fadeIn(500);
            jQuery(".acc_menu").slideToggle(400);
        },
           function () {
               jQuery(".background_overlay").fadeOut(500);
               jQuery(".acc_menu").hide();
           }
      );
    });
</script>
<!-- Common1.js End-->