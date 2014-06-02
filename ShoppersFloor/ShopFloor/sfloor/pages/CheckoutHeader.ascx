<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CheckoutHeader.ascx.cs" Inherits="sfloor_pages_CheckoutHeader" %>
 
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
    <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/tabcontent.js" ></script>
    <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/common1.js"></script>
    <link type="text/css"  href="<%=ConfigUtil.StaticPath() %>new-css/checkoutpage_n.css" rel="stylesheet" />
    <link type="text/css"  href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' rel="stylesheet" />
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <style type="text/css">
		ul li:hover
		{
		    background-color:orange;
		}
	</style>

        <header><div id="header">
        <div class="logo"><a href="<%=ConfigUtil.hostURL() %>Home"><img src="<%=ConfigUtil.StaticPath() %>new-images/newlogo.png" width="220px" height="50px"></a></diV>
        <div>
        <a href='<%=ConfigUtil.hostURL() %>Home' class="btn_shipinfo bck_to_shp">Back to shop</a>
    </div>
    </div>
 </header>