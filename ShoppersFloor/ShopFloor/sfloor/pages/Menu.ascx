<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<%@ Import Namespace="SFloor.DTO" %>
<link href='<%=ConfigUtil.StaticPath() %>new-css/custommenu.css' rel="stylesheet" type="text/css" />
<link href='<%=ConfigUtil.StaticPath() %>new-css/shoppersfloor.css' rel="stylesheet" type="text/css" media="all"/>
<link href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' rel="stylesheet" type="text/css" />
 <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
 <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
    
<style>
    #overlay_form
    {
        background: WHITE;
        z-index: 100000;
    }
    .background_overlay
    {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 100000;
        background: white;
        opacity: 0.9;
    }
    .css-form input.ng-invalid.ng-dirty
    {
        outline: 2PX SOLID #FA787E;
    }
    
    .css-form input.ng-valid.ng-dirty
    {
        outline: 2PX SOLID #78FA89;
    }
    .css-form p
    {
        color: #FA787E;
    }
</style>
  <%--for mobile navigation view--%>
 <div class="nav-mobile-container hidden-desktop">
                    <div class="container">
                        <div class="contain-size">
                            <div class="navbar">
                                <div id="navbar-inner" class="navbar-inner navbar-inactive">
                                    <a class="btn btn-navbar"><i class="icon-reorder"></i></a><span class="brand">Main Menu</span>
                                    <ul id="mobilemenu" class="mobilemenu nav-collapse collapse">
                                        <li class="level0 nav-1 level-top first parent"><a href="/women#" class="level-top">
                                            <span>Women</span> </a>
                                            <ul style="display: none;" class="level0">
                                                <li class="level1 nav-1-1 first parent"><a href=""><span>T-Shirts</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-1-1-1 first"><a href=""><span>Cocktail</span> </a></li>
                                                        <li class="level2 nav-1-1-2"><a href=""><span>Day</span> </a></li>
                                                        <li class="level2 nav-1-1-3"><a href=""><span>Sweaters</span> </a></li>
                                                        <li class="level2 nav-1-1-4"><a href=""><span>Belts</span> </a></li>
                                                        <li class="level2 nav-1-1-5 last"><a href=""><span>Evening</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href=""></a></span></li>
                                                <li class="level1 nav-1-2 parent"><a href="/women/dresses#"><span>Dresses</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-1-2-6 first"><a href=""><span>Lifestyle</span> </a></li>
                                                        <li class="level2 nav-1-2-7"><a href=""><span>Cocktail</span> </a></li>
                                                        <li class="level2 nav-1-2-8"><a href=""><span>Day</span> </a></li>
                                                        <li class="level2 nav-1-2-9"><a href=""><span>Belts</span> </a></li>
                                                        <li class="level2 nav-1-2-10 last"><a href=""><span>Evening</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href=""></a></span></li>
                                                <li class="level1 nav-1-3 parent"><a href=""><span>Tops</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-1-3-11 first"><a href=""><span>Sunglasses</span> </a></li>
                                                        <li class="level2 nav-1-3-12"><a href=""><span>Bras</span> </a></li>
                                                        <li class="level2 nav-1-3-13"><a href=""><span>Scarves</span> </a></li>
                                                        <li class="level2 nav-1-3-14"><a href=""><span>Evening</span> </a></li>
                                                        <li class="level2 nav-1-3-15 last"><a href=""><span>Sleeveless</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href=""></a></span></li>
                                                <li class="level1 nav-1-4 last parent"><a href=""><span>Lingeri</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-1-4-16 first"><a href=""><span>Toter</span> </a></li>
                                                        <li class="level2 nav-1-4-17"><a href=""><span>Clutches</span> </a></li>
                                                        <li class="level2 nav-1-4-18"><a href=""><span>Cross Body</span> </a></li>
                                                        <li class="level2 nav-1-4-19"><a href=""><span>Shoulders</span>
                                                        </a></li>
                                                        <li class="level2 nav-1-4-20 last"><a href=""><span>Satchels</span>
                                                        </a></li>
                                                    </ul>
                                                    <span class="head"><a href=""></a></span></li>
                                            </ul>
                                            <span class="head"><a href=""></a></span></li>
                                        <li class="level0 nav-2 level-top parent"><a href="" class="level-top"><span>Men</span>
                                        </a>
                                            <ul style="display: none;" class="level0">
                                                <li class="level1 nav-2-1 first parent"><a href=""><span>Clothing</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-2-1-1 first"><a href=""><span>Coats &amp; Jackets </span></a>
                                                        </li>
                                                        <li class="level2 nav-2-1-2"><a href=""><span>Blazers</span> </a></li>
                                                        <li class="level2 nav-2-1-3"><a href=""><span>Jackets</span> </a></li>
                                                        <li class="level2 nav-2-1-4 last"><a href=""><span>Raincoats</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                                <li class="level1 nav-2-2 parent"><a href=""><span>Shoes</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-2-2-5 first"><a href=""><span>Footwears</span> </a></li>
                                                        <li class="level2 nav-2-2-6"><a href=""><span>Ankle Boots</span> </a></li>
                                                        <li class="level2 nav-2-2-7"><a href=""><span>Clog Sandles</span> </a></li>
                                                        <li class="level2 nav-2-2-8 last"><a href=""><span>Combat Boots</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                                <li class="level1 nav-2-3 last parent"><a href=""><span>Bags</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-2-3-9 first"><a href="/men/bags/belts#"><span>Belts</span> </a>
                                                        </li>
                                                        <li class="level2 nav-2-3-10"><a href="/men/bags/footwears#"><span>Footwears</span>
                                                        </a></li>
                                                        <li class="level2 nav-2-3-11 last"><a href="/men/bags/bras#"><span>Bras</span> </a>
                                                        </li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                            </ul>
                                            <span class="head"><a href="javascript:void(0)"></a></span></li>
                                        <li class="level0 nav-3 level-top parent"><a href="/kids#" class="level-top"><span>Home & Decor</span>
                                        </a>
                                            <ul style="display: none;" class="level0">
                                                <li class="level1 nav-3-1 first parent"><a href="#"><span>Boys</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-3-1-1 first"><a href="/t-shirts#"><span>T-Shirts</span> </a>
                                                        </li>
                                                        <li class="level2 nav-3-1-2"><a href="/jeans#"><span>Jeans</span> </a></li>
                                                        <li class="level2 nav-3-1-3 last"><a href="/sweaters#"><span>Sweaters</span> </a>
                                                        </li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                                <li class="level1 nav-3-2 parent"><a href="/kids/girls#"><span>Girls</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-3-2-4 first"><a href="/kids/girls/frocks#"><span>Frocks</span>
                                                        </a></li>
                                                        <li class="level2 nav-3-2-5"><a href="/kids/girls/tops#"><span>Tops</span> </a></li>
                                                        <li class="level2 nav-3-2-6"><a href="/kids/girls/bottomwear#"><span>Bottomwear</span>
                                                        </a></li>
                                                        <li class="level2 nav-3-2-7 last"><a href="/kids/girls/sweaters#"><span>Sweaters</span>
                                                        </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                                <li class="level1 nav-3-3 last parent"><a href="/kids/accessories#"><span>Accessories</span>
                                                </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-3-3-8 first"><a href="/kids/accessories/bags#"><span>Bags</span>
                                                        </a></li>
                                                        <li class="level2 nav-3-3-9"><a href="/kids/accessories/watches#"><span>Watches</span>
                                                        </a></li>
                                                        <li class="level2 nav-3-3-10"><a href="/kids/accessories/jwellery#"><span>Jwellery</span>
                                                        </a></li>
                                                        <li class="level2 nav-3-3-11 last"><a href="/kids/accessories/sunglasses#"><span>Sunglasses</span>
                                                        </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                            </ul>
                                            <span class="head"><a href="javascript:void(0)"></a></span></li>
                                        <li class="level0 nav-4 level-top parent"><a href="/accessories#" class="level-top">
                                            <span>Brands</span> </a>
                                            <ul style="display: none;" class="level0">
                                                <li class="level1 nav-4-1 first parent"><a href=""><span>For Men</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-4-1-1 first"><a href=""><span>Bags</span> </a></li>
                                                        <li class="level2 nav-4-1-2"><a href=""><span>Watches</span> </a></li>
                                                        <li class="level2 nav-4-1-3"><a href=""><span>Sunglasses</span> </a></li>
                                                        <li class="level2 nav-4-1-4"><a href=""><span>Belts</span> </a></li>
                                                        <li class="level2 nav-4-1-5"><a href=""><span>Jewellery</span> </a></li>
                                                        <li class="level2 nav-4-1-6 last"><a href=""><span>Wallets</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                                <li class="level1 nav-4-2 parent"><a href=""><span>For Women</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-4-2-7 first"><a href=""><span>Bags &amp; Wallets</span> </a>
                                                        </li>
                                                        <li class=" nav-4-2-8"><a href=""><span>Watches</span> </a></li>
                                                        <li class="level2 nav-4-2-9"><a href="#"><span>Jewellery</span> </a></li>
                                                        <li class="level2 nav-4-2-10 last"><a href=""><span>Sunglasses</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                                <li class="level1 nav-4-3 parent"><a href=""><span>Personal Care</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-4-3-11 first"><a href=""><span>Cosmetic &amp; Perfumes</span>
                                                        </a></li>
                                                        <li class="level2 nav-4-3-12"><a href=""><span>Fragnance &amp; Duos</span> </a></li>
                                                        <li class="level2 nav-4-3-13 last"><a href=""><span>Grooming</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                                <li class="level1 nav-4-4 last parent"><a href=""><span>Featured</span> </a>
                                                    <ul style="display: none;" class="level1">
                                                        <li class="level2 nav-4-4-14 first"><a href=""><span>High Siera</span> </a></li>
                                                        <li class="level2 nav-4-4-15"><a href=""><span>Steve Madan</span> </a></li>
                                                        <li class="level2 nav-4-4-16"><a href=""><span>Accessorize</span> </a></li>
                                                        <li class="level2 nav-4-4-17 last"><a href=""><span>Casio</span> </a></li>
                                                    </ul>
                                                    <span class="head"><a href="javascript:void(0)"></a></span></li>
                                            </ul>
                                            <span class="head"><a href="javascript:void(0)"></a></span></li>
                                        <li class="level0 nav-5 level-top"><a href="" class="level-top"><span>Offer</span>
                                        </a></li>
                                    
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--end mobile navigation view--%>
<div class="nav-container visible-desktop">
    <div class="container">
     
         <div class="contain-size">
              <div id="pt_custommenu" class="pt_custommenu">
                 <div id="pt_menu_home" class="pt_menu">
                    <div class="parentMenu"></div>
                    </div>
                 <div id="pt_menu3" class="pt_menu nav-1">
                     <div class="parentMenu">
                        <a href="#"><span>Women</span> </a>
                     </div>
                     <div id="popup3" class="popup" style="width: 100%; top: 40px; left: 0px; display: none;">
                         <div class="block1" id="block13">
                         <%foreach (MenuDTO menu in womenDTO)
                            { int i = 1; string first = "first"; %>
                             <div class='column <%=first %> col<%=i%>'>
                                <div class="itemMenu level1">
                                    <a class="itemMenuName level1" href='<%=menu.Url %>'><span><%=menu.Heading %></span></a>
                                    <div class="itemSubMenu level1">
                                        <div class="itemMenu level2">
                                            <%foreach (MenuDTO subMenu in menu.Contents) {%>
                                                <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span><%=subMenu.Heading %></span></a>
                                            <%} %>
                                         </div>
                                    </div>
                                </div>
                             </div>
                             <%i++; first = "";
                            }%>
                             <div class="clearBoth">
                             </div>
                        </div>
                         <div class="block2" id="block23">
                             <div class="row-fluid">
                                                <div class="span3">
                                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-1.jpg' alt=""></div>
                                                <div class="span3">
                                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-2.jpg' alt=""></div>
                                                <div class="span3">
                                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-3.jpg' alt=""></div>
                                                <div class="span3">
                                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-4.jpg' alt=""></div>
                                            </div>
                         </div>
                     </div>
                 </div>
                <%-- Start Mens Section--%>
                 <div id="pt_menu4" class="pt_menu nav-2">
                     <div class="parentMenu">
                        <a href=""><span>Men</span> </a>
                    </div>
                     <div id="popup4" class="popup" style="width: 100%; top: 40px; left: 0px; display: none;">
                        <div class="block1" id="block14">
                            <%foreach (MenuDTO menu in menDTO)
                            { int i = 1; string first = "first"; %>
                             <div class='column <%=first %> col<%=i%>'>
                                <div class="itemMenu level1">
                                    <a class="itemMenuName level1" href='<%=menu.Url %>'><span><%=menu.Heading %></span></a>
                                    <div class="itemSubMenu level1">
                                        <div class="itemMenu level2">
                                            <%foreach (MenuDTO subMenu in menu.Contents) {%>
                                                <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span><%=subMenu.Heading %></span></a>
                                            <%} %>
                                         </div>
                                    </div>
                                </div>
                             </div>
                             <%i++; first = "";
                            }%>           
                            <div class="clearBoth">
                            </div>
                        </div>
                        <div class="block2" id="block24">
                            <div class="row-fluid">
                                <div class="span6">
                                    <img src="<%=ConfigUtil.StaticPath() %>new-images/sale-banner-1.jpg" alt=""></div>
                                <div class="span6">
                                    <img src="<%=ConfigUtil.StaticPath() %>new-images/sale-banner-2.jpg" alt=""></div>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- End Mens Section--%>
                <%--Start home decor Section--%>
                 <div id="pt_menu5" class="pt_menu nav-3">
                    <div class="parentMenu">
                        <a href=""><span>Home & Decor</span> </a>
                    </div>
                    <div id="popup5" class="popup" style="width: 100%; top: 40px; left: 0px; display: none;">
                        <div class="block1" id="block15">
                          <%foreach (MenuDTO menu in hdDTO)
                            { int i = 1; string first = "first"; %>
                             <div class='column <%=first %> col<%=i%>'>
                                <div class="itemMenu level1">
                                    <a class="itemMenuName level1" href='<%=menu.Url %>'><span><%=menu.Heading %></span></a>
                                    <div class="itemSubMenu level1">
                                        <div class="itemMenu level2">
                                            <%foreach (MenuDTO subMenu in menu.Contents) {%>
                                                <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span><%=subMenu.Heading %></span></a>
                                            <%} %>
                                         </div>
                                    </div>
                                </div>
                             </div>
                             <%i++; first = "";}%>           
                            <div class="clearBoth">
                            </div>
                        </div>
                        <div class="block2" id="block25">
                            <div class="row-fluid">
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-1.jpg' alt=""></div>
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-2.jpg' alt=""></div>
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-3.jpg' alt=""></div>
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-4.jpg' alt=""></div>
                            </div>
                        </div>
                    </div>
                </div>
                 <%--end home decor Section--%>
                 <div id="pt_menu6" class="pt_menu nav-4">
                                    <div class="parentMenu">
                                        <a href="#"><span>Brands</span> </a>
                                    </div>
                                    
                                    <div id="Div1" class="popup" style="width: 100%; top: 40px; left: 0px; display: none;">
                        <div class="block1" id="Div2">
                          <%foreach (MenuDTO menu in brandDTO)
                            { int i = 1; string first = "first"; %>
                             <div class='column <%=first %> col<%=i%>'>
                                <div class="itemMenu level1">
                                    <a class="itemMenuName level1" href='<%=menu.Url %>'><span><%=menu.Heading %></span></a>
                                    <div class="itemSubMenu level1">
                                        <div class="itemMenu level2">
                                            <%foreach (MenuDTO subMenu in menu.Contents) {%>
                                                <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span><%=subMenu.Heading %></span></a>
                                            <%} %>
                                         </div>
                                    </div>
                                </div>
                             </div>
                             <%i++; first = "";}%>           
                            <div class="clearBoth">
                            </div>
                        </div>
                        <div class="block2" id="Div3">
                            <div class="row-fluid">
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-1.jpg' alt=""></div>
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-2.jpg' alt=""></div>
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-3.jpg' alt=""></div>
                                <div class="span3">
                                    <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-4.jpg' alt=""></div>
                            </div>
                        </div>
                    </div>
                                </div>
                 <%--End Shop by brand Section--%>
                 <%--offer Section--%>
                 <div id="pt_menu14" class="pt_menu nav-8 pt_menu_no_child">
                                    <div class="parentMenu">
                                        <a href="#"><span>Offer</span> </a>
                                    </div>
                                    <%--End Offer Section--%>
                                </div>
                 <div class="clearBoth">
                 </div>
            </div>
    </div>
