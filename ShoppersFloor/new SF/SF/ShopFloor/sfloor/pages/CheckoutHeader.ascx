<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CheckoutHeader.ascx.cs" Inherits="sfloor_pages_CheckoutHeader" %>
 
     <script type="text/javascript">
         var staticPath = '<%=ConfigUtil.StaticPath() %>';
         var path = '<%=ConfigUtil.hostURL() %>';
         var serverPath = '<%=ConfigUtil.getServerPath() %>';
    </script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
    <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/common1.js"></script>
    <link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/checkoutpage_n.css" />
    <link type="text/css" rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' />
    <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/jquery-ui.js"></script>
	<link rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/jquery-ui.css">
    <style type="text/css">
		ul li:hover
		{
		    background-color:#ef6910;
		}
	</style>

        <header><div class="ckeckoutmain_sec" id="header">
        <div class="logo">
        <a href="<%=ConfigUtil.hostURL() %>Home"><img src="<%=ConfigUtil.StaticPath() %>new-images/newlogo.png"></a></diV>
        <a href='<%=ConfigUtil.hostURL() %>Home' class="btn_shipinfo bck_to_shp">Back to shop</a>

        <div>
    </div>
    </div>
 </header>