<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <%=Head %>
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
            <!-- start end-->
            <div class="container-slider">
               <div class="banner7-container">
                  <div class="flexslider">
                     <div style="display: none;" class="loading">
                     </div>
                     <script type="text/javascript">
                         $jq(window).load(function () {
                             $jq('.banner7-container .flexslider').flexslider({
                                 animation: "slide",
                                 slideshowSpeed: 3000,
                                 animationSpeed: 600,
                                 controlNav: false,
                                 start: function (slider) {
                                     $jq('.loading').css("display", "none");
                                 }
                             });
                         });
                     </script>
                     <div style="overflow: hidden; position: relative;" class="flex-viewport">
                        <ul style="width: 100%; transition-duration: 0s; transform: translate3d(-1130px, 0px, 0px);"
                           class="slides">
                           <li style="width: 1330px; float: left; display: block;" class="clone"><a href="#"
                              title="">
                              <img src='<%=ConfigUtil.StaticPath() %>new-images/File-1388467675.jpg' alt=""></a> 
                           </li>
                           <li class="flex-active-slide" style="float: left; display: block;"><a
                              href="women#" title="">
                              <img src='<%=ConfigUtil.StaticPath() %>new-images/File-1376491867.jpg' alt=""></a> 
                           </li>
                           <li class="" style="float: left; display: block;"><a href="#" title="">
                              <img src='<%=ConfigUtil.StaticPath() %>new-images/File-1376491696.jpg' alt=""></a> 
                           </li>
                           <li class="" style="float: left; display: block;"><a href="" title="">
                              <img src='<%=ConfigUtil.StaticPath() %>new-images/File-1376400571.jpg' alt=""></a> 
                           </li>
                           <li class="" style="float: left; display: block;"><a href="#" title="">
                              <img src='<%=ConfigUtil.StaticPath() %>new-images/File-1388467675.jpg' alt=""></a> 
                           </li>
                           <li class="clone" style="float: left; display: block;"><a href="#"
                              title="">
                              <img src='<%=ConfigUtil.StaticPath() %>new-images/File-1376491867.jpg' alt=""></a> 
                           </li>
                        </ul>
                     </div>
                     <ul class="flex-direction-nav">
                        <li><a class="flex-prev" href="#">Previous</a></li>
                        <li><a class="flex-next" href="#">
                           Next</a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
            <!-- end enable -->
            <div class="main-container col1-layout">
               <div class="banner-static">
                  <div class="container">
                     <div class="contain-size">
                        <div class="row-fluid">
                           <div class="banner-box-inner index-image">
                              <a href="" target="_blank">
                              <img src="<%=ConfigUtil.StaticPath() %>new-images/block1.jpg" alt=""></a>
                           </div>
                           <div class="banner-box banner-box2 index-image1">
                              <div class="banner-box-inner">
                                 <a href="" target="_blank">
                                 <img src="<%=ConfigUtil.StaticPath() %>new-images/block2.jpg" alt=""></a>
                              </div>
                           </div>
                           <div class="banner-box banner-box3 index-image1">
                              <div class="banner-box-inner">
                                 <a href="" target="_blank">
                                 <img src='<%=ConfigUtil.StaticPath() %>new-images/block2.jpg' alt=""></a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="container">
                  <div class="contain-size">
                     <div class="main">
                        <div class="main-inner">
                           <div class="col-main">
                              <div class="std">
                                 <div class="home-content">
                                    <!-- end products list -->
                                    <div class="row-fluid">
                                       <div class="span4">
                                          <a class="" href="#">
                                          <img src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="" width="100%">
                                          </a>
                                          <a class="" href="#">  
                                          <img src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="" width="100%">
                                          </a>
                                       </div>
                                       <div class="span4" style="margin:0">
                                          <a class="" href="#">
                                          <img src='<%=ConfigUtil.StaticPath() %>new-images/block5.jpg' alt="Levis" width="100%">
                                          </a>
                                       </div>
                                       <div class="span4" style="margin:0">
                                          <a class="" href="#">
                                          <img src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="Fila" width="100%">
                                          </a>
                                          <a class="" href="#">
                                          <img src='<%=ConfigUtil.StaticPath() %>new-images/block3.jpg' alt="" width="100%">
                                          </a>
                                       </div>
                                    </div>
                                 </div>
                              </div>
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
      <div id="ajaxconfig_info" style="display: none">
         <button name="white" value="0.7">
         </button>
         <input id="enable_module" value="1" type="hidden">
      </div>
   </body>
</html>