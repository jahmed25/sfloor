<%@ Page Language="C#" CodeFile="AddToCart.aspx.cs"
   Inherits="sfloor_pages_AddToCart"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <%=Head %>
      <link rel="stylesheet"
         href="<%=ConfigUtil.StaticPath() %>new-css/addtocart.css"/>
      <script type="text/javascript"
         src='<%=ConfigUtil.StaticPath() %>new-js/fixsidemenu.js'></script>
      <script type="text/javascript">
          var pageType = 'addToCart';
          function reloadCart() {
              jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/ReloadCart.aspx' })
         .success(function (msg) {
             jQuery("[name='cartContainer']").html(jQuery(msg).filter('#mini_cart_block').html());
         });
          }
          jQuery(document).ready(function () {
              jQuery.each(jQuery('select[qty]'), function () {
                  var selct = this;
                  jQuery(this).find("option[value='" + jQuery(selct).attr('qty') + "']").attr('selected', 'selected');
              });
              jQuery("select").on('change', function () {
                  var sku = jQuery(this).attr('sku');
                  var qty = jQuery(this).find('option:selected').val();
                  jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=updateQty', data: { sku: sku, qty: qty} })
         .success(function (msg) {
             var json = msg; //JSON.parse(msg);
             if (json.error != null) {
                 jQuery("span[name='error'][sku='" + sku + "']").text(json.error);
             } else {
                 jQuery("[name='subTotal'][sku='" + sku + "']").text(json.subTotal);
                 jQuery("[name='gTotal']").text(json.total);
                 reloadCart();
             }
         });
              });
              jQuery("[removefromWL]").on("click", function () {
                  var sku = jQuery(this).attr('removefromWL')
                  jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=removeFromCart', data: { sku: sku} })
                    .success(function (msg) {
                        if (jQuery('.cartitem').length == 1) {
                            jQuery('.addtocartmain').html("<center><p style='color:red'>Your Cart Is Empty!!!<p></center>")
                        } else {
                            jQuery('div[sku="' + sku + '"]').remove();
                        }
                        jQuery("[name='cartContainer']").html(jQuery(msg).filter('#mini_cart_block').html()); ;
                    });
              });
              jQuery("[type='checkout']").on("click", function () {
                  jQuery.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=checkInventory' })
         .success(function (json) {
             if (json.length > 0) {
                 for (i = 0; i < json.length; i++)
                     jQuery("span[name='error'][sku='" + json[i].sku + "']").text(json[i].error);
             } else {
                 window.location = path + 'check-out';
             }
         });
              });
          });
      </script>
   </head>
   <body class=" cms-index-index cms-home">
    <a href="#" onclick="window.history.back();">Back</a>
      <div>
         <div class="page">
            <div style="height: auto;">
               <div class="addtocartmain">
                  <%if (!MFO.Commom.CommonUtil.DT.isEmptyOrNull(cartDT))
                     {%> <!--start loop--> <%for (int i = 0; i < cartDT.Rows.Count; i++)
                     { %>
                  <div class="cartitem" sku='<%=cartDT.Rows[i]["SKU"]%>'>
                     <div class="addtocartmain_img"><img
                        src="<%=ConfigUtil.getServerPath() %><%=cartDT.Rows[i]["PathInternaldetailsSmallImage"] %>" /></div>
                     <div class="list">
                        <ul>
                           <li class="brand"><%=cartDT.Rows[i]["SKUBrand"]%></li>
                           <li><%=cartDT.Rows[i]["SKUName"]%></li>
                           <li>SKU : <%=cartDT.Rows[i]["SKU"]%></li>
                           <li class="price"><span>Rs.</span><span><%=cartDT.Rows[i]["UNIT_PRICE"]%>
                              /Unit</span>
                           </li>
                           <li class="varient">
                              <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Color"] + ""))
                                 {%> <span>Color:</span><em><%=cartDT.Rows[i]["Color"]%></em>
                              <%} %> <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Size"] + ""))
                                 {%> <span>Size:</span><em><%=cartDT.Rows[i]["Size"]%></em>
                              <%} %> <% string status = MFO.Utils.StringUtil.checkInventrory(cartDT.Rows[i]["Inventory"] + "", cartDT.Rows[i]["QTY"] + ""); %>
                              <% if (status == "available")
                                 {%> <span>Quantity:</span>
                              <em>
                                 <select
                                    qty='<%=cartDT.Rows[i]["QTY"]%>' sku='<%=cartDT.Rows[i]["SKU"]%>'>
                                    <%for (int j = 1; j <= float.Parse(cartDT.Rows[i]["Inventory"] + ""); j++)
                                       {%>
                                    <option value='<%=j %>'><%=j%></option>
                                    <%} %>
                                 </select>
                                 <span name='error' sku='<%=cartDT.Rows[i]["SKU"]%>'></span> 
                              </em>
                              <%}
                                 else if (status == "Sold Out")
                                 {%> <span style='color: red'> Oops!!
                              Sorry, this items is sold out<//span> <em> <span style='color: Green'>
                              We will notifiy you as soon as this item will available. </span> <span
                                 style='color: red'> You need to remove this item from cart if
                              wish to checkout</span> </em> <%}
                                 else
                                 { %> <span>Quantity:</span>
                              <em>
                                 <select
                                    ng-change='changeQty()' sku='<%=cartDT.Rows[i]["SKU"]%>'>
                                    <option value='' selected>--Select--</option>
                                    <%for (int j = 1; j <= float.Parse(cartDT.Rows[i]["Inventory"] + ""); j++)
                                       {%>
                                    <option value='<%=j %>'><%=j%></option>
                                    <%} %>
                                 </select>
                                 <span name='error' sku='<%=cartDT.Rows[i]["SKU"]%>'></span> 
                              </em>
                              <% }%>
                           </li>
                           <li class="rem_sfl"><span><a href="#"
                              removefromWL='<%=cartDT.Rows[i]["SKU"]%>'>Remove</a></span> <span><a
                              href="#" name='saveLater' sku="<%=cartDT.Rows[i]["SKU"] %>">Save
                              for later</a></span>
                           </li>
                        </ul>
                     </div>
                     <div class="estimated">
                        <span>Estimated Delivery</span>
                        <ul>
                           <li>Delivered in 3-6 days</li>
                        </ul>
                        <span>Return Policy</span>
                        <ul>
                           <li><%=cartDT.Rows[0]["ShippingReturns"]%></li>
                        </ul>
                     </div>
                     <div class="action"><a href='#'
                        removefromWL='<%=cartDT.Rows[0]["SKU"]%>'>Remove</a></div>
                     <div class="totprice">Sub Total Rs.<span name='subTotal'
                        sku='<%=cartDT.Rows[i]["SKU"]%>'><%=cartDT.Rows[i]["TOTAL"]%></span></div>
                  </div>
                  <%} %> <!--end loop-->
                  <div class="cont_toshop_tot">
                     <div class="cont_toshop"><a name="cnt_toshop"
                        href="<%=ConfigUtil.hostURL() %>Women/Clothing">CONTINUE SHOPPING</a> <a
                        name="pcd_tochk" type='checkout' href='#'>ORDER NOW</a></div>
                     <div class="total"><span>Total Rs.</span> <span name='gTotal'
                        class="grandtot"><%=total%></span></div>
                  </div>
                  <%}else{ %>
                  <center>
                     <p style='color: red'>Your Cart is Empty!!</p>
                  </center>
                  <%} %>
               </div>
            </div>
         </div>
      </div>
      <div id="ajaxconfig_info" style="display: none">
         <button name="white" value="0.7"></button>
         <input id="enable_module" value="1" type="hidden">
      </div>
   </body>
</html>