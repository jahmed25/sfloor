<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quickview.aspx.cs" Inherits="sfloor_pages_quickview" %>
<%@ Import Namespace="MFO.Utils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript">
        CloudZoom.quickStart();
        </script>
        
  <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/modernizr.custom.17475.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/ga.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/cloudzoom.js'></script>
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/etalage.css'/>


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

	 <%if (!MFO.Utils.StringUtil.isNullOrEmpty((dt.Rows[0]["PathInternaldetailsZoomImage"] + "")))
              { %>
                <img class="cloudzoom" src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathInternaldetailsZoomImage"] %>' data-cloudzoom="zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathInternaldetailsZoomImage"] %>'" /> <br />
            <%} %>

            <%if (!StringUtil.isNullOrEmpty(dt.Rows[0]["PathUpperInternaldetailsSmallImage"] + "")){ %>
                <img class='cloudzoom-gallery' src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathUpperInternaldetailsSmallImage"] %>' data-cloudzoom="useZoom: '.cloudzoom', image: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathUpperInternaldetailsZoomImage"] %>', zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathUpperInternaldetailsZoomImage"] %>' ">
            <%} %>

            <%if (!StringUtil.isNullOrEmpty(dt.Rows[0]["PathLowerInternaldetailsSmallImage"] + "")) {%>
                <img class='cloudzoom-gallery' src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathLowerInternaldetailsSmallImage"] %>' data-cloudzoom="useZoom: '.cloudzoom', image: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathLowerInternaldetailsZoomImage"] %>', zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathLowerInternaldetailsZoomImage"] %>' ">
            <%} %>

            <%if (!StringUtil.isNullOrEmpty(dt.Rows[0]["PathBackInternaldetailsSmallImage"] + "")) {%>
                <img class='cloudzoom-gallery' src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathBackInternaldetailsSmallImage"] %>' data-cloudzoom="useZoom: '.cloudzoom', image: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathBackInternaldetailsZoomImage"] %>', zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathBackInternaldetailsZoomImage"] %>' ">
            <%} %>

		    <h1><%=(string)dt.Rows[0]["SKUName"] %></h1>
			<div class="priceqty">
			<div class="quick-price">
			<div  class="discount"><span>Discount: </span><span>20% + 10%</span></div>
			<div  class="oldprice"><span>Rs. </span><span class="cut"><%=dt.Rows[0]["MRP"]+"" %></span></div>
			<div  class="rs"><span>Rs. </span><span><%=dt.Rows[0]["SpecialPrice"]+""%></span></div>
			<div  class="avl"> <span>Availability:</span><span class="instock"><%=avalibilty%></span></div>
            <div  class="avl"><span>SKU:</span><span class="instock"><%=(string)dt.Rows[0]["SKUCode"]%></span></div>
            </div>
			</div>
            <%if (inventory != null && inventory > 0)
               {%>
			<div class="addtocart_qty-quick">
			<label for="qty">Quantity :</label>
        <div class="qty-container">
           <select id='dd_quantity'>
                <%for (int i = 1; i <= inventory; i++){ %>
                    <option value='<%=i %>'> <%=i %> </option>
                <%} %>
            </select>
        </div>
		
		<div class=""><input type="button" onclick="addtoCart()" title="add  to cart" value="BUY NOW" class="addtocartbtn">
		</div>
			</div>
			</div>
			<%}else { %>
                    <p>Items is sold out, You can choose different size or color combination</p>

                <%} %>

            <%if ("true".Equals(isSize))
              { %>
			<div class="quick-size">Select Size:
             <ul>
                <%for (int i = 0; i < sizeDT.Rows.Count; i++)
                  { %>
                    <li namespace='sizeBtn' onclick="selectSize(this)" sku=''<%=sizeDT.Rows[i]["Size"] %>''><%=sizeDT.Rows[i]["Size"] %> </li>
                 <%} %>   
                </ul>
			<a href="#">Size Chart</a>
			</div>
            <%} %>  
            <%if ("true".Equals(isColor)) {%> 
			<div class="quick-color">
            <div class="avl">
               <span>Color:</span><span class="avlcolor"><%=(string)colorDT.Rows[0]["Color"]%></span></div>
                Also available in these colors:
              <ul>
                   <%for (int i = 0; i < colorDT.Rows.Count; i++)
                  { %>
                    <li>
                        <a href='<%=ConfigUtil.hostURL()%>?htm=<%=colorDT.Rows[i]["SKUCode"] %>'>  
                            <img style='height:60px;width:50px;' src='<%=ConfigUtil.getServerPath()%><%=colorDT.Rows[i]["PathInternaldetailsSmallImage"] %>'/>
                        </a>
                    </li>
                 <%} %>   
                </ul>
            </div>
            <%} %>
			
			<div class="wishlist-quick"><span><a href="#" title="add to wishlist">add to wishlist</a></span>
			<span><a href="#" title="email to a friend">email to a friend</a></span>
			<span><a href="#" title="share">share</a></span></div>
			
  </div>
</div>
</body>
</html>
