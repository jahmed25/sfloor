<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="Mens-section.aspx.cs" Inherits="mens_section" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
        <title>Shoppers Floor || Mens</title>
      <%=Head %>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/owl.carousel.js"></script>
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/owl.carousel.css">
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/owl.theme.css">
   </head>
  <body>
        <div class="page">
            <%=Header %>
            <!-- start Slider-->
        <script type="text/javascript">
             $kk(document).ready(function () {
                 $kk("#sfloorCarousel").owlCarousel({
                     autoPlay: 5000,
                     navigation: true,
                     slideSpeed: 300,
                     paginationSpeed: 400,
                     rewindSpeed: 1,
                     singleItem: true,
                     autoHeight: true

                 });
             });



             $kk(document).ready(function () {

                 $kk(".men-slider").owlCarousel({
                     items: 3,
                     lazyLoad: true,
                     rewindSpeed: 1,
                     navigation: true
                 });

             });

             jQuery(document).ready(function () {

                 jQuery('#tabs li a:not(:first)').addClass('inactive');
                 jQuery('.women-arr > .container').hide();
                 jQuery('.women-arr > .container:first').show();

                 jQuery('#tabs li a').click(function () {
                     var t = jQuery(this).attr('id');
                     if (jQuery(this).hasClass('inactive')) { //this is the start of our condition 
                         jQuery('#tabs li a').addClass('inactive');
                         jQuery(this).removeClass('inactive');

                         jQuery('.women-arr > .container').hide();
                         jQuery('#' + t + 'C').fadeIn('slow');
                     }
                 });

             });
            
    </script>

            <div class="row-fluid">
            <div class="span12">
              <div id="sfloorCarousel" class="owl-carousel home_button">
                <div class="item"><a href="#" title=""><img src='<%=ConfigUtil.StaticPath() %>new-images/home-decor.jpg' alt=""></a></div>
                <div class="item"><a href="#" title=""><img src='<%=ConfigUtil.StaticPath() %>new-images/File-1376491867.jpg' alt=""></a></div>
                <div class="item"><a href="#" title=""><img src='<%=ConfigUtil.StaticPath() %>new-images/File-1388467675.jpg' alt=""></a></div>
                <div class="item"><a href="" title=""><img src='<%=ConfigUtil.StaticPath() %>new-images/File-1376400571.jpg' alt=""></a> </div>
                <div class="item"><a href="#" title=""><img src='<%=ConfigUtil.StaticPath() %>new-images/File-1376491696.jpg' alt=""></a></div>
            </div>
          </div>
          </div>
           <!-- End Slider-->

            <!-- end enable -->
    
       <div class="main-container col1-layout">
            <div class="container">
               <div class="row-fluid">
                  <div class="span4 effect-marley">
                     <a class="" href="#">  
                     <img src='<%=ConfigUtil.StaticPath() %>new-images/block4.jpg' alt="" width="100%">
                     </a>
                  </div>
                  <div class="span4"> 
                     <a class="" href="#">  
                     <img src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="" width="100%">
                     </a>
                  </div>
                  <div class="span4"> 
                     <a class="" href="#">  
                     <img src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="" width="100%">
                     </a>
                  </div>
               </div>
               <div class="row-fluid">
                  <div class="span12">
                    <div class="new-collection">
                     <h2>New Collections</h2>
                     <i class="leftarrow"></i>
                  </div>
                  </div>
               </div>
               <div class="row-fluid">
                  <div class="span12">
                     <div class="men-slider owl-carousel collection-img">
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">
                        <a href="#" class="buybtn">Buy Now</a>
                        </div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">
                          <a href="#" class="buybtn">Buy Now</a>
                      </div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">
                          <a href="#" class="buybtn">Buy Now</a>
                      </div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block1.jpg' alt="">
                          <a href="#" class="buybtn">Buy Now</a>
                      </div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">
                          <a href="#" class="buybtn">Buy Now</a>
                      </div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">
                          <a href="#" class="buybtn">Buy Now</a>
                      </div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">
                          <a href="#" class="buybtn">Buy Now</a>
                      </div>
                     </div>
                  </div>
               </div>
              
               <div class="row-fluid">
                   <div class="span12">
                    <div class="new-collection">
                     <h2>Best Seller</h2>
                     <i class="leftarrow"></i>
                  </div>
                    <div class="women-arr">
                  <ul id="tabs">
                     <li><a id="tab1">Top</a></li>
                     <li><a id="tab2">Suits</a></li>
                     <li><a id="tab3">Sari</a></li>
                     <li><a id="tab4">Footwear</a></li>
                  </ul>
                  <div class="container" id="tab1C">
                     <div class="men-slider owl-carousel">
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block1.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                     </div>
                  </div>
                  <div class="container" id="tab2C">
                     <div class="men-slider owl-carousel">
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block1.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                     </div>
                  </div>
                  <div class="container" id="tab3C">
                     <div class="men-slider owl-carousel">
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block1.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                     </div>
                  </div>
                  <div class="container" id="tab4C">
                     <div class="men-slider owl-carousel">
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block1.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                        <div class="item"><img class="lazyOwl" data-src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt="">   <a href="#" class="buybtn">Buy Now</a></div>
                     </div>
                  </div>
               </div>
               </div>
            </div>
         </div>
         <!-- End -->
         <%=Footer %>
      </div>
      </div> 
  </body>
</html>