<%@ Page Language="C#" CodeFile="Error404.aspx.cs" Inherits="sfloor_pages_Error404" %>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Shoppers floor</title>
    <meta name="description" content="Default Description">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
    <link rel="icon" href="" type="image/x-icon">
    <script type="text/javascript">
        var staticPath = '<%=ConfigUtil.StaticPath() %>';
        var path = '<%=ConfigUtil.hostURL() %>';
        var serverPath = '<%=ConfigUtil.getServerPath() %>';
    </script>
    
    <link rel="shortcut icon" href="" type="image/x-icon">
    <link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/css.css'  type="text/css" media="all">
    <link rel="stylesheet" href='<%=ConfigUtil.StaticPath() %>new-css/custommenu.css' type="text/css" media="screen">
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/sfloorall.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ajax_cart_super.js'></script>

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
    
</head>
<body class=" cms-index-index cms-home">
    <div>
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
        <div class="page">
            <%=Header %>
            <!-- Start -->
           
           <h1 style='color'>Opps !! Resoruce is not available</h1>
            <h4 style='color'>This site is under construction, our team will review the error and will provide the solutio ASAP</h4>
            <h4 style='color'>Thank You!!</h4>
            <!-- End -->

             <%=Footer %>
        </div>
    </div>
    <div id="ajaxconfig_info" style="display: none">
        <button name="white" value="0.7">
        </button>
        <input id="enable_module" value="1" type="hidden">
    </div>
</body>
</html>