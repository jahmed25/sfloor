<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLayout.master" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="sfloor_pages_wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            prev = document.getElementById("prev");
            next = document.getElementById("next");
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
        <div class="wishlist-container">
        <span class="cross" title="Delete item" ></span>
        <span class="wishlist-shade"></span>
        <a class="wishlist-wish-list" name='saveLater' sku='<%# Eval("SKUCode") %>'><span>Save for Later</span></a>
        <a class="wishlist-quick-view" pop='<%# Eval("SKUCode") %>' ><span>Quick View</span></a>
                 
        	<div class="slider_wrapper">
				<ul id="image_slider">
					<li><img src='<%=ConfigUtil.StaticPath() %>new-images/sample-_12__2_1.jpg'></li>
					<li><img src='<%=ConfigUtil.StaticPath() %>new-images/sample-_13__2_1_1_1.jpg'></li>
					<li><img src='<%=ConfigUtil.StaticPath() %>new-images/sample-_6__1.jpg'></li>
				</ul>
               					
				<span class="nvgt" id="prev"></span>
				<span class="nvgt" id="next"></span>		
			</div>
			<ul id="pager">
			</ul>
            <div class="bottom">
            <p class="brand"><span>Brand</span></p>
        
		    <p class="name"><span>Name</span></p>
            <p class="price"><span class="oldprice">Rs.&nbsp;000</span><span>Rs.&nbsp;000</span></p>
            <p><input type="button" class="addtocartbtn" name="btn_wish_addcrt" value="Buy now" /></p>
            </div>
		</div>
<div  id="overlay_form_quick"  style="margin:0 auto; display:none;">
<div  style=" position:fixed; left:200px; top:10px; background:white; width:1000px; border-radius:10px; height:580px; ">

<a title="close" style="text-align:right; font-size:20px; color:red; float:right; margin-right:10px" id="closequickview" href="#">x</a>	
<object type="text/html" id='quickViewObj' style=" background:white; margin:0 auto;  width:1000px; border-radius:10px; height:580px; "></object></div> 
</div>
        
        </div>
</asp:Content>

