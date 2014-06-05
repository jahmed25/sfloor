<%@ Page Title="" Language="C#"  CodeFile="wishlist.aspx.cs" Inherits="sfloor_pages_wishlist" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <%=Head %>
   </head>
   <body class=" cms-index-index cms-home">
      <div>
         <noscript>
            <div class="global-site-notice noscript">
               <div class="notice-inner">
                  <p>
                     <strong>JavaScript seems to be disabled in your browser.</strong><br />
                     You must have JavaScript enabled in your browser to utilize the functionality of
                     this website.
                  </p>
               </div>
            </div>
         </noscript>
         <div class="page">
            <%=Header %>
            <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/category.js'></script>
            <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/common1.js'></script>
            <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/etalage.css'/>
            <script>
                jQuery(document).ready(function () {
                    jQuery('.slider_wrapper').each(function (i) {
                        jQuery(this).find("ul li:first").addClass('disp');
                    });
                    jQuery('[next]').on("click", function () {

                        var selectEl = jQuery('ul[sku="' + jQuery(this).attr('next') + '"]').find(".disp").removeClass('disp');
                        if (jQuery(selectEl).find('img').attr('src') == jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li:last').find('img').attr('src')) {
                            jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li').hide('slow');
                            jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li:first').show().addClass('disp');
                        } else {
                            jQuery('ul[sku="' + jQuery(this).attr('next') + '"] li').hide('slow');
                            jQuery(selectEl).next().show('slow').addClass('disp'); ;
                        }


                    });
                    jQuery('[prev]').on("click", function () {
                        var selectEl = jQuery('ul[sku="' + jQuery(this).attr('prev') + '"]').find(".disp").removeClass('disp');
                        if (jQuery(selectEl).find('img').attr('src') == jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li:first').find('img').attr('src')) {
                            jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li').hide('slow');
                            jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li:last').show('slow').addClass('disp');
                        } else {
                            jQuery('ul[sku="' + jQuery(this).attr('prev') + '"] li').hide('slow');
                            jQuery(selectEl).prev().show('slow').addClass('disp'); ;
                        }

                    });
                });
            </script>
            <style>
               #overlay_form_quick
               {
               background: WHITE;
               z-index: 100000; border-radius:10px;
               }
               .background_overlay_quick
               {
               position: fixed;
               left: 0px;
               top: 0px;
               width: 100%;
               height: 100%;
               z-index: 100000;
               background: black;
               opacity: 0.9;
               }
            </style>
             <%if( favDT!=null && favDT.Rows.Count>0){ %>
            <div class="wishlist-main-container">
               <div class="wishlist-head"><span class="title">Wishlist &nbsp;<i><%=favDT.Rows.Count%></i>&nbsp; item(s)</span><span class="btnright">
                   <a class="addtocartbtn" name="btn_wish_cntshop" href="<%=ConfigUtil.hostURL() %>Home" >Continue Shopping</a>
                   <a class="addtocartbtn" name="btn_wish_viewcart" href="<%=ConfigUtil.hostURL() %>Add-To-Cart" >View Cart</a></span>
               </div>
               <%foreach(System.Data.DataRow r in favDT.Rows){ %>
               <div class="wishlist-container">
                  <span class="cross" title="Delete item" ></span>
                  <span class="wishlist-shade"></span>
                  <a class="wishlist-quick-view" pop='<%=r["SKUCode"]%>' ><span>Quick View</span></a>
                  <div class="slider_wrapper">
                     <ul id="image_slider" sku='<%=r["SKUCode"]%>' style='left:0px'>
                        <%if (!MFO.Utils.StringUtil.isNullOrEmpty((r["PathInternaldetailsSmallImage"] + ""))){%>
                        <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathInternaldetailsSmallImage"]%>'/> </li>
                        <%} %>

                        <%if (!MFO.Utils.StringUtil.isNullOrEmpty(r["PathUpperInternaldetailsSmallImage"] + "")) {%>
                        <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathUpperInternaldetailsSmallImage"]%>'/></li>
                        <%} %>

                        <%if (!MFO.Utils.StringUtil.isNullOrEmpty(r["PathLowerInternaldetailsSmallImage"] + "")){%>
                        <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathLowerInternaldetailsSmallImage"]%>'/></li>
                        <%} %>

                        <%if (!MFO.Utils.StringUtil.isNullOrEmpty(r["PathBackInternaldetailsSmallImage"] + "")) {%>
                        <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathBackInternaldetailsSmallImage"]%>'/></li>
                        <%} %>
                     </ul>
                     <span class="nvgt" prev='<%=r["SKUCode"]%>' name='pre' id='prev'></span>
                     <span class="nvgt" next='<%=r["SKUCode"]%>' name='next' id='next'></span>		
                  </div>
                  <ul id="pager">
                  </ul>
                  <div class="bottom">
                     <p class="brand"><span><%=r["SKUBrand"]%></span></p>
                     <p class="name"><span><%=r["SKUName"]%></span></p>
                     <p class="price"><span class="oldprice">Rs.&nbsp;<%=r["MRP"]%></span><span>Rs.&nbsp;<%=r["SpecialPrice"]%></span></p>
                     <p><a  class="addtocartbtn" name="btn_wish_addcrt" href="<%=ConfigUtil.hostURL() %><%=MFO.Utils.StringUtil.urlEncode(r["SKUName"]+"") %>?htm=<%=r["SKUCode"] %>"/>Buy now</a></p>
                  </div>
               </div>
               <%} %>
               <div  id="overlay_form_quick"  style="margin:0 auto; display:none;">
                  <div  style=" position:fixed; left:200px; top:10px; background:white; width:1000px; border-radius:10px; height:580px; ">
                     <a title="close" style="text-align:right; font-size:20px; color:red; float:right; margin-right:10px" id="closequickview" href="#">x</a>	
                     <object type="text/html" id='quickViewObj' style=" background:white; margin:0 auto;  width:1000px; border-radius:10px; height:580px; "></object>
                  </div>
               </div>
            </div>
            <%}else{ %>
                 <div class="wishlist-head"><br><span class="title" style='color:red'>There is zero item in your Wish List</span><br>
               </div>
            <%} %>
            <!-- End -->
            <%=Footer %>
         </div>
      </div>
      <div id="ajaxconfig_info" style="display: none">
         <button name="white" value="0.7">
         </button>
         <input id="enable_module" value="1" type="hidden">
      </div>
   </body>
</html>