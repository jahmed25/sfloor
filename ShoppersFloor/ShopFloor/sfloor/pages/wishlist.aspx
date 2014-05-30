<%@ Page Title="" Language="C#"  CodeFile="wishlist.aspx.cs" Inherits="sfloor_pages_wishlist" %>

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
          <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/category.js'></script>

<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/common1.js'></script>
<link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/etalage.css'/>
<script>    //1. set ul width 
    //2. image when click prev/next button
    var ul;
    var liItems;
    var imageNumber;
    var imageWidth;
    var prev, next;
    var currentPostion = 0;
    var currentImage = 0;


    function init() {
        ul = document.getElementById('image_slider');
        //        for (var i = 0; i < uls.length;i++ )
        //            ul=uls[i];
        liItems = ul.children;
        imageNumber = liItems.length;
        imageWidth = liItems[0].children[0].clientWidth;
        ul.style.width = parseInt(imageWidth * imageNumber) + 'px';
        prev = document.getElementsByName("prv");
        next = document.getElementsByName("next");
        generatePager(imageNumber);
        //.onclike = slide(-1) will be fired when onload;
        /*
        prev.onclick = function(){slide(-1);};
        next.onclick = function(){slide(1);};*/
        prev.onclick = function () { onClickPrev(); };
        next.onclick = function () { onClickNext(); };
    }


    function animate(opts) {
        var start = new Date;
        var id = setInterval(function () {
            var timePassed = new Date - start;
            var progress = timePassed / opts.duration;
            if (progress > 1) {
                progress = 1;
            }
            var delta = opts.delta(progress);
            opts.step(delta);
            if (progress == 1) {
                clearInterval(id);
                opts.callback();
            }
        }, opts.delay || 17);
        //return id;
    }

    function slideTo(imageToGo) {
        var direction;
        var numOfImageToGo = Math.abs(imageToGo - currentImage);
        // slide toward left

        direction = currentImage > imageToGo ? 1 : -1;
        currentPostion = -1 * currentImage * imageWidth;
        var opts = {
            duration: 1000,
            delta: function (p) { return p; },
            step: function (delta) {
                ul.style.left = parseInt(currentPostion + direction * delta * imageWidth * numOfImageToGo) + 'px';
            },
            callback: function () { currentImage = imageToGo; }
        };
        animate(opts);
    }

    function onClickPrev() {
        if (currentImage == 0) {
            slideTo(imageNumber - 1);
        }
        else {
            slideTo(currentImage - 1);
        }
    }

    function onClickNext() {
        if (currentImage == imageNumber - 1) {
            slideTo(0);
        }
        else {
            slideTo(currentImage + 1);
        }
    }

    function generatePager(imageNumber) {
        var pageNumber;
        var pagerDiv = document.getElementById('pager');
        for (i = 0; i < imageNumber; i++) {
            var li = document.createElement('li');
            pageNumber = document.createTextNode(parseInt(i + 1));
            li.appendChild(pageNumber);
            pagerDiv.appendChild(li);
            // add event inside a loop, closure issue.
            li.onclick = function (i) {
                return function () {
                    slideTo(i);
                }
            } (i);
        }
        var computedStyle = document.defaultView.getComputedStyle(li, null);
        //border width 1px; offsetWidth = 22
        var liWidth = parseInt(li.offsetWidth);
        var liMargin = parseInt(computedStyle.margin.replace('px', ""));
        pagerDiv.style.width = parseInt((liWidth + liMargin * 2) * imageNumber) + 'px';
    }
    window.onload = init;
