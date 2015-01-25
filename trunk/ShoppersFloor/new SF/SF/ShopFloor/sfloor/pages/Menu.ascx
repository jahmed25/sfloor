<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<%@ Import Namespace="SFloor.DTO" %>
<%--navigation--%>
<%--<script>
    $kk(document).ready(function () {
        $kk(".women-slider").owlCarousel({
            items: 4,
            lazyLoad: true,
            rewindSpeed: 1,
            navigation: true
        });
    });
</script>--%>
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/new/style.css" />
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/new/megamenu.css" />
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/new/fwslider.css" />
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/new/etalage.css" />
<link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/new/bootstrap.css" />

<%-- <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/new/jquery-1.11.1.min.js"></script>--%>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/new/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/new/fwslider.js"></script>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/new/jquery.etalage.min.js"></script>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/new/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/new/megamenu.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<script type="text/javascript">jQuery(document).ready(function () { jQuery(".megamenu").megamenu(); });</script>

<script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/new/menu_jquery.js"></script>

<div class="nav-container">
    <div class="container">
        <!-- start header menu -->
        <ul class="megamenu skyblue">
            <li class="active grid">
                <%-- Start WOMens Section--%>
                <a class="color4" href='<%=ConfigUtil.hostURL() %>Women'>women</a>
                <div class="megapanel">
                    <div class="row">
                        <%foreach (MenuDTO menu in WomenDTO)
                          {
                              int i = 1; string first = "first"; %>
                        <div class='<%=first %> col<%=i%>'>
                            <div class="h_nav">
                                <h4><a href='<%=menu.Url %>'>
                                    <%=menu.Heading %></a></h4>
                                <ul>
                                    <%foreach (MenuDTO subMenu in menu.Contents)
                                      {%>
                                    <li><a class="itemMenuName level2" href='<%=subMenu.Url %>'><%=subMenu.Heading %></a></li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>
                        <%i++; first = "";
                        }%>
                        <%--						<div class="col1">
							<div class="h_nav">
								<h4>help</h4>
								<ul>
									<li><a href="women.html">trends</a></li>
									<li><a href="women.html">sale</a></li>
									<li><a href="women.html">style videos</a></li>
									<li><a href="women.html">accessories</a></li>
									<li><a href="women.html">kids</a></li>
									<li><a href="women.html">style videos</a></li>
								</ul>	
							</div>							
						</div>--%>
                    </div>
                    <div class="row">
                        <div class="col2"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                    </div>
                </div>
            </li>

            <%-- Start Mens Section--%>
            <li>
                <a class="color5" href='<%=ConfigUtil.hostURL() %>Men'>Men</a>
                <div class="megapanel">
                    <div class="row">
                        <%foreach (MenuDTO menu in MenDTO)
                          {
                              int i = 1; string first = "first"; %>
                        <div class='<%=first %> col<%=i%>'>
                            <div class="h_nav">
                                <h4><a href='<%=menu.Url %>'>
                                    <%=menu.Heading %></a></h4>

                                <ul>
                                    <%foreach (MenuDTO subMenu in menu.Contents)
                                      {%>
                                    <li><a class="itemMenuName level2" href='<%=subMenu.Url %>'><%=subMenu.Heading %></a></li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>
                        <%i++; first = "";
                        }%>
                        <%--	<div class="col1">
							<div class="h_nav">
								<h4>help</h4>
								<ul>
									<li><a href="women.html">trends</a></li>
									<li><a href="women.html">sale</a></li>
									<li><a href="women.html">style videos</a></li>
									<li><a href="women.html">accessories</a></li>
									<li><a href="women.html">kids</a></li>
									<li><a href="women.html">style videos</a></li>
								</ul>	
							</div>							
						</div>--%>
                    </div>
                    <div class="row">
                        <div class="col2"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                    </div>
                </div>
            </li>

            <%-- Start Home Decor Section--%>
            <li>
                <a class="color6" href='<%=ConfigUtil.hostURL() %>Home-Decor'>Home & Decor</a>
                <div class="megapanel">
                    <div class="row">
                        <%foreach (MenuDTO menu in HdDTO)
                          {
                              int i = 1; string first = "first"; %>
                        <div class='<%=first %> col<%=i%>'>
                            <div class="h_nav">
                                <h4><a href='<%=menu.Url %>'><%=menu.Heading %></a></h4>
                                <ul>
                                    <%foreach (MenuDTO subMenu in menu.Contents)
                                      {%>
                                    <li><a class="itemMenuName level2" href='<%=subMenu.Url %>'><%=subMenu.Heading %></a></li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>

                        <%i++; first = "";
                        }%>
                    </div>
                    <div class="row">
                        <div class="col2"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                        <div class="col1"></div>
                    </div>
                </div>
            </li>

            <%-- Start brand Section--%>
            <li><a class="color7" href="#">brands</a>
                <div class="megapanel">
                    <div class="row">
                        <%foreach (MenuDTO menu in BrandDTO)
                          {
                              int i = 1; string first = "first"; %>
                        <div class='<%=first %> col<%=i%>'>
                            <div class="h_nav">
                                <h4><a href='<%=menu.Url %>'><%=menu.Heading %></a></h4>
                                <ul>
                                    <%foreach (MenuDTO subMenu in menu.Contents)
                                      {%>
                                    <li><a class="itemMenuName level2" href='<%=subMenu.Url %>'><%=subMenu.Heading %></a></li>
                                    <%} %>
                                </ul>
                            </div>
                        </div>
                        <%i++; first = "";
                        }%>
                    </div>
                </div>
            </li>
            <li><a class="color8" href="#">trends</a>
                <div class="megapanel">
                    <div class="row">
                        <div class="col1">
                            <div class="h_nav">
                                <h4>shop</h4>
                                <ul>
                                    <li><a href="women.html">new arrivals</a></li>
                                    <li><a href="women.html">men</a></li>
                                    <li><a href="women.html">women</a></li>
                                    <li><a href="women.html">accessories</a></li>
                                    <li><a href="women.html">kids</a></li>
                                    <li><a href="women.html">brands</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li><a class="color9" href="#">sale</a>
                <div class="megapanel">
                    <div class="row">
                        <div class="col1">
                            <div class="h_nav">
                                <h4>shop</h4>
                                <ul>
                                    <li><a href="women.html">new arrivals</a></li>
                                    <li><a href="women.html">men</a></li>
                                    <li><a href="women.html">women</a></li>
                                    <li><a href="women.html">accessories</a></li>
                                    <li><a href="women.html">kids</a></li>
                                    <li><a href="women.html">brands</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="background_overlay" style="display: none;"></div>
<div id="overlay_form" style="display: none;" class="loginregisterform" ng-app='registration' ng-controller='regCtrl'>
    <a title="close" class="x" id="close" href="#">x</a>
    <div class="loginform">
        <div class="headtitle"><span>Login</span></div>
        <form name='loginForm' class='css-form'>
            <p ng-show="login.errors.system" class="help-block" id='P2'>{{login.errors.system}}.</p>
            <table>
                <tr>
                    <th>Username:</th>
                    <td>
                        <input type="email" name='logEmail' ng-keyup="validateEmail()" placeholder="e.g. example@example.com" required ng-model="login.email"
                            ng-change="removelogErro('email')">
                        <p ng-show="loginForm.logEmail.$invalid && !loginForm.logEmail.$pristine" class="help-block">Email is not valid.</p>
                        <p ng-show="login.errors.email" class="help-block" id='P4'>{{login.errors.email}}.</p>
                        <p ng-show="login.errors.info" style="color: Green" id='P3'>{{login.errors.info}}.</p>
                    </td>
                </tr>
                <tr>
                    <th>Password:</th>
                    <td>
                        <input type="Password" name='logPwd' placeholder="Password" required ng-model="login.pwd" ng-minlength="8" ng-maxlength="20"
                            ng-change="removelogErro('pwd')">
                        <p ng-show="loginForm.logPwd.$invalid && !loginForm.logPwd.$pristine" class="help-block">Password required length between 8 to 20</p>
                        <p ng-show="login.errors.pwd" class="help-block" id='errlogPwd'>{{login.errors.pwd}}.</p>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <p id="fgt_clk_hre"><a class="fgtclk">Forgot password? click here</a></p>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <input type="button" value="Login" class="button" ng-click="login()" ng-disabled="loginForm.$invalid"></td>
                </tr>
            </table>
        </form>
    </div>
    <div class="midline"></div>
    <div class="registerform">
        <div class="headtitle"><span>Register</span></div>
        <form name='regForm' class='css-form' ng-submit="register()">
            <p ng-show="user.errors.system" class="help-block" id='errSystem'>{{user.errors.system}}.</p>
            <table>
                <tr>
                    <th>Email ID:</th>
                    <td>
                        <input type="email" name='email' ng-keyup="validateRegEmail()" placeholder="e.g. example@example.com" required ng-model="user.email" ng-change="removeErro('email')">
                        <p ng-show="regForm.email.$invalid && !regForm.email.$pristine" class="help-block">Email is not valid.</p>
                        <p ng-show="user.errors.email" class="help-block" id='errUsrEmail'>{{user.errors.email}}.</p>
                        <p ng-show="user.errors.info" style="color: Green" id='P5'>{{user.errors.info}}.</p>
                    </td>
                </tr>
                <tr>
                    <th>Password:</th>
                    <td>
                        <input type="password" name='pwd' ng-change="removeErro('pwd')" placeholder="Password" required ng-model="user.pwd" ng-minlength="8" ng-maxlength="20">
                        <p ng-show="regForm.pwd.$invalid && !regForm.pwd.$pristine" class="help-block">Password required length between 8 to 20</p>
                        <p ng-show="user.errors.pwd" class="help-block" id='errPwd'>{{user.errors.pwd}}.</p>
                    </td>
                </tr>
                <tr>
                    <th>Mobile:</th>
                    <td>
                        <input type="text" name='mobile' ng-pattern="/[0-9]/" placeholder="Mobile" ng-model="user.mobile" ng-minlength="10" ng-maxlength="10">
                        <p ng-show="regForm.mobile.$invalid && !regForm.mobile.$pristine" class="help-block">Mobile no length should be 10 digit</p>
                        <p ng-show="user.errors.mobile" class="help-block" id='errMobile'>{{user.errors.mobile}}.</p>
                    </td>
                </tr>
                <tr>
                    <th>Gender:</th>
                    <td class="gender">
                        <span>Male: </span>
                        <input type='radio' name='gender' value='Male' required ng-model="user.gender" />
                        <span>Female:</span><input type='radio' name='gender' value='Female' required ng-model="user.gender" />
                        <p ng-show="regForm.gender.$invalid && !regForm.gender.$pristine" class="help-block">Please select gender</p>
                        <p ng-show="user.errors.gender" class="help-block" id='P1'>{{user.errors.gender}}.</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="offercheck">
                        <input type="checkbox" name="checkbox" ng-model="user.newsLts">&nbsp;&nbsp;I want to receive news and special offers</td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <input type="button" value="Signup" class="button" ng-click="register()" ng-disabled="regForm.$invalid"></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</section>
<div class="fgt_background_overlay" style="display: none;"></div>
<div id="fgt_overlay_form" style="display: none;" class="loginregisterform" ng-app='registration' ng-controller='regCtrl'>
    <a title="close" class="x" id="fgt_close" href="#">x</a>
    <div class="loginform">
        <div class="headtitle"><span>Forgot Password</span></div>
        <form name='loginForm' class='css-form fgt_form '>
            <p ng-show="login.errors.system" class="help-block" id='P6'>{{login.errors.system}}.</p>
            <table>
                <tr>
                    <td>Enter your email address</td>
                </tr>
                <tr>
                    <td>
                        <input type="email" name='logEmail' ng-keyup="validateEmail()" placeholder="e.g. example@example.com" required ng-model="login.email"
                            ng-change="removelogErro('email')">
                        <p ng-show="loginForm.logEmail.$invalid && !loginForm.logEmail.$pristine" class="help-block">Email is not valid.</p>
                        <p ng-show="login.errors.email" class="help-block" id='P7'>{{login.errors.email}}.</p>
                        <p ng-show="login.errors.info" style="color: Green" id='P8'>{{login.errors.info}}.</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>We'll send you a link to reset your password.</p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="Send" class="button" ng-click="login()" ng-disabled="loginForm.$invalid"></td>
                </tr>
                <tr>
                    <td>
                        <p><a id="logsign">Signup / Login</a></p>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</section>