</div>
</div>
<div class="background_overlay" style="display: none;"></div>
      <div  id="overlay_form"  class="sfloor-form" style="display:none;" ng-app='registration' ng-controller='regCtrl'>
	    <div class="body-s">
		     <a title="close" class="x" id="close" href="#" >x</a>					
				<div class="login">
				<div class="headtitle"><span>Login</span></div>
                <form name='loginForm'>	
                <p ng-show="login.errors.system" class="help-block" id='P2'> {{login.errors.system}}.</p>
				            <table class="register">
                                <tr>
                                    <td>Username:</td>
                                    <td>
                                        <label class="input">
                                            <input type="email" name='logEmail' ng-keyup="validateEmail()" placeholder="e.g. example@example.com" required  ng-model="login.email" ng-change="removelogErro('email')">
							                <p ng-show="loginForm.logEmail.$invalid && !loginForm.logEmail.$pristine">Email is not valid.</p>
							                <p ng-show="login.errors.email" class="help-block" id='P4'> {{login.errors.email}}.</p>
							                <p ng-show="login.errors.info" style="color:Green" id='P3'> {{login.errors.info}}.</p>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password:</td>
                                    <td><label class="input">
                                          <input type="Password" name='logPwd' placeholder="Password" required  ng-model="login.pwd" ng-minlength="8" ng-maxlength="20" ng-change="removelogErro('pwd')">
                                          <p ng-show="loginForm.logPwd.$invalid && !loginForm.logPwd.$pristine" class="help-block">Password required length between 8 to 20</p>
							              <p ng-show="login.errors.pwd" class="help-block" id='errlogPwd'> {{login.errors.pwd}}.</p>
                                      </label></td>
                                </tr>
                        <tr><td></td><td style="" >
                            <input type="button" value="Login" class="button" ng-click="login()" ng-disabled="loginForm.$invalid">
                      </td></tr>
                     </table>
                        </form>
                        </div>
                        <div class="midline"></div>

                      
		<form name='regForm' class='css-form' ng-submit="register()">     
		<div class="register">
		<div class="headtitle"><span>Register</span></div>	
		<p ng-show="user.errors.system" class="help-block" id='errSystem'>{{user.errors.system}}.</p>

			<table class="register">
				<tr>
					<td>Email ID:</td>
					<td>
						<label class="input">
							<input type="email" name='email'  ng-keyup="validateRegEmail()" placeholder="e.g. example@example.com" required  ng-model="user.email" ng-change="removeErro('email')">
							<p ng-show="regForm.email.$invalid && !regForm.email.$pristine">Email is not valid.</p>
							<p ng-show="user.errors.email" class="help-block" id='errUsrEmail'> {{user.errors.email}}.</p>
				            <p ng-show="user.errors.info" style="color:Green" id='P5'> {{user.errors.info}}.</p>
						</label>
					</td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><label class="input">
							<input type="password" name='pwd' ng-change="removeErro('pwd')" placeholder="Password" required ng-model="user.pwd" ng-minlength="8" ng-maxlength="20">
							<p ng-show="regForm.pwd.$invalid && !regForm.pwd.$pristine" class="help-block">Password required length between 8 to 20</p>
							<p ng-show="user.errors.pwd" class="help-block" id='errPwd'> {{user.errors.pwd}}.</p>
						</label></td>
				</tr>
                <tr>
				  <td>Mobile:</td>
					<td><label class="input"  >
							<input type="text" name='mobile' ng-pattern="/[0-9]/" placeholder="Mobile" ng-model="user.mobile" ng-minlength="10" ng-maxlength="10">
							<p ng-show="regForm.mobile.$invalid && !regForm.mobile.$pristine" class="help-block">Mobile no length should be 10 digit</p>
							<p ng-show="user.errors.mobile" class="help-block" id='errMobile'> {{user.errors.mobile}}.</p>
							
						</label></td>
				</tr>
				<tr>
					<td>Gender:
					</td>
					<td style="FLOAT:LEFT">
						Male: <input type='radio' name='gender' value='Male' required ng-model="user.gender"/>
						Female:<input type='radio' name='gender' value='Female' required ng-model="user.gender"//>
	          		    <p ng-show="regForm.gender.$invalid && !regForm.gender.$pristine" class="help-block">Please select gender</p>
					   	<p ng-show="user.errors.gender" class="help-block" id='P1'> {{user.errors.gender}}.</p>

					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:left; padding:10px 0px 10px 100px" >
						<input type="checkbox" name="checkbox" ng-model="user.newsLts">&nbsp;&nbsp;I want to receive news and special offers
					</td><td></td>
				</tr>
				<tr><td></td><td style="margin:0 auto" >
					
						<input type="button" value="Signup" class="button" ng-click="register()" ng-disabled="regForm.$invalid">
				 </td></tr>
			</table>
		</div>	
	
</form>
</div>	</div>
                             <div style="display: none;" id="back-top" class="hidden-phone"><a href="#" rel="tooltip" title="Top"></a>	</div>
                        