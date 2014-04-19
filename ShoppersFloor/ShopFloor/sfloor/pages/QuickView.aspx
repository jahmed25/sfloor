<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quickview.aspx.cs" Inherits="sfloor_pages_quickview" %>
<%@ Import Namespace="MFO.Utils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        CloudZoom.quickStart();
        </script>
        
  <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/modernizr.custom.17475.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ga.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/cloudzoom.js'></script>
    <link rel="stylesheet" type="text/css" href='http://localhost:16088/ShoppersFloor/new-css/etalage.css'/>

    <script type="text/javascript">
        CloudZoom.quickStart();
        function selectSize(txt) {
            $("li[namespace='sizeBtn']").css({ 'background-color': '#EBEBEB', 'color': 'black' })
            $(txt).css({ 'background-color': '#464646', 'color': 'white' });
            $("#size").val($(txt).text());
        }
        function addtoCart() {

            if ($('#isSize').val() == 'true' && $('#size').val().length == 0) {
                $('#errorSize').css('display', 'block').text('Please select the size');
                return;
            }
            $.ajax({
                type: "get",
                contentType: "application/json; charset=utf-8",
                url: "<%=ConfigUtil.hostURL()%>sfloor/pages/AjaxService.aspx?action=addToCart&sku=" + $('#style').val() + "&qty=" + $("#dd_quantity option:selected").val() + "&color=" + $("#color").val() + "&size=" + $("#size").val() + "&isColor=" + $("#isColor").val() + "&isSize=" + $("#isSize").val() + "&isSku=" + $("#isSku").val(),
                success: function (data) {
                    if (data != 'success') {
                        $('#errorSize').css('display', 'block').text($(data).filter('error').text());
                    } else {
                        window.location = '<%=ConfigUtil.hostURL()%>Add-To-Cart'
                    }
                },
                error: function (result) {
                    alert("Error......");
                }
            });
        }
    </script>
 
		</head>
	<body style="">
<div class="quickview-content">
	<div id="quick-details-image">

	 <img class = "cloudzoom" src = "images/large/image1.jpg"
             data-cloudzoom = "zoomImage: 'images/large/image1.jpg'" />
        <br/>
        <img class = 'cloudzoom-gallery' src = "images/thumbs/image1.jpg" data-cloudzoom = "useZoom: '.cloudzoom', image: 'images/small/image1.jpg', zoomImage: 'images/large/image1.jpg' " >
        <img class = 'cloudzoom-gallery' src = "images/thumbs/image2.jpg" data-cloudzoom = "useZoom: '.cloudzoom', image: 'images/small/image2.jpg', zoomImage: 'images/large/image2.jpg' " >
        <img class = 'cloudzoom-gallery' src = "images/thumbs/image3.jpg" data-cloudzoom = "useZoom: '.cloudzoom', image: 'images/small/image3.jpg', zoomImage: 'images/large/image3.jpg' " >         		</div>
		<div id="description">

		<h1>Product name</h1>
			<div class="priceqty">
			<div class="quick-price">
			<div  class="discount"><span>Discount: </span><span>20% + 10%</span></div>
			<div  class="oldprice"><span>Rs. </span><span class="cut">0000.00</span></div>
			<div  class="rs"><span>Rs. </span><span>0000.00</span></div>
			<div  class="avl"> <span>Availability:</span><span class="instock">In Stock</span></div>
			</div>
			<div class="addtocart_qty-quick">
			<label for="qty">Quantity :</label>
        <div class="qty-container">
            <input type="text" name="qty" id="qty" value="1" title="Qty" class="input-text qty" >
            <input type="button" title="decrease" value="-" class="qty-decrease" onClick="var qty_el = document.getElementById(&#39;qty&#39;); var qty = qty_el.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) qty_el.value--;return false;">
            <input type="button" title="increase" value="+" class="qty-increase" onClick="var qty_el = document.getElementById(&#39;qty&#39;); var qty = qty_el.value; if( !isNaN( qty ) &amp;&amp; qty &lt; 20 ) qty_el.value++;return false;">
        </div>
		
		<div class=""><input type="button" title="add  to cart" value="BUY NOW" class="addtocartbtn">
		</div>
			</div>
			</div>
			
			<div class="quick-size">Select Size:<ul><li><a></a></li><li><a></a></li><li><a></a></li></ul>
			<a href="#">Size Chart</a>
			</div>
			<div class="quick-color">Also available in these colors:<ul><li><a></a></li><li><a></a></li><li><a></a></li></ul></div>
			
			<div class="wishlist-quick"><span><a href="#" title="add to wishlist">add to wishlist</a></span>
			<span><a href="#" title="email to a friend">email to a friend</a></span>
			<span><a href="#" title="share">share</a></span></div>
			
  </div>
</div>
</body>
</html>
