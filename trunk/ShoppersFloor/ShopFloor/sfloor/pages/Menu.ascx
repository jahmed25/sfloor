<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<%@ Import Namespace="SFloor.DTO" %>

<%--navigation--%>

<div class="nav-container">
   <div class="container">
      <div class="contain-size">
         <div id="pt_custommenu" class="pt_custommenu">
            <div id="pt_menu_home" class="pt_menu">
               <div class="parentMenu">
               </div>
            </div>
            <div id="pt_menu3" class="pt_menu nav-1">
               <div class="parentMenu">
                  <a href="#"><span>Women</span> </a>
               </div>
               <div id="popup3" class="popup" style="width: 100%; top: 40px; left: 0px; display: none;">
                  <div class="block1" id="block13">
                     <%foreach (MenuDTO menu in WomenDTO)
                        {
                            int i = 1; string first = "first"; %>
                     <div class='column <%=first %> col<%=i%>'>
                        <div class="itemMenu level1">
                           <a class="itemMenuName level1" href='<%=menu.Url %>'><span>
                           <%=menu.Heading %></span></a>
                           <div class="itemSubMenu level1">
                              <div class="itemMenu level2">
                                 <%foreach (MenuDTO subMenu in menu.Contents)
                                    {%>
                                 <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span>
                                 <%=subMenu.Heading %></span></a>
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
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-1.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-2.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-3.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/menu-block-4.jpg' alt="">
                        </div>
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
                     <%foreach (MenuDTO menu in MenDTO)
                        {
                            int i = 1; string first = "first"; %>
                     <div class='column <%=first %> col<%=i%>'>
                        <div class="itemMenu level1">
                           <a class="itemMenuName level1" href='<%=menu.Url %>'><span>
                           <%=menu.Heading %></span></a>
                           <div class="itemSubMenu level1">
                              <div class="itemMenu level2">
                                 <%foreach (MenuDTO subMenu in menu.Contents)
                                    {%>
                                 <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span>
                                 <%=subMenu.Heading %></span></a>
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
                           <img src="<%=ConfigUtil.StaticPath() %>new-images/sale-banner-1.jpg" alt="">
                        </div>
                        <div class="span6">
                           <img src="<%=ConfigUtil.StaticPath() %>new-images/sale-banner-2.jpg" alt="">
                        </div>
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
                     <%foreach (MenuDTO menu in HdDTO)
                        {
                            int i = 1; string first = "first"; %>
                     <div class='column <%=first %> col<%=i%>'>
                        <div class="itemMenu level1">
                           <a class="itemMenuName level1" href='<%=menu.Url %>'><span>
                           <%=menu.Heading %></span></a>
                           <div class="itemSubMenu level1">
                              <div class="itemMenu level2">
                                 <%foreach (MenuDTO subMenu in menu.Contents)
                                    {%>
                                 <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span>
                                 <%=subMenu.Heading %></span></a>
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
                  <div class="block2" id="block25">
                     <div class="row-fluid">
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-1.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-2.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-3.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-4.jpg' alt="">
                        </div>
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
                     <%foreach (MenuDTO menu in BrandDTO)
                        {
                            int i = 1; string first = "first"; %>
                     <div class='column <%=first %> col<%=i%>'>
                        <div class="itemMenu level1">
                           <a class="itemMenuName level1" href='<%=menu.Url %>'><span>
                           <%=menu.Heading %></span></a>
                           <div class="itemSubMenu level1">
                              <div class="itemMenu level2">
                                 <%foreach (MenuDTO subMenu in menu.Contents)
                                    {%>
                                 <a class="itemMenuName level2" href='<%=subMenu.Url %>'><span>
                                 <%=subMenu.Heading %></span></a>
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
                  <div class="block2" id="Div3">
                     <div class="row-fluid">
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-1.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-2.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-3.jpg' alt="">
                        </div>
                        <div class="span3">
                           <img src='<%=ConfigUtil.StaticPath() %>new-images/kids-menu-4.jpg' alt="">
                        </div>
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
<section>
   <div  id="overlay_form" style="display:none;" class="loginregisterform" ng-app='registration' ng-controller='regCtrl'>
      <a title="close" class="x" id="close" href="#" >x</a>		
      <div class="loginform">
         <div class="headtitle"><span>Login</span></div>
         <form name='loginForm' class='css-form' >
            <p ng-show="login.errors.system" class="help-block" id='P2'> {{login.errors.system}}.</p>
            <table>
               <tr>
                  <th>Username:</th>
                  <td>
                     <input type="email" name='logEmail' ng-keyup="validateEmail()" placeholder="e.g. example@example.com" required  ng-model="login.email" 
                        ng-change="removelogErro('email')">
                     <p ng-show="loginForm.logEmail.$invalid && !loginForm.logEmail.$pristine" class="help-block">Email is not valid.</p>
                     <p ng-show="login.errors.email" class="help-block" id='P4'> {{login.errors.email}}.</p>
                     <p ng-show="login.errors.info" style="color:Green" id='P3'> {{login.errors.info}}.</p>
                  </td>
               </tr>
               <tr>
                  <th>Password:</th>
                  <td>
                     <input type="Password" name='logPwd' placeholder="Password" required  ng-model="login.pwd" ng-minlength="8" ng-maxlength="20" 
                        ng-change="removelogErro('pwd')">
                     <p ng-show="loginForm.logPwd.$invalid && !loginForm.logPwd.$pristine" class="help-block">Password required length between 8 to 20</p>
                     <p ng-show="login.errors.pwd" class="help-block" id='errlogPwd'> {{login.errors.pwd}}.</p>
                  </td>
               </tr>
               <tr>
                  <th></th>
                  <td>
                     <p id="fgt_clk_hre" ><a class="fgtclk">Forgot password? click here</a></p>
                  </td>
               </tr>
               <tr>
                  <th></th>
                  <td> <input type="button" value="Login" class="button" ng-click="login()" ng-disabled="loginForm.$invalid"></td>
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
                     <input type="email" name='email'  ng-keyup="validateRegEmail()" placeholder="e.g. example@example.com" required  ng-model="user.email" ng-change="removeErro('email')">
                     <p ng-show="regForm.email.$invalid && !regForm.email.$pristine" class="help-block">Email is not valid.</p>
                     <p ng-show="user.errors.email" class="help-block" id='errUsrEmail'> {{user.errors.email}}.</p>
                     <p ng-show="user.errors.info" style="color:Green" id='P5'> {{user.errors.info}}.</p>
                  </td>
               </tr>
               <tr>
                  <th>Password:</th>
                  <td>
                     <input type="password" name='pwd' ng-change="removeErro('pwd')" placeholder="Password" required ng-model="user.pwd" ng-minlength="8" ng-maxlength="20">
                     <p ng-show="regForm.pwd.$invalid && !regForm.pwd.$pristine" class="help-block">Password required length between 8 to 20</p>
                     <p ng-show="user.errors.pwd" class="help-block" id='errPwd'> {{user.errors.pwd}}.</p>
                  </td>
               </tr>
               <tr>
                  <th>Mobile:</th>
                  <td>
                     <input type="text" name='mobile' ng-pattern="/[0-9]/" placeholder="Mobile" ng-model="user.mobile" ng-minlength="10" ng-maxlength="10">
                     <p ng-show="regForm.mobile.$invalid && !regForm.mobile.$pristine" class="help-block">Mobile no length should be 10 digit</p>
                     <p ng-show="user.errors.mobile" class="help-block" id='errMobile'> {{user.errors.mobile}}.</p>
                  </td>
               </tr>
               <tr>
                  <th>Gender:</th>
                  <td class="gender">
                     <span>Male: </span><input type='radio' name='gender' value='Male' required ng-model="user.gender"/>
                     <span>Female:</span><input type='radio' name='gender' value='Female' required ng-model="user.gender"/>
                     <p ng-show="regForm.gender.$invalid && !regForm.gender.$pristine" class="help-block">Please select gender</p>
                     <p ng-show="user.errors.gender" class="help-block" id='P1'> {{user.errors.gender}}.</p>
                  </td>
               </tr>
               <tr>
                  <td colspan="2" class="offercheck"><input type="checkbox" name="checkbox" ng-model="user.newsLts">&nbsp;&nbsp;I want to receive news and special offers</td>
               </tr>
               <tr>
                  <th></th>
                  <td><input type="button" value="Signup" class="button" ng-click="register()" ng-disabled="regForm.$invalid"></td>
               </tr>
            </table>
         </form>
      </div>
   </div>
</section>
<div class="fgt_background_overlay" style="display: none;"></div>
<section>
   <div  id="fgt_overlay_form" style="display:none;" class="loginregisterform" ng-app='registration' ng-controller='regCtrl'>
      <a title="close" class="x" id="fgt_close" href="#" >x</a>		
      <div class="loginform">
         <div class="headtitle"><span>Forgot Password</span></div>
         <form name='loginForm' class='css-form fgt_form ' >
            <p ng-show="login.errors.system" class="help-block" id='P6'> {{login.errors.system}}.</p>
            <table>
               <tr>
                  <td>Enter your email address</td>
               </tr>
               <tr>
                  <td>
                     <input type="email" name='logEmail' ng-keyup="validateEmail()" placeholder="e.g. example@example.com" required  ng-model="login.email" 
                        ng-change="removelogErro('email')">
                     <p ng-show="loginForm.logEmail.$invalid && !loginForm.logEmail.$pristine" class="help-block">Email is not valid.</p>
                     <p ng-show="login.errors.email" class="help-block" id='P7'> {{login.errors.email}}.</p>
                     <p ng-show="login.errors.info" style="color:Green" id='P8'> {{login.errors.info}}.</p>
                  </td>
               </tr>
               <tr>
                  <td>
                     <p>We'll send you a link to reset your password.</p>
                  </td>
               </tr>
               <tr>
                  <td><input type="button" value="Send" class="button" ng-click="login()" ng-disabled="loginForm.$invalid"></td>
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
<div style="display: none;" id="back-top" class="hidden-phone">
   <a href="#" rel="tooltip" title="Top"></a>
</div>