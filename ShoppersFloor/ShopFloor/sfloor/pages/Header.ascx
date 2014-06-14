<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Header" %>
<%@ Register src="Menu.ascx" tagname="MenuUserControl" tagprefix="m" %>
<%@ Import Namespace="MFO.Constants" %>
<!-- MENU -->
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

<div class="header-wrapper" ng-app='registration' ng-controller='regCtrl'>
   <div class="header-container">
      <div class="container">
         <div class="contain-size">
            <div class="header">
               <div class="toplink ">
                  <div class="row-fluid">
                     <div class="span6">
                        <div class="phone-number">
                           <p>
                              <em class="icon-phone"></em>Call +110 123456
                           </p>
                        </div>
                     </div>
                     <div class="span6">
                        <!--p class="welcome-msg"> </p-->
                        <ul class="links">
                           <%if(Session[Constant.Session.LOGED_IN_USER_ID]==null){ %>
                           <li class="first"  id="pop" ><a href="#" id="log"  title="Login and Create account">Log In / Register</a></li>
                           <li ><a href='<%=ConfigUtil.hostURL() %>check-out' title="Checkout">Checkout </a></li>
                           <li class="last"><a href='<%=ConfigUtil.hostURL() %>Help' title="Help">Help</a></li>
                           <%}else{ %>
                           <li class="first"  id="Li1" >
                              <a  href='<%=ConfigUtil.hostURL() %>Logout' id="A1"  title="Logout">Logout</a>
                           </li>
                           <li>
                              <a href="<%=ConfigUtil.hostURL() %>Account" title="My Account">My Account</a>
                            </li>
                           <li>
                              <a href='<%=ConfigUtil.hostURL() %>Checkout' title="Checkout">check-out </a>
                           </li>
                           <li class="last"><a href='<%=ConfigUtil.hostURL() %>Help' title="Help">Help</a></li>
                           <%} %>
                        </ul>
                     </div>
                  </div>
               </div>
               <%--Desktop view--%>
               <div class="header-content visible-desktop">
                  <div class="row-fluid">
                     <div class="span4">
                        <h1 class="logo">
                           <a href="<%=ConfigUtil.hostURL() %>Home" title="Shoppers floor" class="logo"><strong>Shoppers Floor</strong>
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/newlogo.png' width="200px" height="70px" alt="Shoppers floor"></a>
                        </h1>
                     </div>
                     <div class="span4 search-stick">
                        <form id="search_mini_form">
                           <div class="form-search">
                              <div class="search-content">
                                 <label for="search">
                                 Search:</label>
                                 <input id="search" name="q" onfocus="if(this.value == 'Search Here...') { this.value = ''; }"
                                    onblur="this.value=!this.value?'Search Here...':this.value;" value="Search Here..."
                                    class="input-text" maxlength="128" type="text">
                                 <button type="submit" title="Search" class="button">
                                 </button>
                                 <div id="search_autocomplete" class="search-autocomplete">
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                     <div class="span2 cart-stick">
                        <div class="quick-access">
                           <div class="top-cart-wrapper">
                              <div class="top-cart-contain">
                                 <div id="mini_cart_block" name='WLContainer'>
                                    <div class="icon-wishlist-big">
                                       <a class="cart-url" href='<%=ConfigUtil.hostURL() %>fav-items'><span class="wlcount"><b id='favCount'><%=FavDT.Rows.Count%></b></span></a>
                                    </div>
                                    <div class="block-cart mini_cart_ajax">
                                       <!--<span class="top-cart-icon"></span>-->
                                       <span class="top-cart-title-wishlist">Wishlist</span><span class="cart-arrow"></span>
                                       <div style="display: none;" class="top-cart-content" id='wishListDiv'>
                                          <%if(FavDT.Rows.Count>0){ %>
                                          <div class="headnav-popup"><a href="<%=ConfigUtil.hostURL() %>fav-items" style='color:blue'>View ALL</a> 
                                             <a href="#" style="float:right;color:red" onclick="clearFav()">Clear All</a>
                                          </div>
                                          <div id='wishContent'>
                                             <%for (int i = 0; i < FavDT.Rows.Count; i++)
                                                { %>
                                             <div class="wishlist-content">
                                                <a class="imglist" href='<%=ConfigUtil.hostURL() %>?htm=<%=FavDT.Rows[i]["SKUCode"]%>' title='<%=FavDT.Rows[i]["SKUName"]%>'>
                                                <img  src='<%=ConfigUtil.getServerPath() %><%=FavDT.Rows[i]["PathInternaldetailsSmallImage"] %>' /></a>
                                                <div class="main-cont">
                                                   <span class="cross-del" title="Delete item" sku='<%=FavDT.Rows[i]["SKUCode"]%>' WL></span> 
                                                   <p class="brand"><%=FavDT.Rows[i]["SKUBrand"]%></p>
                                                   <p class="empty"><%=FavDT.Rows[i]["SKUName"]%></p>
                                                   <p class="subtotal">MRP <span class="pricecut">Rs.   <%=FavDT.Rows[i]["MRP"]%></span><br />
                                                      Actual Price <span class="price">Rs. <%=FavDT.Rows[i]["SpecialPrice"]%></span>
                                                   </p>
                                                </div>
                                             </div>
                                             <%} %>
                                          </div>
                                          <%}else {%>
                                          <p style='color:Red'>Your WishList Is Empty</p>
                                          <%} %>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="top-cart-wrapper">
                              <div class="top-cart-contain">
                                 <div id="mini_cart_block" name='cartContainer'>
                                    <div class="icon-cart-big">
                                       <a class="cart-url" href='<%=ConfigUtil.hostURL() %>Add-To-Cart'><span><span class="atccount"><b id='cCount'><%=CartDT.Rows.Count%></b></span></span></a>
                                    </div>
                                    <div class="block-cart mini_cart_ajax">
                                       <!--<span class="top-cart-icon"></span>-->
                                       <span class="top-cart-title">My Cart </span><span class="cart-arrow"></span>
                                       <div style="display: none;" class="top-cart-content">
                                          <%if (CartDT.Rows.Count > 0)
                                             { %>
                                          <div>
                                             <div class="headnav-popup">Total:&nbsp;<span class="price"><%=Total%></span>&nbsp;&nbsp;<a href="<%=ConfigUtil.hostURL() %>Add-To-Cart" style='color:blue'>View ALL</a>&nbsp;&nbsp;<a style='color:blue' href="<%=ConfigUtil.hostURL() %>check-out">Checkout</a> <a href="#" style="float:right;color:red" onclick="clearCart()">Clear All</a>
                                             </div>
                                             <div id='cartDiv'>
                                                <%for (int i = 0; i < CartDT.Rows.Count; i++)
                                                   { %>
                                                <div class="wishlist-content">
                                                   <a class="imglist" href='<%=ConfigUtil.hostURL() %>Add-To-Cart' title='<%=CartDT.Rows[i]["SKUName"]%>'>
                                                   <img  src='<%=ConfigUtil.getServerPath() %><%=CartDT.Rows[i]["PathInternaldetailsSmallImage"] %>' /></a>
                                                   <div class="main-cont">
                                                      <span class="cross-del" title="Delete item" sku='<%=CartDT.Rows[i]["SKU"]%>' cart></span> 
                                                      <p class="brand"><%=CartDT.Rows[i]["SKUBrand"]%></p>
                                                      <p class="empty"><%=CartDT.Rows[i]["SKUName"]%></p>
                                                      <p class="subtotal">
                                                         SKU : <span class="price"> <%=CartDT.Rows[i]["SKU"]%></span><br />
                                                         Unit Price: <span class="price">Rs.   <%=CartDT.Rows[i]["UNIT_PRICE"]%></span><br />
                                                         Quantity: <span class="price">  <%=CartDT.Rows[i]["QTY"]%></span><br />
                                                         Sub Total: <span class="price">Rs. <%=CartDT.Rows[i]["TOTAL"]%></span>
                                                      </p>
                                                   </div>
                                                </div>
                                                <%} %>
                                             </div>
                                             <%}else{ %>
                                             <div class="wishlist-content">
                                                <span style='color:red;'>  Your Cart is Empty</span>
                                             </div>
                                             <%} %>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <m:MenuUserControl ID="menu" runat="server" />
      <script type="text/javascript">
         //<![CDATA[
          var CUSTOMMENU_POPUP_EFFECT = 1;
          var CUSTOMMENU_POPUP_TOP_OFFSET = 40;
         //]]>
                         
      </script>
   </div>
</div>