</script>
<script>
    $(document).ready(function () {
        $('[next]').on("click", function () {
            var ul = $("ul[sku='" + $(this).attr('next') + "']");
            if ($(ul).css('left') == '0px') {
                $(ul).css('left', '-268px');
            } else if ($(ul).css('left') == '-268px') {
                $(ul).css('left', '-536px');
            } else {
                $(ul).css('left', '0px');
            }

        });
        $('[prev]').on("click", function () {
            var ul = $("ul[sku='" + $(this).attr('prev') + "']");
            if ($(ul).css('left') == '0px') {
                $(ul).css('left', '-536px');
            } else if ($(ul).css('left') == '-268px') {
                $(ul).css('left', '0px');
            } else {
                $(ul).css('left', '-268px');
            }


        });
    });
</script>
  
<style>
#overlay_form_quick
    {
        background: WHITE;
        z-index: 100000; border-radius:10px;
    }
.background_overlay_quick
    {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 100000;
        background: black;
        opacity: 0.9;
    }
</style>
<div class="wishlist-main-container">
	<div class="wishlist-head"><span class="title">Wishlist &nbsp;<i>1</i>&nbsp; item</span><span class="btnright"><input type="button" class="addtocartbtn" name="btn_wish_cntshop" value="Continue Shopping" />
    <input type="button" class="addtocartbtn" name="btn_wish_viewcart" value="View Cart" /></span>
    </div>	
      <%foreach(System.Data.DataRow r in favDT.Rows){ %>
        <div class="wishlist-container">
        <span class="cross" title="Delete item" ></span>
        <span class="wishlist-shade"></span>
        <a class="wishlist-quick-view" pop='<%=r["SKUCode"]%>' ><span>Quick View</span></a>
        	<div class="slider_wrapper">
				<ul id="image_slider" sku='<%=r["SKUCode"]%>' style='left:0px'>
					 <%if (!MFO.Utils.StringUtil.isNullOrEmpty((r["PathInternaldetailsSmallImage"] + "")))%>
			            <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathInternaldetailsSmallImage"]%>'/></li>
                     <%if (!MFO.Utils.StringUtil.isNullOrEmpty(r["PathUpperInternaldetailsSmallImage"] + "")) %>
					    <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathUpperInternaldetailsSmallImage"]%>'/></li>
                     <%if (!MFO.Utils.StringUtil.isNullOrEmpty(r["PathLowerInternaldetailsSmallImage"] + ""))%>
					    <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathLowerInternaldetailsSmallImage"]%>'/></li>
                     <%if (!MFO.Utils.StringUtil.isNullOrEmpty(r["PathBackInternaldetailsSmallImage"] + "")) %>
					    <li><img src='<%=ConfigUtil.getServerPath() %><%=r["PathBackInternaldetailsSmallImage"]%>'/></li>
				</ul>
				<span class="nvgt" prev='<%=r["SKUCode"]%>' name='pre' id='prev'></span>
				<span class="nvgt" next='<%=r["SKUCode"]%>' name='next' id='next'></span>		
			</div>
			<ul id="pager">
			</ul>
            <div class="bottom">
            <p class="brand"><span><%=r["SKUBrand"]%></span></p>
		    <p class="name"><span><%=r["SKUName"]%></span></p>
            <p class="price"><span class="oldprice">Rs.&nbsp;<%=r["MRP"]%></span><span>Rs.&nbsp;<%=r["SpecialPrice"]%></span></p>
            <p><a  class="addtocartbtn" name="btn_wish_addcrt" href="<%=ConfigUtil.hostURL() %><%=MFO.Utils.StringUtil.urlEncode(r["SKUName"]+"") %>?htm=<%=r["SKUCode"] %>"/>Buy now</a></p>
            </div>
		</div>
     <%} %>
<div  id="overlay_form_quick"  style="margin:0 auto; display:none;">
<div  style=" position:fixed; left:200px; top:10px; background:white; width:1000px; border-radius:10px; height:580px; ">

<a title="close" style="text-align:right; font-size:20px; color:red; float:right; margin-right:10px" id="closequickview" href="#">x</a>	
<object type="text/html" id='quickViewObj' style=" background:white; margin:0 auto;  width:1000px; border-radius:10px; height:580px; "></object></div> 
</div>
        
        </div>

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