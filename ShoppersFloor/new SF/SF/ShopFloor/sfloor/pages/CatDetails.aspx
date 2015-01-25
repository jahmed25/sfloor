<%@ Page Language="C#"  CodeFile="CatDetails.aspx.cs" Inherits="sfloor_CatDetails" %>
<%@ Import Namespace="MFO.Utils" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <%=Head %>
      <!-- start end-->
      <link rel="stylesheet" type="text/css" href='<%=ConfigUtil.StaticPath() %>new-css/etalage.css'>
      <link href='<%=ConfigUtil.StaticPath() %>new-css/internalpage.css' rel="stylesheet" type="text/css" />
      
      <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/cloudzoom.js'></script>
      <style>
         .catcrumbs{width:900px; line-height:20px; display: inline; float:left}
         .catcrumbs ul li { display: inline; }
      </style>
     
      <script type="text/javascript">
          CloudZoom.quickStart();
          function selectSize(txt) {
              jQuery("li[namespace='sizeBtn']").css({ 'background-color': '#EBEBEB', 'color': 'black' })
              jQuery(txt).css({ 'background-color': '#464646', 'color': 'white' });
              jQuery("#size").val(jQuery(txt).text());
          }
          function addtoCart() {

              if (jQuery('#isSize').val() == 'true' && jQuery('#size').val().length == 0) {
                  jQuery('#errorSize').css('display', 'block').text('Please select the size');
                  return;
              }
              var data = {
                  sku: jQuery('#style').val(),
                  qty: jQuery("#dd_quantity option:selected").val(),
                  color: jQuery("#color").val(),
                  size: jQuery("#size").val(),
                  isColor: jQuery("#isColor").val(),
                  isSize: jQuery("#isSize").val(),
                  isSku: jQuery("#isSku").val()
              }
              jQuery.ajax({
                  type: "get",
                  contentType: "application/json; charset=utf-8",
                  url: "<%=ConfigUtil.hostURL()%>sfloor/pages/AjaxService.aspx?action=addToCart",
                  data: data,
                  success: function (data) {
                      if (data.error != null) {
                          jQuery('#errorSize').css('display', 'block').text(data.error);
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
      <script type="text/javascript">
          jQuery(document).ready(function () {

              if (jQuery('#crumb4').text().trim().length == 0) {
                  jQuery('#crumb4').css('display', 'none');
              }
              else {
                  jQuery('#crumb4').css('display', 'block');
              }
          });
      </script>
      <script type="text/javascript">
          jQuery(document).ready(function () { initTabs(); });
          function initTabs() {
              jQuery('#tabMenu a').bind('click', function (e) {
                  e.preventDefault();
                  var thref = jQuery(this).attr("href").replace(/#/, '');
                  jQuery('#tabMenu a').removeClass('active');
                  jQuery(this).addClass('active');
                  jQuery('#tabContent div.content').removeClass('active');
                  jQuery('#' + thref).addClass('active');
              });
          }
          </script>
   </head>
   <body>
      <div>
         <div class="page">
            <%=Header %>
               <div class="right_inner_categorydetailssortby">
                  <div class="bradcrumbs-contain">
                     <div class="breadcrumbs" id="crumbs">
                        <ul>
                           <li id="crumb1"><a  href='<%=ConfigUtil.hostURL() %>Home'> Home </a></li>
                           <li id="crumb2"><span></span><a id='catNav' href='<%=ConfigUtil.hostURL() + StringUtil.urlEncode(dt.Rows[0]["SKUCategory"]+"")%>'> <%=dt.Rows[0]["SKUCategory"]%> </a></li>
                           <li id="crumb3"><span></span><a id='subCatNav' href='<%=ConfigUtil.hostURL() + StringUtil.urlEncode(dt.Rows[0]["SKUCategory"]+"")%>/<%=StringUtil.urlEncode(dt.Rows[0]["SKUCategoryType"]+"")%>'> <%=dt.Rows[0]["SKUCategoryType"]%>  </a></li>
                           <li id="crumb4"><span></span><a id='pTypeNav' href='<%=ConfigUtil.hostURL() + StringUtil.urlEncode(dt.Rows[0]["SKUCategory"]+"")%>/<%=StringUtil.urlEncode(dt.Rows[0]["SKUCategoryType"]+"")%>/<%=StringUtil.urlEncode(dt.Rows[0]["SKUProductType"]+"")%>'> <%=dt.Rows[0]["SKUProductType"]%> </a></li>
                        </ul>
                     </div>
                  </div>
               </div>

            <div class="categorypage-content">
               <div id="details-image">
                  <%if (!StringUtil.isNullOrEmpty((dt.Rows[0]["PathInternaldetailsZoomImage"] + "")))
                     { %>
                  <img class="cloudzoom" src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathInternaldetailsHoverImage"] %>' data-cloudzoom="zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathInternaldetailsZoomImage"] %>'" /> <br />
                  <img class='cloudzoom-gallery' src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathInternaldetailsHoverImage"] %>' data-cloudzoom="useZoom: '.cloudzoom', image: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathInternaldetailsZoomImage"] %>', zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathInternaldetailsZoomImage"] %>' ">
                  <%} %>
                  <%if (!StringUtil.isNullOrEmpty(dt.Rows[0]["PathUpperInternaldetailsSmallImage"] + "")){ %>
                  <img class='cloudzoom-gallery' src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathUpperInternaldetailsHoverImage"] %>' data-cloudzoom="useZoom: '.cloudzoom', image: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathUpperInternaldetailsZoomImage"] %>', zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathUpperInternaldetailsZoomImage"] %>' ">
                  <%} %>
                  <%if (!StringUtil.isNullOrEmpty(dt.Rows[0]["PathLowerInternaldetailsSmallImage"] + "")) {%>
                  <img class='cloudzoom-gallery' src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathLowerInternaldetailsHoverImage"] %>' data-cloudzoom="useZoom: '.cloudzoom', image: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathLowerInternaldetailsZoomImage"] %>', zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathLowerInternaldetailsZoomImage"] %>' ">
                  <%} %>
                  <%if (!StringUtil.isNullOrEmpty(dt.Rows[0]["PathBackInternaldetailsSmallImage"] + "")) {%>
                  <img class='cloudzoom-gallery' src='<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathBackInternaldetailsHoverImage"] %>' data-cloudzoom="useZoom: '.cloudzoom', image: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathBackInternaldetailsZoomImage"] %>', zoomImage: '<%=ConfigUtil.getServerPath() %><%=(string)dt.Rows[0]["PathBackInternaldetailsZoomImage"] %>' ">
                  <%} %>
               </div>
               
               <div id="description">
               <div class="prevnext">
                       <a class="previous" title="Previous Product" href='<%=ConfigUtil.hostURL() %><%=StringUtil.urlEncode(dt.Rows[0]["SKUName"]+"") %>?htm=<%=Request.Params["htm"]%>&action=prev&index=<%=index-1%>'> <i class="prev-i"></i><span>Previous</span></a>
                        <a class="next" title="Next Product" href='<%=ConfigUtil.hostURL() %><%=StringUtil.urlEncode(dt.Rows[0]["SKUName"]+"") %>?htm=<%=Request.Params["htm"]%>&action=next&index=<%=index%>'><span>Next</span><i class="next-i"></i></a>
                </div>	 
                  <h4><%=(string)dt.Rows[0]["SKUBrand"] %></h4>
                  <h1 ><%=(string)dt.Rows[0]["SKUName"] %></h1>
                  <div class="priceqty">
                     <div class="price">
                        <div class="discount">
                           <span>Discount: </span><span>20% + 10%</span>
                        </div>
                        <div class="oldprice">
                           <span>Rs. </span><span class="cut"><%=dt.Rows[0]["MRP"]+"" %></span>
                        </div>
                        <div class="rs">
                           <span>Rs. </span><span><%=dt.Rows[0]["SpecialPrice"]+""%></span>
                        </div>
                        <div class="avl">
                           <span>Availability:</span><span class="instock"><%=avalibilty%></span>
                        </div>
                        <div class="avl">
                           <span>SKU:</span><span class="instock"><%=(string)dt.Rows[0]["SKUCode"]%></span>
                        </div>
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
                           <input type="button" onclick="addtoCart()" title="add  to cart" value="BUY NOW" class="addtocartbtn"/>
                        </div>
                     </div>
                     <%}else { %>
                     <%--<p style='color:Red'>Items is sold out
                        <%if(!"Normal".Equals(dt.Rows[0]["SKUClassification"] + "")){%>
                        ,You can choose different size or color combination
                        <%} %>
                        .
                     </p>--%>
                     <%} %>
                  </div>
                  <span id='errorSize' style='color:red;display:none'>Please select the size</span>
                  <%if ("true".Equals(isSize))
                     { %>
                  <div class="size">
                     Select Size:
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
                        <span>Color:</span><span class="avlcolor"><%=(string)colorDT.Rows[0]["Color"]%></span>
                     </div>
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

                   <a href="#"><div class="fb_btn">
                   <iframe src="https://www.facebook.com/plugins/like.php?href= http://www.facebook.com/shoppesfloor" scrolling="no" frameborder="0"  class="iframe_fb"></iframe></div></a>
 
                  <div class="wishlist">
                     <span>
                     <%if (SFloor.DAO.FavDAO.isItemExist(Session.SessionID, dt.Rows[0]["SKUCode"] + ""))
                       {%>
                       <img src='<%=ConfigUtil.StaticPath()%>new-images/fav-active.png' height='24px' width='24px'/> 
                         <a href="javascript:void(0);" title="add to wishlist" name='saveLater' sku="<%=dt.Rows[0]["SKUCode"] %>">remove from wishlist</a>
                    <%}else{ %>
                        <img src='<%=ConfigUtil.StaticPath()%>new-images/fav-inactive.png' height='24px' width='24px'/> 
                         <a href="javascript:void(0);" title="add to wishlist" name='saveLater' sku="<%=dt.Rows[0]["SKUCode"] %>">add to wishlist</a></span>
                    <%} %>
                      <span><i class="emailicon"></i><a href="#" title="email to a friend">email to a friend</a></span>
                       <span><i class="shareicon"></i><a href="#" title="share"> share</a></span>
                  </div>


                  <div class="wishlist-quick">
                    <p id="wlNotificationInfo" style="color: Green; display: none;">
                        <small>Item has been added into WishList <a href="#" id="viewWLLink">click here to view
                            WishList</a></small></p>
                </div>
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
               <div id="tabContainer">
                  <div id="tabMenu">
                     <ul class="menu">
                        <li><a href="css" class="active"><span>FEATURES</span></a></li>
                        <li><a href="html"><span>At a Glance</span></a></li>
                        <li><a href="jquery"><span>RETURN</span></a></li>
                     </ul>
                  </div>
                  <div id="tabContent">
                     <div id="css" class="content active">
                        <hgroup>
                           <h2><%=dt.Rows[0]["SKUName"] %></h2>
                        </hgroup>
                        <p><%=dt.Rows[0]["SKULongDescription"]%></p>
                        <p><b>Brand :</b> <%=dt.Rows[0]["SKUBrand"]%></p>
                        <p><b>Wash Care : </b><%=dt.Rows[0]["WashCare"]%></p>
                        <p><b>Color : </b><%=dt.Rows[0]["Color"]%></p>
                        <p><b>Material : </b><%=dt.Rows[0]["Material"]%></p>
                     </div>
                     <div id="html" class="content">
                        <p><%=dt.Rows[0]["SKUProductDetails"] %></p>
                     </div>
                     <div id="jquery" class="content">
                        <ul>
                           <li>We will leave no stone unturned in getting that curve back on your face.</li>
                           <li>Whatever may be the reason, if you want to return your purchase, we will pick the product back from your doorstep, free of cost. <%=dt.Rows[0]["ShippingReturns"]%>&nbsp;of receipt.</li>
                           <li>Please make sure it is not a USED product, should be in the original box and with all price tags attached as you got them.</li>
                           <li>To know more, please&nbsp;<a style="color:#ef6910" href="faq.aspx">Click here</a></li>
                        </ul>
                     </div>
                  </div>
              </div>

        <style type="text/css">
            #related-product .item{margin: 3px;}
            #related-product .item img{display: block;width: 100%;height: auto;}
        </style>

        <script type="text/javascript">
            $kk(document).ready(function () {

                $kk("#related-product").owlCarousel({

                    navigation: true,
                    items: 5,
                    responsive: true,
                    lazyLoad: true,
                    afterInit: function (elem) {
                        var that = this
                        that.owlControls.prependTo(elem)
                    }
                });

            });
    </script>
        <script type="text/javascript">
            $kk(document).ready(function () {

                $kk("#recent-product").owlCarousel({

                    navigation: true,
                    items: 5,
                    responsive: true,
                    lazyLoad: true,
                    afterInit: function (elem) {
                        var that = this
                        that.owlControls.prependTo(elem)
                    }
                });

            });
    </script>

         <div class="row">
          <div class="span12">
            <h1 class="recentitem">Related Products</h1>
           </div>
         </div>

           <div class="row">
            <div class="span12">
              <div id="related-product" class="owl-carousel catdetail_button">
                  <%for (int i = 0; i < relProductDT.Rows.Count;i++ ) {%>
                <div class="item">
                <a href="<%=ConfigUtil.hostURL() %><%=StringUtil.urlEncode(relProductDT.Rows[i]["SKUName"]+"") %>?htm=<%=relProductDT.Rows[i]["SKUCode"] %>" class="">
                <img class="lazyOwl" data-src="<%=ConfigUtil.getServerPath() %><%=relProductDT.Rows[i]["PathInternaldetailsSmallImage"] %>" alt="image01" /><br>
                <span style="width:230px; overflow:hidden" ><%=relProductDT.Rows[i]["SKUName"] %></span><br>
                <span>Rs.<%=relProductDT.Rows[i]["SpecialPrice"] %></span></a>
                 </div><%} %>
                 </div>
               </div>
              </div>
              
<script type="text/javascript">
    $(document).ready(function () {
        $("#new-arrival").owlCarousel({
            navigation: true,
            items: 1,
            afterInit: function (elem) {
                var that = this
                that.owlControls.prependTo(elem)
            }
        });

    });
    </script>

     <div class="row">
       <div class="span12">
    <h2 class="recentitem">Recent Products</h2>
</div></div>
           <div class="row">
            <div class="span12">
              <div id="recent-product" class="owl-carousel catdetail_button">
               <%for (int i = 0; i < recentProductTD.Rows.Count;i++ ) {%>
                <div class="item"><a href="<%=ConfigUtil.hostURL() %><%=StringUtil.urlEncode(recentProductTD.Rows[i]["SKUName"]+"") %>?htm=<%=recentProductTD.Rows[i]["SKUCode"] %>" class="">
                           <img class="lazyOwl" data-src="<%=ConfigUtil.getServerPath() %><%=recentProductTD.Rows[i]["PathInternaldetailsSmallImage"] %>" alt="image01" /><br>
                           <span style="width:230px; overflow:hidden" ><%=recentProductTD.Rows[i]["SKUName"]%></span><br>
                           <span>Rs.<%=recentProductTD.Rows[i]["SpecialPrice"]%></span></a>
                       </div><%} %>
                 </div>
               </div>
              </div>
               </div>
            </div>
            <input type="hidden" id='style' value='<%=style%>' />
            <input type="hidden" id='color' value='<%=color%>' />
            <input type="hidden" id='isColor' value='<%=isColor%>' />
            <input type="hidden" id='size' value='' />
            <input type="hidden" id='isSku' value='<%=isSku%>' />
            <input type="hidden" id='isSize' value='<%=isSize%>' />

            <!-- End -->
            <%=Footer %>
         </div>
      </body>
</html>
