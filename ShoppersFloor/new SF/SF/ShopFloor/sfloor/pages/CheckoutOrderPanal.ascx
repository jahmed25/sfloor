<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CheckoutOrderPanal.ascx.cs" Inherits="OrderSummary" %>

<script>
    $("[qtyUpdate]").on("change", function () {
        var sku = $(this).attr('qtyUpdate');
        var qty = $(this).val();
        $.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=updateQty', data: { sku: sku, qty: qty} })
					.success(function (msg) {
					    window.location = path + 'check-out';
					});
    });
    $("[remove]").on("click", function () {
        var sku = $(this).attr('sku')
        $.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=removeFromCart', data: { sku: sku} })
					.success(function (msg) {
					    window.location = path + 'check-out';
					});

    });
</script>
<div class="order-summary">
    <div class="order-summary_head">Order Summary</div>
   <%if (!MFO.Commom.CommonUtil.DT.isEmptyOrNull(cartDT))
     { %>
    <table><thead class="header">
            <tr>
                <th>Product</th>
             	<th>Qty</th>
                <th>Delivery</th>
                <th class="price-col">Price</th>
            </tr></thead>
		<!--Loop content-->
		 <%for (int i = 0; i < cartDT.Rows.Count; i++)
        {    %>
        <%if (invDic.ContainsKey(cartDT.Rows[i]["SKU"] + "")){ %>
            <tr>
                <td colspan='3'> <span style="color:Red"><%=invDic[cartDT.Rows[i]["SKU"] + ""]%> </span></td>
                <td>
                    <a class='class="rem_sfl"'href='#' remove sku='<%=cartDT.Rows[i]["SKU"] %>'>Remove</a>
                </td>          
            </tr>
        <%} %>
		<tr class="order_cont">
                <td class="image_sec"><img alt="" src="<%=ConfigUtil.getServerPath() %><%=cartDT.Rows[i]["PathInternaldetailsSmallImage"] %>"><br>
                <p class=""><%=cartDT.Rows[i]["SKUBrand"]%></p>
                <p class="name"><%=cartDT.Rows[i]["SKUName"]%></p>
                <p class="name"><%=cartDT.Rows[i]["SKU"]%></p>
                <p class=""> 
                <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Size"] + ""))%>
                    <span> Size : <%=cartDT.Rows[i]["Size"]%></span>
                <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Color"] + ""))%>
                    <span> Color :  <%=cartDT.Rows[i]["Color"]%>  </span></p>
                </td>
                <td class="">
                    <%if (invDic.ContainsKey(cartDT.Rows[i]["SKU"] + "")){ %>
                      <input type='text' maxlength='3' size='3' qtyUpdate='<%=cartDT.Rows[i]["SKU"]%>' value='<%=cartDT.Rows[i]["QTY"]%>' />
                    <%} else{ %>
                        <%=cartDT.Rows[i]["QTY"]%>
                     <%} %>
                 </td>
                <td class="">3-6<small class="">Business days</small></td>
                <td class=""><%=cartDT.Rows[i]["TOTAL"]%></td>
        </tr>
        <%} %>
        <!--End loop-->
		<tr  class="subtotal">
                <td colspan="3">Subtotal</td>
                 <td><%=subTotal%></td>
            </tr>
            <tr class="subtotal">
              <td colspan="3" class="">Cash on Delivery Charges</td>
                    <td class="">Available</td>
			</tr>
			<tr class="subtotal">
			        <td colspan="3" class="">Shipping Charges</td>
                    <%if (ConfigUtil.getValue("ShippigCharge") == "0"){ %>
                        <td class="shipping">FREE SHIPPING</td>
                    <%}else{ %>
                        <td class="shipping"><%=ConfigUtil.getValue("ShippigCharge")%></td>
                    <%} %>
			</tr>
            <tr class="total">
                <td colspan="3">Total</td>
                <td class="sel-total">Rs.<%=total%></td>
            </tr>
    </table>
    <%}else{ %>
        <p style="color:red">Your Cart is empty</p>        
    <%} %>
	</div>