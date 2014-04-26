<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Header" %>
<%@ Register src="Menu.ascx" tagname="MenuUserControl" tagprefix="m" %>
<%@ Import Namespace="MFO.Constants" %>
 <link href='<%=ConfigUtil.StaticPath() %>new-css/css.css' rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/shoppersfloor.css'
        media="all"> 
    <link href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/custommenu.css' media="screen">
    <!--[if lt IE 8]>
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/ie6.css' media="all" />
    <![endif]-->
        <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/ie8.css' media="all" />
    <![endif]-->
        <!--[if lt IE 7]>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ie7.js'></script>
    <![endif]-->
   
 <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ajax_cart_super.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
     <script type="text/javascript">
         function clearCart() {
             $.ajax({ method: 'POST', url: path + "sfloor/pages/AjaxService.aspx?action=clearCart" })
					.success(function (msg) {
					    $("#cartDiv").html("<p style='color:red'>Your Cart Is Empty</p>")
					    $("#cCount").text("0");
					    if (pageType == 'addToCart') {
					        $('.addtocartmain').html("<center><p style='color:red'>All item(s) has been Deleted from your Cart</center>")
                        }

					});
	    }
	    function clearFav() {
	        $.ajax({ method: 'POST', url: path + "sfloor/pages/AjaxService.aspx?action=clearFav" })
					.success(function (msg) {
					    $("#wishListDiv").html("<p style='color:red'>Your Wish List Is Empty</p>")
					    $("#favCount").text("0");

					});
        }
    </script>
    <!-- MENU -->
  <div class="header-wrapper" ng-app='registration' ng-controller='regCtrl'>
                <div class="header-container">
                    <div class="container">
                        <div class="contain-size">
                            <div class="header">
                                <div class="toplink ">
                                    <div class="row-fluid">
                                        <div class="span6">
                                            <div class="phone-number visible-desktop">
                                                <p>
                                                    <em class="icon-phone"></em>Call +110 123456</p>
                                            </div>
                                           </div>
                                        <div class="span6">
                                 <!--p class="welcome-msg"> </p-->

                                            <ul class="links">
                                            <%if(Session[Constant.Session.LOGED_IN_USER_ID]==null){ %>
                                                <li class="first"  id="pop" ><a href="#" id="log"  title="My Account">Log In / Register</a></li>
                                                <li ><a href="" title="Log In">Checkout </a></li>
                                                <li class="last"><a href='<%=ConfigUtil.hostURL() %>Help' title="Help">Help</a></li>

                                                <%}else{ %>
                                                    <li class="first"  id="Li1" >
                                                        <a  href='<%=ConfigUtil.hostURL() %>Logout' id="A1"  title="Logout">Logout</a></li>
                                                    <li>
                                                        <a href="<%=ConfigUtil.hostURL() %>Account" title="My Account">My Account</a>
                                                     </li>
                                                    <li >
                                                        <a href='<%=ConfigUtil.hostURL() %>Checkout' title="Checkout">Checkout </a>
                                                    </li>
                                                <li class="last"><a href='<%=ConfigUtil.hostURL() %>Help' title="Help">Help</a></li>

                                                <%} %>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <%--mobile view--%>
                                <div class="header-content hidden-desktop">
                                    <div class="row-fluid">
                                       <h1 class="logo">
                                            <a href="<%=ConfigUtil.hostURL() %>Home" title="Shoppers floor" class="logo"><strong>Shoppers Floor</strong>
                                               <img src='<%=ConfigUtil.StaticPath() %>new-images/newlogo.png'  alt="Logo"></a></h1>
                                       
                                        <br>
                                        <form id="search_mini_form" action="" method="get">
                                        <div class="form-search">
                                            <div class="search-content">
                                                <label for="search">
                                                    Search:</label>
                                                <input autocomplete="off" id="search" name="q" onfocus="if(this.value == 'Search Here...') { this.value = ''; }"
                                                    onblur="this.value=!this.value?'Search Here...':this.value;" value="Search Here..."
                                                    class="input-text" maxlength="128" type="text">
                                                <button type="submit" title="Search" class="button">
                                                    <i class="icon-search"></i>
                                                </button>
                                                <div style="display: none;" id="search_autocomplete" class="search-autocomplete">
                                                </div>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                                <%--end--%>

                                <div class="header-content visible-desktop">
                                    <div class="row-fluid">
                                        <div class="span4">
                                            <h1 class="logo">
                                                <a href="<%=ConfigUtil.hostURL() %>Home" title="Shoppers floor" class="logo"><strong>Shoppers Floor</strong>
                                                <img src='<%=ConfigUtil.StaticPath() %>new-images/newlogo.png' width="200px" height="70px" alt="Shoppers floor"></a></h1>
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
                                                        <i class="icon-search"></i>
                                                    </button>
                                                    <div id="search_autocomplete" class="search-autocomplete">
                                                    </div>
                                                </div>
                                            </div>
                                            </form>
                                        </div>
                                        <div class="span2 cart-stick">
                                            <div class="quick-access">
                                                <%--<div class="wishlist-big">
                                                    <a class="icon-wishlist-big" href="#" title="Wishlist"><span>Wishlist</span></a></div>
