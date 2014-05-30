<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Head.ascx.cs" Inherits="sfloor_pages_Headl" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Shoppers floor</title>
<meta name="description" content="Default Description"/>
<meta name="keywords" content=""/>
<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1"/>
<link rel="icon" href="" type="image/x-icon"/>
<script type="text/javascript">
    var staticPath = '<%=ConfigUtil.StaticPath() %>';
    var path = '<%=ConfigUtil.hostURL() %>';
    var serverPath = '<%=ConfigUtil.getServerPath() %>';
</script>
<link rel="shortcut icon" href="" type="image/x-icon" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/css.css' type="text/css"   media="all" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/custommenu.css'  type="text/css" media="screen" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/shoppersfloor.css' type="text/css"  media="all" />
<link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' type="text/css" />

<!--[if lt IE 8]>
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/ie6.css' media="all" />
    <![endif]-->
<!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/ie8.css' media="all" />
    <![endif]-->
<!--[if lt IE 7]>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ie7.js'></script>
    <![endif]-->
<!-- MENU -->



<!--For Header.ascx Start-->
<link href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' rel="stylesheet" type="text/css" />
<!--For Header.ascx End -->


<!-- For Menu.axcx  Start-->
<link href='<%=ConfigUtil.StaticPath() %>new-css/internalpage.css' rel="stylesheet"  type="text/css" />
<!-- For Menu.axcx  End-->

<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/sfloorall.js'></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ajax_cart_super.js'></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/common1.js'></script>

<!-- For Menu.axcx  Start-->
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
<!-- For Menu.axcx  End-->



<!-- For Menu.axcx  Start-->
<style>
   #overlay_form
   {
   background: WHITE;
   z-index: 100000;
   }
   .background_overlay
   {
   position: fixed;
   left: 0px;
   top: 0px;
   width: 100%;
   height: 100%;
   z-index: 100000;
   background: black;
   opacity: 0.8;
   }
   #fgt_overlay_form
   {
   background: WHITE;
   z-index: 100000;
   }
   .fgt_background_overlay
   {
   position: fixed;
   left: 0px;
   top: 0px;
   width: 100%;
   height: 100%;
   z-index: 100000;
   background: black;
   opacity: 0.8;
   }
   .css-form input.ng-invalid.ng-dirty
   {
   border: 2PX SOLID #FA787E;
   }
   .css-form input.ng-valid.ng-dirty
   {
   border: 2PX SOLID #78FA89;
   }
   .css-form .help-block
   {
   color: #FA787E;
   font-size: 12px;
   }
</style>
<!--For Menu.ascx End-->


<!--For Header.ascx Start-->
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
<!--For Header.ascx End-->
