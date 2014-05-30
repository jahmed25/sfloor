<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReloadCart.aspx.cs" Inherits="sfloor_pages_ReloadCart" %>
<div id="mini_cart_block">
   <div class="icon-cart-big">
      <a class="cart-url" href='<%=ConfigUtil.hostURL() %>Add-To-Cart'><span><span class="atccount"><b id='cCount'><%=cartDT.Rows.Count%></b></span></a></span></a>
   </div>
   <div class="block-cart mini_cart_ajax">
      <!--<span class="top-cart-icon"></span>-->
      <span class="top-cart-title" >My Cart </span><span class="cart-arrow"></span>
      <div style="display: none;" class="top-cart-content" id='cartDiv'>
         <%if (cartDT.Rows.Count > 0)
            { %>
         Total :<span class="price"><%=total%></span>&nbsp;&nbsp;<a href="<%=ConfigUtil.hostURL() %>Add-To-Cart" style='color:blue'>View ALL</a>&nbsp;&nbsp;<a  style='color:blue' href="<%=ConfigUtil.hostURL() %>Checkout">Checkout</a> <a href="#" style="float:right;color:red" onclick="clearCart()">Clear All</a>
         <%for (int i = 0; i < cartDT.Rows.Count; i++)
            { %>
         <div class="wishlist-content">
            <a class="imglist" href='<%=ConfigUtil.hostURL() %>Add-To-Cart' title='<%=cartDT.Rows[i]["SKUName"]%>'>
            <img  src='<%=ConfigUtil.getServerPath() %><%=cartDT.Rows[i]["PathInternaldetailsSmallImage"] %>' /></a>
            <div class="main-cont">
               <p class="brand"><%=cartDT.Rows[i]["SKUBrand"]%></p>
               <p class="empty"><%=cartDT.Rows[i]["SKUName"]%></p>
               <p class="subtotal">
                  SKU : <span class="price">Rs.   <%=cartDT.Rows[i]["SKU"]%></span><br />
                  Unit Price <span class="price">Rs.   <%=cartDT.Rows[i]["UNIT_PRICE"]%></span><br />
                  Quantity <span class="price">  <%=cartDT.Rows[i]["QTY"]%></span><br />
                  Sub Total <span class="price">Rs. <%=cartDT.Rows[i]["TOTAL"]%></span>
               </p>
            </div>
         </div>
         <%} %>
         <%}else{ %>
         <div class="wishlist-content">
            <span class="price">  Your Cart is Empty</span>
         </div>
         <%} %>
      </div>
   </div>
</div>