--%>
                                                     <div class="top-cart-wrapper">
                                                    <div class="top-cart-contain">
                                                        <div id="mini_cart_block">
                                                            <div class="icon-wishlist-big">
                                                                <a class="cart-url" href='<%=ConfigUtil.hostURL() %>Add-To-Cart'><span class="wlcount"><b id='favCount'><%=favDT.Rows.Count%></b></span></a>
                                                            </div>
                                                            <div class="block-cart mini_cart_ajax">
                                                                <!--<span class="top-cart-icon"></span>-->
                                                              
                                                                <span class="top-cart-title-wishlist">Wishlist </span><span class="cart-arrow"></span>
                                                                <div style="display: none;" class="top-cart-content" id='wishListDiv'>
                                                                <%if(favDT.Rows.Count>0){ %>
                                                                <a href="<%=ConfigUtil.hostURL() %>FavList" style='color:blue'>View ALL</a> 
                                                                <a href="#" style="float:right;color:red" onclick="clearFav()">Clear All</a>
                                                                <div id='wishContent'>
                                                                    <%for (int i = 0; i < favDT.Rows.Count; i++)
                                                                      { %>
                                                                    <div class="wishlist-content">
                                                                        <a class="imglist" href='<%=ConfigUtil.hostURL() %>?htm=<%=favDT.Rows[i]["SKUCode"]%>' title='<%=favDT.Rows[i]["SKUName"]%>'>
                                                                        <img  src='<%=ConfigUtil.getServerPath() %><%=favDT.Rows[i]["PathInternaldetailsSmallImage"] %>' /></a>
                                                                        <div class="main-cont">
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
                                                    </div>
                                                </div>

                                                <div class="top-cart-wrapper">
                                                    <div class="top-cart-contain">
                                                        <div id="mini_cart_block" name='cartContainer'>
                                                            <div class="icon-cart-big">
                                                                <a class="cart-url" href='<%=ConfigUtil.hostURL() %>Add-To-Cart'><span><span class="atccount"><b id='cCount'><%=cartDT.Rows.Count%></b></span></span></a>
                                                            </div>
                                                            <div class="block-cart mini_cart_ajax">
                                                                <!--<span class="top-cart-icon"></span>-->
                                                                <span class="top-cart-title">My Cart </span><span class="cart-arrow"></span>
                                                                <div style="display: none;" class="top-cart-content">
                                                                    <%if (cartDT.Rows.Count > 0)
                                                                      { %>

                                                                    Total:&nbsp;<span class="price"><%=total%></span>&nbsp;&nbsp;<a href="<%=ConfigUtil.hostURL() %>Add-To-Cart" style='color:blue'>View ALL</a>&nbsp;&nbsp;<a style='color:blue' href="<%=ConfigUtil.hostURL() %>Checkout">Checkout</a> <a href="#" style="float:right;color:red" onclick="clearCart()">Clear All</a>
                                                                   <div class="scrollbar" id='cartDiv'>
                                                                    <%for (int i = 0; i < cartDT.Rows.Count; i++)
                                                                      { %>
                                                                    <div class="wishlist-content">
                                                                        <a class="imglist" href='<%=ConfigUtil.hostURL() %>Add-To-Cart' title='<%=cartDT.Rows[i]["SKUName"]%>'>
                                                                        <img  src='<%=ConfigUtil.getServerPath() %><%=cartDT.Rows[i]["PathInternaldetailsSmallImage"] %>' /></a>
                                                                        <div class="main-cont">
                                                                        <p class="brand"><%=cartDT.Rows[i]["SKUBrand"]%></p>
                                                                        <p class="empty"><%=cartDT.Rows[i]["SKUName"]%></p>
                                                                        <p class="subtotal">
                                                                           SKU : <span class="price"> <%=cartDT.Rows[i]["SKU"]%></span><br />
                                                                           Unit Price: <span class="price">Rs.   <%=cartDT.Rows[i]["UNIT_PRICE"]%></span><br />
                                                                           Quantity: <span class="price">  <%=cartDT.Rows[i]["QTY"]%></span><br />
                                                                           Sub Total: <span class="price">Rs. <%=cartDT.Rows[i]["TOTAL"]%></span>
                                                                         </p></div>
                                                                    </div>
                                                                    <%} %>
                                                                    </div>
                                                                    <%}else{ %>
                                                                    <div class="wishlist-content">
                                                                       <span class="price">  Your Cart is Empty</span>
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
