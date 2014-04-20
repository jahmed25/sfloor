<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageLayout.master"
    AutoEventWireup="true" EnableEventValidation="false" EnableViewStateMac="false"
    ViewStateEncryptionMode="Never" CodeFile="CatDetails.aspx.cs" Inherits="sfloor_CatDetails" %>
<%@ Import Namespace="MFO.Utils" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/etalage.css'>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/modernizr.custom.17475.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/cloudzoom.js'></script>
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
    <div class="categorypage-content">
        <div id="details-image">
            <%if (!StringUtil.isNullOrEmpty((dt.Rows[0]["PathInternaldetailsZoomImage"] + "")))
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
        </div>
        <div id="description">
            <h4><%=(string)dt.Rows[0]["SKUBrand"] %></h4>
            <h1 ><%=(string)dt.Rows[0]["SKUName"] %></h1>
            <div class="priceqty">
                <div class="price">
                    <div class="discount">
                        <span>Discount: </span><span>20% + 10%</span></div>
                    <div class="oldprice">
                        <span>Rs. </span><span class="cut"><%=dt.Rows[0]["MRP"]+"" %></span></div>
                    <div class="rs">
                        <span>Rs. </span><span><%=dt.Rows[0]["SpecialPrice"]+""%></span></div>
                    <div class="avl">
                        <span>Availability:</span><span class="instock"><%=avalibilty%></span></div>
                    <div class="avl">
                    <span>SKU:</span><span class="instock"><%=(string)dt.Rows[0]["SKUCode"]%></span></div>
                </div>
                <%if (inventory != null && inventory > 0)
                  {%>

                <div class="addtocart_qty">
                    <label for="qty">
                        Quantity :</label>
                    <div class="qty-container">
                       <select id='dd_quantity'>
                        <%for (int i = 1; i <= inventory; i++){ %>
                            <option value='<%=i %>'> <%=i %> </option>
                        <%} %>
                       </select>
                    </div>
                    <div class="">
                        <input type="button" onclick="addtoCart()" title="add  to cart" value="BUY NOW" class="addtocartbtn"/></div>
                </div>
                <%}else { %>
                    <p>Items is sold out, You can choose different size or color combination</p>

                <%} %>
            </div>
            <%if ("true".Equals(isSize))
              { %>
            <div class="size">
                Select Size:
                <span id='errorSize' style='color:red;display:none'>Please select the size</span>
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
            <div class="color">
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
            <div class="wishlist">
                <span><a href="#" title="add to wishlist">add to wishlist</a></span> <span><a href="#"
                    title="email to a friend">email to a friend</a></span> <span><a href="#" title="share">
                        share</a></span></div>
            <div class="policy">
                <div class="cod">
                    <strong>Cash On Delivery</strong><br>
                    <i>Rs. 49 extra charges</i>
                </div>
                <div class="shipping">
                    <strong>FREE </strong>Shipping<br>
                    <i>*On Purchases Above Rs 499</i>
                </div>
                <div class="cod">
                    <strong>FREE </strong>Replacement<br>
                    <i>*Within 15 Days</i>
                </div>
            </div>
        </div>
        <div id="description-content">
            <div class="tabs">
                <div class="tab">
                    <input id="tab-1" name="tab-group-1" checked="checked" type="radio">
                    <label for="tab-1">
                        FEATURES</label>
                    <div class="billcontent">
                        <hgroup><h2><i>Details of &nbsp;</i><%=dt.Rows[0]["SKUName"] %></h2></hgroup>
                        <p><%=dt.Rows[0]["SKULongDescription"]%></p>
                         <div class="tab-2_details">
                            <p><b>Brand :</b> <%=dt.Rows[0]["SKUBrand"]%></p>
                            <p><b>Wash Care : </b><%=dt.Rows[0]["WashCare"]%></p>
                            <p><b>Color : </b><%=dt.Rows[0]["Color"]%></p>
                            <p><b>Material : </b><%=dt.Rows[0]["Material"]%></p>
                        </div>  
                    </div>
                </div>
                <div class="tab">
                    <input id="tab-2" name="tab-group-1" type="radio">
                    <label for="tab-2">
                        At a Glance</label>
                    <div class="billcontent">
                        <p><%=dt.Rows[0]["SKUProductDetails"] %></p>
                    </div>
                </div>
                <div class="tab">
                    <input id="tab-3" name="tab-group-1" type="radio">
                    <label for="tab-3">
                        RETURN</label>
                    <div class="billcontent">
                        <ul>
                           <li><a>We will leave no stone unturned in getting that curve back on your face.</a></li>
                           <li><a>Whatever may be the reason, if you want to return your purchase, we will pick the product back from your doorstep, free of cost. <%=dt.Rows[0]["ShippingReturns"]%>&nbsp;of receipt.</a></li>
                           <li><a>Please make sure it is not a USED product, should be in the original box and with all price tags attached as you got them.</a></li>
                           <li><a>To know more, please</a>&nbsp;<a class="a_faq" href="faq.aspx">Click here</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="relateditem">
                <h2>
                    Related Product</h2>
                <ul id="carousel" class="elastislide-list">
                <%for (int i = 0; i < relProductDT.Rows.Count;i++ ) {%>
                    <li><a href="<%=ConfigUtil.hostURL() %>?htm=<%=relProductDT.Rows[i]["SKUCode"] %>" class="">
                        <img src="<%=ConfigUtil.getServerPath() %><%=relProductDT.Rows[i]["PathInternaldetailsSmallImage"] %>" alt="image01" /><br>
                        <span><%=relProductDT.Rows[i]["SKUName"] %></span><br>
                        <span>Rs.<%=relProductDT.Rows[i]["SpecialPrice"] %></span></a></li>
                   <%} %>
                </ul>
            </div>
            <div class="relateditem">
                <h2>
                    Recent View</h2>
                <ul id="carousel1" class="elastislide-list">
                     <%for (int i = 0; i < recentProductTD.Rows.Count;i++ ) {%>
                    <li><a href="<%=ConfigUtil.hostURL() %>?htm=<%=recentProductTD.Rows[i]["SKUCode"] %>" class="">
                        <img src="<%=ConfigUtil.getServerPath() %><%=recentProductTD.Rows[i]["PathInternaldetailsSmallImage"] %>" alt="image01" /><br>
                        <span><%=recentProductTD.Rows[i]["SKUName"]%></span><br>
                        <span>Rs.<%=recentProductTD.Rows[i]["SpecialPrice"]%></span></a></li>
                   <%} %>                
                   </ul>
            </div>
        </div>
        </div>
        <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/jquery.elastislide.js"></script>
        <script type="text/javascript">
            $('#carousel').elastislide();
            $('#carousel1').elastislide();
        </script>
        <input type="hidden" id='style' value='<%=style%>' />
        <input type="hidden" id='color' value='<%=color%>' />
        <input type="hidden" id='isColor' value='<%=isColor%>' />
        <input type="hidden" id='size' value='' />
        <input type="hidden" id='isSku' value='<%=isSku%>' />
        <input type="hidden" id='isSize' value='<%=isSize%>' />
</asp:Content>
