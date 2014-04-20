<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageLayout.master"
    AutoEventWireup="true" EnableEventValidation="false" EnableViewStateMac="false"
    ViewStateEncryptionMode="Never" CodeFile="AddToCart.aspx.cs" Inherits="sfloor_pages_AddToCart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/addtocart.css">
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var cartstick = $jq('.addtocart-stick').offset().top - 50;
            $jq(window).scroll(function () {
                if ($jq(window).scrollTop() > cartstick) {
                    $jq('.addtocart-stick').addClass("addtocart-sticky");
                } else {
                    $jq('.addtocart-stick').removeClass("addtocart-sticky");
                }
            });

            $.each($('select[qty]'), function () {
                var selct = this;
                $(this).find("option[value='" + $(selct).attr('qty') + "']").attr('selected', 'selected');
            });
            $("select").on('change', function () {
                var sku = $(this).attr('sku');
                var qty = $(this).find('option:selected').val();
                $.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=updateQty', data: { sku: sku, qty: qty} })
					.success(function (msg) {
					    var json = $.parseJSON(msg);
					    if (json.error != null) {
					        $("span[name='error'][sku='" + sku + "']").text(json.error);
					    } else {
					        $("[name='subTotal'][sku='" + sku + "']").text(json.subTotal);
					        $("[name='gTotal']").text(json.total);
					    }
					});
            });
            $("[removefromWL]").on("click", function () {
                var sku = $(this).attr('removefromWL')
                $.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=removeFromCart', data: { sku: sku} })
					.success(function (msg) {
					    if ($('.cartitem').length == 1) {
					        $('.addtocartmain').html("<center><p style='color:red'>Your Cart Is Empty!!!<p></center>")            
					    } else {
					        $('div[sku="' + sku + '"]').remove();
					    }
					});
            });
        });
    </script>
    <div style="height:auto" >
    <div class="addtocartmain">
     <%if (!MFO.Commom.CommonUtil.DT.isEmptyOrNull(cartDT))
       {%> 
        <div class="head addtocart-stick">
         <a  name="cnt_toshop" href="<%=ConfigUtil.hostURL() %>Women/Clothing">Continue to shopping</a> 
        <a name="pcd_tochk" href='<%=ConfigUtil.hostURL() %>check-out'>Proceed to checkout</a>
       <h1><div class="total"><span>Total Rs.</span>
        <span name='gTotal' class="grandtot"><%=total%></span>
        </div></h1>
        </div>
        <!--start loop-->
      <%for (int i = 0; i < cartDT.Rows.Count; i++)
        { %>
        <div class="cartitem" sku='<%=cartDT.Rows[i]["SKU"]%>'>
            <div class="addtocartmain_img"><img src="<%=ConfigUtil.getServerPath() %><%=cartDT.Rows[i]["PathInternaldetailsSmallImage"] %>" /></div>
            <div class="list">
                <ul>
                    <li class="brand"><%=cartDT.Rows[i]["SKUBrand"]%></li>
                    <li><%=cartDT.Rows[i]["SKUName"]%></li>
                    <li>SKU : <%=cartDT.Rows[i]["SKU"]%></li>
                    <li class="price"><span>Rs.</span><span><%=cartDT.Rows[i]["UNIT_PRICE"]%> /Unit</span></li>
                    <li class="varient">
                        <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Color"] + ""))
                          {%>
                            <span>Color:</span><em><%=cartDT.Rows[i]["Color"]%></em>
                         <%} %>
                        <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Size"] + ""))
                          {%>
                         <span>Size:</span><em><%=cartDT.Rows[i]["Size"]%></em>
                         <%} %>
                        <% string status = MFO.Utils.StringUtil.checkInventrory(cartDT.Rows[i]["Inventory"] + "", cartDT.Rows[i]["QTY"] + ""); %>
                        <% if (status == "available")
                           {%>
                            <span>Quantity:</span><em>
                                <select qty='<%=cartDT.Rows[i]["QTY"]%>' sku='<%=cartDT.Rows[i]["SKU"]%>'>
                                    <%for (int j = 1; j <= float.Parse(cartDT.Rows[i]["Inventory"] + ""); j++)
                                      {%>
                                        <option value='<%=j %>'><%=j%></option>
                                        <%} %>
                                </select>
                                    <span name='error' sku='<%=cartDT.Rows[i]["SKU"]%>'></span>
                                </em>
                            
                        <%}
                           else if (status == "Sold Out")
                           {%>
                            <span style='color:red'> Oops!! Sorry, this items is sold out<//span>
                              <em>  <span style='color:Green'> We will notifiy you as soon as  this item will available. </span>
                                <span style='color:red'> You need to remove this item from cart if wish to checkout</span>
                            </em>
                        <%}
                           else
                           { %>
                             <span>Quantity:</span><em>
                                <select ng-change='changeQty()' sku='<%=cartDT.Rows[i]["SKU"]%>'>
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
                    <li class="rem_sfl"><span><a href="#" removefromWL='<%=cartDT.Rows[i]["SKU"]%>'>Remove</a></span>
                    <span><a href="#" name='saveLater' sku="<%=cartDT.Rows[i]["SKU"] %>">Save for later</a></span></li>
                </ul>
            </div>
            <div class="estimated"><span>Estimated Delivery</span><ul><li>Delivered in 3-6 days</li></ul>
            <span>Return Policy</span><ul><li><%=cartDT.Rows[0]["ShippingReturns"]%></li></ul></div>
            <div class="totprice">Sub Total Rs.<span name='subTotal' sku='<%=cartDT.Rows[i]["SKU"]%>'><%=cartDT.Rows[i]["TOTAL"]%></span></div>
        </div>
      <%} %>
        
        <!--end loop-->
        <div class="cont_toshop_tot">
        <div class="cont_toshop">
        <a  name="cnt_toshop" href="<%=ConfigUtil.hostURL() %>Women/Clothing">Continue to shopping</a> 
        <a name="pcd_tochk" href='<%=ConfigUtil.hostURL() %>check-out'>Proceed to checkout</a>
        </div>
        <div class="total"><span>Total Rs.</span>
        <span name='gTotal' class="grandtot"><%=total%></span>
        </div>
        </div>
        <%}else{ %>
            <center><p style='color:red'>Your Cart is Empty!!</p></center>
        <%} %>
        </div>
         
         </div>
    
</asp:Content>
