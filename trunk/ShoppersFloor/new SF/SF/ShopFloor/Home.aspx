<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Shoppers Floor Home Page</title>
    <%=Head %>
</head>
<body>
    <%=Header %>
    <!-- start Slider-->
    <!-- content -->
    <div class="container">
        <div class="main">
            <div class="row content_top">
                <div class="col-md-9 content_left">
                    <!-- start slider -->
                    <div id="fwslider">
                        <div class="slider_container">

                            <div class="slide">
                                <!-- Slide image -->
                                <img src='<%=ConfigUtil.StaticPath() %>new-images/banner/skirts.gif' class="img-responsive" alt="" />
                                <!-- /Slide image -->
                            </div>
                            <!-- /Duplicate to create more slides -->
                            <div class="slide">
                                <img src='<%=ConfigUtil.StaticPath() %>new-images/banner/deepika-saari.gif' class="img-responsive" alt="" />
                            </div>
                            <div class="slide">
                                <img src='<%=ConfigUtil.StaticPath() %>new-images/banner/home_banner3.jpg' alt="" />
                            </div>
                            <!--/slide -->
                        </div>
                        <div class="timers"></div>
                        <div class="slidePrev"><span></span></div>
                        <div class="slideNext"><span></span></div>
                    </div>

                    <!-- end  slider -->
                </div>
                <div class="col-md-3 sidebar">
                    <div class="grid_list">
                        <a href="#">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block2.jpg" class="img-responsive" alt="" />
                        </a>
                    </div>
                    <div class="grid_list">
                        <a href="details.html">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block4.jpg" class="img-responsive" alt="" />
                            <div class="clearfix"></div>
                        </a>
                    </div>
                      <div class="grid_list">
                        <a href="#">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block2.jpg" class="img-responsive" alt="" />
                        </a>
                    </div>
                    <%--<div class="grid_list"> 
			<a href="details.html">
				<div class="grid_img"> 
					<img src="images/grid_pic3.jpg" class="img-responsive" alt=""/>
				</div>
				<div class="grid_text left">
					<h3><a href="#">active gear store</a></h3>
					<p>shop now</p>
				</div>
				<div class="clearfix"></div>
			</a>
			</div>		--%>
                </div>
                <div class="clearfix"></div>
            </div>
            <!-- start content -->
            <div class="content">
                <div class="content_text">
                    <h3>brand of the week</h3>
                    <h4><a href="#">a touch of glamour </a></h4>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here',</p>
                </div>
                <!-- grids_of_3 -->
                <div class="row grids">
                    <div class="col-md-3 grid1">
                        <a href="details.html">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block6.jpg" class="img-responsive" alt="" />
                            <div class="look">
                                <h4>get scraves</h4>
                                <p>read more</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 grid1">
                        <a href="details.html">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block3.jpg" class="img-responsive" alt="" />
                            <div class="look">
                                <h4>Fashion Tips</h4>
                                <p>read more</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 grid1">
                        <a href="details.html">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block5.jpg" class="img-responsive" alt="" />
                            <div class="look">
                                <h4>Crop Levis</h4>
                                <p>read more</p>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 grid1">
                        <a href="details.html">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block3.jpg" class="img-responsive" alt="" />
                            <div class="look">
                                <h4>get scraves</h4>
                                <p>read more</p>
                            </div>
                        </a>
                    </div>
                </div>
                <!-- end grids_of_3 -->
                <!-- grids_of_3 -->
                <div class="row grids">
                    <div class="col-md-3 grid1 effect-oscar">
                        <a href="#">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block6.jpg" class="img-responsive" alt="">
                            <div>
                                <h2>Nice <span>Lily</span></h2>
                                <p>Bollywood Replica</p>
                                <b>View more</b>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 grid1 effect-oscar">
                        <a href="#">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block5.jpg" class="img-responsive" alt="">
                            <div>
                                <h2>Nice <span>Lily</span></h2>
                                <p>Bollywood Replica</p>
                                <b>View more</b>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 grid1 effect-oscar">
                        <a href="#">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block3.jpg" class="img-responsive" alt="">
                            <div>
                                <h2>Nice <span>Lily</span></h2>
                                <p>Bollywood Replica</p>
                                <b>View more</b>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-3 grid1 effect-oscar">
                        <a href="#">
                            <img src="<%=ConfigUtil.StaticPath() %>new-images/banner/home_block5.jpg" class="img-responsive" alt="">
                            <div>
                                <h2>Nice <span>Lily</span></h2>
                                <p>Bollywood Replica</p>
                                <b>View more</b>
                            </div>
                        </a>
                    </div>

                    <!-- end grids_of_3 -->
                </div>
                <!-- end content -->
            </div>
        </div>
    </div>
    <%=Footer %>
</body>
</html>
