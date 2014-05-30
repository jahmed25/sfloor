<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReloadWL.aspx.cs" Inherits="sfloor_pages_ReloadeWL" %>

<div id="mini_cart_block" name='WLContainer'>
                                                            <div class="icon-wishlist-big">
                                                                <a class="cart-url" href='<%=ConfigUtil.hostURL() %>fav-items'><span class="wlcount"><b id='favCount'><%=favDT.Rows.Count%></b></span></a>
                                                            </div>
                                                            <div class="block-cart mini_cart_ajax">
                                                                <!--<span class="top-cart-icon"></span>-->
                                                              
                                                                <span class="top-cart-title-wishlist">Wishlist</span><span class="cart-arrow"></span>
                                                                <div style="display: none;" class="top-cart-content" id='wishListDiv'>
                                                                <%if(favDT.Rows.Count>0){ %>
                                                                <div class="headnav"><a href="<%=ConfigUtil.hostURL() %>fav-items" style='color:blue'>View ALL</a> 
                                                                <a href="#" style="float:right;color:red" onclick="clearFav()">Clear All</a></div>
                                                                <div id='wishContent'>
                                                                    <%for (int i = 0; i < favDT.Rows.Count; i++)
                                                                      { %>
                                                                    <div class="wishlist-content">
                                                                        <a class="imglist" href='<%=ConfigUtil.hostURL() %>?htm=<%=favDT.Rows[i]["SKUCode"]%>' title='<%=favDT.Rows[i]["SKUName"]%>'>
                                                                        <img  src='<%=ConfigUtil.getServerPath() %><%=favDT.Rows[i]["PathInternaldetailsSmallImage"] %>' /></a>
                                                                       <div class="main-cont">
                                                                        <span class="cross" title="Delete item" sku='<%=favDT.Rows[i]["SKUName"]%>' WL></span> 
                                                                        <p class="brand"><%=favDT.Rows[i]["SKUBrand"]%></p>
                                                                        <p class="empty"><%=favDT.Rows[i]["SKUName"]%></p>
                                                                        <p class="subtotal">MRP <span class="pricecut">Rs.   <%=favDT.Rows[i]["MRP"]%></span><br />
                                                                           Actual Price <span class="price">Rs. <%=favDT.Rows[i]["SpecialPrice"]%></span>
                                                                         </p></div>
                                                                    </div>
                                                                    <%} %>
                                                                    </div>
                                                                  <%}else {%>
                                                                        <p style='color:Red'>Your WishList Is Empty</p>
                                                                    <%} %>
                                                                </div>

                                                            </div>
                                                        </div>