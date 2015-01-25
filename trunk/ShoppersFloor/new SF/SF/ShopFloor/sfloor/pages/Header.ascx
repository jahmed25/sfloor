<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Header" %>
<%@ Register src="Menu.ascx" tagname="MenuUserControl" tagprefix="m" %>
<%@ Import Namespace="MFO.Constants" %>
<!-- MENU -->      

<div class="header-wrapper" ng-app='registration' ng-controller='regCtrl'>
<div class="top_bg">
<div class="container">
<div class="header_top">
	<div class="top_left">
		<h2><a href="#">50%off</a> use coupon code "big61" and get extra 33% off on orders above rs 2,229 </h2>
	</div>
	<div class="top_right">
                        <ul class="links">
                           <%if(Session[Constant.Session.LOGED_IN_USER_ID]==null){ %>
                           <li id="pop" ><a href="#" id="log"  title="Login and Create account">LOG IN / REGISTER</a></li>
                           <%if (Total != ""){%>
                            <li ><a href='<%=ConfigUtil.hostURL() %>check-out' title="Checkout">CHECKOUT</a></li>
                           <%} %>
                           <li> <a href='<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx'>FAQ</a></li>
                           <%}else{ %>
                           <li>
                              <a  href='<%=ConfigUtil.hostURL() %>Logout' title="Logout">LOGOUT</a>
                           </li>
                           <li>
                              <a  id="acc_sec" href="<%=ConfigUtil.hostURL() %>Account" title="My Account">MY ACCOUNT<i class="arrow-down"></i></a>
                              <ul  class="acc_menu">
                              <li><a href="<%=ConfigUtil.hostURL() %>Account?tab=profile">VIEW PROFILE</a></li>
                              <li><a href="<%=ConfigUtil.hostURL() %>Account?tab=order-details">ORDER TRACKING</a></li>
                              <li><a href="<%=ConfigUtil.hostURL() %>Account?tab=address-details">VIEW ADDRESS</a></li>
                              <li><a href="<%=ConfigUtil.hostURL() %>Account?tab=change-password">CHANGE PASSWORD</a></li>
                              <li><a href="<%=ConfigUtil.hostURL() %>Account?tab=credit">CREDIT</a></li>
                              <li><a href="<%=ConfigUtil.hostURL() %>Account?tab=profile">STATUS</a></li>
                              <li><a href="<%=ConfigUtil.hostURL() %>fav-items">WISHLIST</a></li>
                              <li><a href="<%=ConfigUtil.hostURL() %>fAdd-To-Cart">CART</a></li>
                              </ul>
                            </li>
                           <%if (Total != ""){%>
                            <li><a href='<%=ConfigUtil.hostURL() %>check-out' title="Checkout">CHECKOUT</a></li>
                           <%} %>
                            <li> <a href='<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx'>FAQ</a></li>
                           <%} %>
                        </ul>
	</div>
	<div class="clearfix"></div>
</div>
</div>
</div>
<div class="header_bg">
<div class="container">
	<div class="header">
		<div class="logo">
		 <a href='<%=ConfigUtil.hostURL() %>Home' title="Shoppers floor" class="logo"><strong>Shoppers Floor</strong>
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/newlogo.png' alt="Shoppers floor"></a>
		</div>
		<!-- start header_right -->
		<%--<div class="header_right">
		<div class="create_btn">
			<a class="arrow"  href="registration.html">create account <img src="images/right_arrow.png" alt=""/>  </a>
		</div>
           
                           
		<ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>shopping cart empty</h3><a href=""></a></li>
					<li><p>if items in your wishlit are missing, <a href="">login to your account</a> to view them</p></li>
				</ul>
			</li>
		</ul>
		<ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c1" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>wishlist empty</h3><a href=""></a></li>
					<li><p>if items in your wishlit are missing, <a href="">login to your account</a> to view them</p></li>
				</ul>
			</li>
		</ul>
		</div>--%>
            <div style="float:right">

                               <div class="top-cart-wrapper">
                              <div class="top-cart-contain" name='WLContainer'>
                                 
                                    <div class="icon-wishlist-big">
                                       <a class="cart-url" href='<%=ConfigUtil.hostURL() %>fav-items'><span class="wlcount"><b id='favCount'><%=FavDT.Rows.Count%></b></span></a>
                                    </div>
                                       <!--<span class="top-cart-icon"></span>-->
                                       <span class="top-cart-title-wishlist">Wishlist</span><span class="cart-arrow"></span>
                                       <div style="display: none;" class="top-cart-content" id='wishListDiv'>
                                          <%if(FavDT.Rows.Count>0){ %>
                                          
                                          <div id='wishContent' id="wlContent">
                                              <div class="headnav-popup"><a href="<%=ConfigUtil.hostURL() %>fav-items" style='color:blue'>View ALL</a> 
                                             <a href="#" style="float:right;color:red" onclick="clearFav()">Clear All</a>
                                          </div>
                                             <%for (int i = 0; i < FavDT.Rows.Count; i++)
                                                { %>
                                             <div class="wishlist-content" >
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
                                         <div class="empty_item"> <span>Your WishList Is Empty</span></div>
                                          <%} %>
                                       </div>
                                 </div>
                              
                           </div>
                           <div class="top-cart-wrapper">
                              <div name='cartContainer' class="top-cart-contain">
                                    <div class="icon-cart-big">
                                       <a class="cart-url" href='<%=ConfigUtil.hostURL() %>Add-To-Cart'>
                                       <span class="atccount"><b id='cCount'><%=CartDT.Rows.Count%></b></span></a>
                                    </div>
                                       <!--<span class="top-cart-icon"></span>-->
                                       <span class="top-cart-title">My Cart </span><span class="cart-arrow"></span>
                                       <div style="display: none;" class="top-cart-content">
                                          <%if (CartDT.Rows.Count > 0)
                                             { %>
                                          <div>
                                             <div id='cartDiv'>
                                                  <div class="headnav-popup">Total:&nbsp;<span class="price"><%=Total%></span>&nbsp;&nbsp;<a href="<%=ConfigUtil.hostURL() %>Add-To-Cart" style='color:blue'>View ALL</a>&nbsp;&nbsp;<a style='color:blue' href="<%=ConfigUtil.hostURL() %>check-out">Checkout</a> <a href="#" style="float:right;color:red" onclick="clearCart()">Clear All</a>
                                             </div>
                                            
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
                                             <div class="empty_item">
                                                <span>Your Cart is Empty</span>
                                             </div>
                                             <%} %>
                                          </div>
                                       </div>
                                 </div>
                </div>
           </div>
            <div class="search">
		    <form>
		    	<input id="search" name="q" onfocus="if(this.value == 'Search Here...') { this.value = ''; }"
                                    onblur="this.value=!this.value?'Search Here...':this.value;" value="Search Here..."
                                    class="input-text" maxlength="128" type="text">
                                 <button type="submit" title="Search" class="button" searchbtn>  </button>
                <div id="search_autocomplete" class="search-autocomplete">
                </div>
			</form>
		
		<div class="clearfix"></div>
		
                            </div>
		<!-- start header menu -->
    </div>
</div>
</div>
      
             
      </div>
      <m:MenuUserControl ID="menu" runat="server" />