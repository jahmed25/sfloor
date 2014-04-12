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
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ajax_cart_super.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
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
                                            <strong>Shoppers Floor</strong><a href="" title="Shoppers floor" class="logo">
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
                                                <strong>Shoppers Floor</strong><a href="" title="Shoppers Floor" class="logo"><img
                                                    src='<%=ConfigUtil.StaticPath() %>new-images/newlogo.png' width="200px" height="70px" alt="Shoppers floor"></a></h1>
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
                                                                <a class="cart-url" href='<%=ConfigUtil.hostURL() %>Add-To-Cart'><span></span></a>
                                                            </div>
                                                            <div class="block-cart mini_cart_ajax">
                                                                <!--<span class="top-cart-icon"></span>-->
                                                                <b id='favCount'><%=favDT.Rows.Count%></b>
                                                                <span class="top-cart-title">Wishlist </span><span class="cart-arrow"></span>
                                                                <div style="display: none;" class="top-cart-content" id='wishListDiv'>
                                                                    <%for (int i = 0; i < favDT.Rows.Count; i++)
                                                                      { %>
                                                                    <div>
                                                                        <a href='<%=ConfigUtil.hostURL() %>?htm=<%=favDT.Rows[i]["SKUCode"]%>' title='<%=favDT.Rows[i]["SKUName"]%>'><img  src='<%=ConfigUtil.getServerPath() %><%=favDT.Rows[i]["PathInternaldetailsSmallImage"] %>' width='30px' height='30px'/></a>
                                                                        <p class="brand"><%=favDT.Rows[i]["SKUBrand"]%></p>
                                                                        <p class="empty"><%=favDT.Rows[i]["SKUName"]%></p>
                                                                        <p class="subtotal">
                                                                           MRP <span class="price">Rs. <%=favDT.Rows[i]["MRP"]%></span>
                                                                           Actual Price <span class="price">Rs. <%=favDT.Rows[i]["SpecialPrice"]%></span>
                                                                         </p>
                                                                    </div>
                                                                    <%} %>
                                                                    
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="top-cart-wrapper">
                                                    <div class="top-cart-contain">
                                                        <div id="mini_cart_block">
                                                            <div class="icon-cart-big">
                                                                <a class="cart-url" href='<%=ConfigUtil.hostURL() %>Add-To-Cart'><span></span></a>
                                                            </div>
                                                            <div class="block-cart mini_cart_ajax">
                                                                <!--<span class="top-cart-icon"></span>-->
                                                                <span class="top-cart-title">My Cart </span><span class="cart-arrow"></span>
                                                                <div style="display: none;" class="top-cart-content">
                                                                    <p class="empty">
                                                                        You have no items in your shopping cart.</p>
                                                                    <div class="subtotal">
                                                                        Subtotal: <span class="price">Rs. 0.00</span></div>
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
