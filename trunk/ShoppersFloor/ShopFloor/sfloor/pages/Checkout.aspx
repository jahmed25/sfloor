<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="sfloor_pages_Checkout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Checkout</title>
    
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
    <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/tabcontent.js" ></script>
    <script type="text/javascript" src="<%=ConfigUtil.StaticPath() %>new-js/common1.js"></script>
    <link type="text/css"  href="<%=ConfigUtil.StaticPath() %>new-css/checkoutpage_n.css" rel="stylesheet" />
    <link type="text/css"  href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' rel="stylesheet" />
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <style type="text/css">
		ul li:hover
		{
		    background-color:orange;
		}
	</style>
    <%if(!MFO.Commom.CommonUtil.DT.isEmptyOrNull(shipDT)){ %>
           <script type="text/javascript">
               function getShip() {
               var scope = angular.element($("body")).scope();
               scope.$apply(function () {
                   scope.ship= {city : '<%=shipDT.Rows[0]["CITY"] %>',
                       state :'<%=shipDT.Rows[0]["STATE"] %>',
                       email : '<%=shipDT.Rows[0]["EMAIL"] %>',
                       fName : '<%=shipDT.Rows[0]["NAME"] %>',
                       phone : '<%=shipDT.Rows[0]["MOBILE"] %>',
                       pin : '<%=shipDT.Rows[0]["PIN"] %>',
                       address : '<%=shipDT.Rows[0]["ADDRESS"] %>'
                   }
               });
           }
           </script>
        <%} %>
           
	<script type="text/javascript">
	    var path = '<%=ConfigUtil.hostURL() %>';
	    var isEmail = '<%=Session["EmailID"] %>'
	    var isShip = '<%=shipDT.Rows.Count%>'
	    var tab = '<%=Session["tab"] %>'
	    $(function () {
	        if (tab == 3) {
	            thirdTab();
	        }
	        else if (isEmail.trim().length > 0 && isShip > 0) {
	            thirdTab();
	        }
	        else if (isEmail.trim().length > 0) {
	            secondTab();
	        }

	        $("[qtyUpdate]").on("change", function () {
	            var sku = $(this).attr('qtyUpdate');
	            var qty = $(this).val();
	            $.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=updateQty', data: { sku: sku, qty: qty} })
					.success(function (msg) {
					    window.location = path + 'check-out';
					});
	        });
	        $("[remove]").on("click", function () {
	            var sku = $(this).attr('sku')
	            $.ajax({ method: 'POST', url: path + 'sfloor/pages/AjaxService.aspx?action=removeFromCart', data: { sku: sku} })
					.success(function (msg) {
					    window.location = path + 'check-out';
					});

	        });
	        $(window).bind('resize', popup);
	        $("#pinTxt").autocomplete({
	            source: function (request, response) {
	                $.ajax({
	                    type: "POST",
	                    url: path + 'sfloor/pages/AjaxService.aspx?action=getPin',
	                    data: { startWith: request.term },
	                    success: function (data) {
	                        response(data);
	                    },
	                    error: function (msg) {
	                        alert(msg.status + ' ' + msg.statusText);
	                    }
	                })
	            },
	            select: function (event, ui) {
	                $.ajax({
	                    type: "POST",
	                    url: path + 'sfloor/pages/AjaxService.aspx?action=getCityState',
	                    data: { pin: ui.item.label },
	                    success: function (data) {
	                        $("#cityTxt").val(data.city);
	                        $("#stateTxt").val(data.state);
	                    },
	                    error: function (msg) {
	                        alert(msg.status + ' ' + msg.statusText);
	                    }
	                })
	            }
	        });
	        $("#cityTxt").autocomplete({
	            source: function (request, response) {
	                $.ajax({
	                    type: "POST",
	                    url: path + 'sfloor/pages/AjaxService.aspx?action=getCity',
	                    data: { startWith: request.term },
	                    success: function (data) {
	                        response(data);
	                    },
	                    error: function (msg) {
	                        alert(msg.status + ' ' + msg.statusText);
	                    }
	                })

	            }
	        });
	        $("#stateTxt").autocomplete({
	            source: function (request, response) {
	                $.ajax({
	                    type: "POST",
	                    url: path + 'sfloor/pages/AjaxService.aspx?action=getState',
	                    data: { startWith: request.term },
	                    success: function (data) {
	                        response(data);
	                    },
	                    error: function (msg) {
	                        alert(msg.status + ' ' + msg.statusText);
	                    }
	                });
	            }
	        });
	    });
	   
	</script>
     <script type="text/javascript">
         function showShipping(v) {
             if (v == 1) {
                 secondTab();
                 return;
             }
             if ($("[name='uType']:checked").val() == "guest") {
                 secondTab();
             } else if ($("[name='uType']:checked").val() == "regular") {
                 $("#checkout_overlay_form").fadeIn(1000);
                 $(".checkout_background_overlay").fadeIn(500);
                 popup();
             } else { $("#errorSpan").text("Make the selection.").css({ display: block }); }
         }
         function popup() {
             if (!$("#checkout_overlay_form").is(':visible')) {
                 return;
             }
             $("#checkout_overlay_form").css({
                 left: ($(window).width() - $('#checkout_overlay_form').width()) / 2,
                 top: ($(window).width() - $('#checkout_overlay_form').width()) / 7,
                 position: 'absolute'
             });
         }
         function secondTab() {
             $(".tabs li").removeClass('selected');
             $(".tabs li:nth-child(2)").addClass("selected");
             $(".tabcontents > div").css("display", "none");
             $("#view2").slideDown();
             $("#errorSpan").css("display", "none");
         }
         function submitForm(valid) {
             $.ajax({
                 type: "POST",
                 url: path + 'sfloor/pages/AjaxService.aspx?action=addShipping',
                 data: $('#cForm').serialize(),
                 success: function (data) {
                     if (data.status) {
                         thirdTab();
                         var city = $('#cityTxt').val();
                         var state = $('#stateTxt').val();
                         var scope = angular.element($("body")).scope();
                         scope.$apply(function () {
                             scope.ship.city = city;
                             scope.ship.state = state;
                         });
                     } else {
                         alert('not added');
                     }
                 },
                 error: function (msg) {
                     alert(msg.status + ' ' + msg.statusText);
                 }
             });

         }
         function thirdTab() {
             $(".tabs li").removeClass('selected');
             $(".tabs li:nth-child(3)").addClass("selected");
             $(".tabcontents > div").css("display", "none");
             $("#view3").slideDown();
             $("#errorSpan").css("display", "none");
         }
         
    </script>
</head>
<body ng-app='registration' ng-controller='regCtrl' onload="getShip()">
<%if(!MFO.Commom.CommonUtil.DT.isEmptyOrNull(cartDT)){ %>
<style type="text/css">
    #checkout_overlay_form
    {
        background: WHITE;
        z-index: 100000;
    }
    .checkout_background_overlay
    {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 100000;
        background: black;
        opacity: 0.9;
    }
    #fgt_overlay_form
    {
        background: WHITE;
        z-index: 100000;
    }
    .fgt_background_overlay
    {
        position: fixed;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
        z-index: 100000;
        background: black;
        opacity: 0.8;
    }

    .css-form input.ng-invalid.ng-dirty
    {
        border: 2PX SOLID #FA787E;
    }
    
    .css-form input.ng-valid.ng-dirty
    {
        border: 2PX SOLID #78FA89;
    }
    .css-form .help-block
    {
        color: #FA787E; font-size:12px;
    }
    .error{color:red}
    .button input.disabled{background-color:Blue}
</style>

    <div class="ckeckoutmain_sec">
        <header><div id="header">
        <div class="logo"><a href="<%=ConfigUtil.hostURL() %>Home"><img src="<%=ConfigUtil.StaticPath() %>new-images/newlogo.png" width="220px" height="50px"></a></diV>
        <div>
        <a href='<%=ConfigUtil.hostURL() %>Home' class="btn_shipinfo bck_to_shp">Back to shop</a>
</div>
</div>
 </header>
        <div class="ckeckoutmain">
            <ul class="tabs">
                <li><a href="#view1">Email Or Login <span>1</span></a></li>
                <li><a href="#view2">Shipping <span>2</span></a></li>
                <li><a href="#view3">Payment <span>3</span></a></li>
            </ul>
            <div class="tabcontents">
                <div id="view1">
                     <span id='errorSpan' style='color: red'></span>
                    <% if (Session[MFO.Constants.Constant.Session.LOGED_IN_EMAIL] == null)
                       { %>
                    <p>
                        <input type="radio" name="uType" value='guest' />&nbsp;&nbsp;Continue without password
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i><small>(You do not need a password)</small></i></p>
                    <p>
                        <input type="radio" id="checkoutlogin" name="uType" value='regular' onclick='showShipping()'/>&nbsp;&nbsp;I
                        have a Shoppersfloor account and password
                        <br>
                        &nbsp;&nbsp; &nbsp;&nbsp;<i><small>Sign in to your account and checkout faster</small></i></p>
                    <input class="btn_shipinfo" onclick='showShipping(0)' style="float: right" type="button"
                        value="CONTINUE" />
                    <%}
                       else
                       { %>
                    You are already logged in as '<%=Session[MFO.Constants.Constant.Session.LOGED_IN_EMAIL] %>'.
                    <input class="btn_shipinfo" type="button" onclick='showShipping(1)' value="CONTINUE">
                    <br>
                    <small>If you wish to login with another account you can <a href='<%=ConfigUtil.hostURL()%>logout'>
                        click here</a> to logout</small>
                    <%} %>
                </div>
                <div id="view2">
                    		<h1> Shipping Information</h1>
			<form id='cForm' name="cForm" novalidate > 
			<table>
				<tr>
					<th>Email Id*</th>
					<td>
						<input type="email" name="email" required ng-model="ship.email">
						<small class="error" ng-show="cForm.email.$error.required && !cForm.email.$pristine ">Email Id is required.</small>
						<small class="error" ng-show="cForm.email.$invalid && !cForm.email.$pristine &&!cForm.email.$error.required">This is not an Email Id.</small>
					</td>
				</tr>
				<tr>
					<th>Name*</th>
					<td>
						<input type="text" name="fname" required ng-model="ship.fName" ng-pattern="/^([a-zA-Z-']{1,30})$/"/>
						<small class="error" ng-show="cForm.fname.$error.required && !cForm.fname.$pristine ">Name  required.</small>
						<small class="error" ng-show="cForm.fname.$invalid && !cForm.fname.$pristine &&!cForm.fname.$error.required ">Name should not contain digit</small>
					</td>
				</tr>
				<tr>
					<th>Phone No.*</th>
					<td>
						<input type="text" name="phone" required ng-model="ship.phone" ng-pattern="/[0-9]/" ng-minlength="10" ng-maxlength="10"/>
						<small class="error" ng-show="cForm.phone.$error.required && !cForm.phone.$pristine ">Phone No  required.</small>
						<small class="error" ng-show="cForm.phone.$error.minlength ||cForm.phone.$error.maxlength && !cForm.phone.$pristine && !cForm.phone.$error.required">Phone No should  have 10 digit</small>
					</td>
				</tr>
				<tr>
					<th>Pin*</th>
					<td>
						<input type="text"  id='pinTxt' name="pin" required ng-model="ship.pin" ng-pattern="/[0-9]/" ng-minlength="6" ng-maxlength="6"/>
						<small class="error" ng-show="(cForm.pin.$error.minlength || cForm.pin.$error.maxlength) && !cForm.pin.$pristine && !cForm.pin.$error.required">Pin No should have 6 digit.</small>
						<small class="error" ng-show="cForm.pin.$error.required  && !cForm.pin.$pristine">Pin required.</small>
					</td>
				</tr>
				<tr>
					<th>City*</th>
					<td>
						<input type="text" name="city" id="cityTxt" ng-keyup="getCity()" required ng-model="ship.city"/>
						<small class="error" ng-show="cForm.city.$error.required  && !cForm.city.$pristine">City required.</small>
					</td>
				</tr>
				<tr>
					<th>State*</th>
					<td>
						<input type="text" name="state" id='stateTxt' required  updateVal ng-model="ship.state"/>
						<small class="error" ng-show="cForm.state.$error.required  && !cForm.state.$pristine ">State required.</small>
					</td>
				</tr>
				<tr>
					<th>Address street</th>
					<td>
						<textarea name="address"   spellcheck="true" ng-model="ship.address"></textarea>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<button class="btn_shipinfo" ng-disable="cForm.$invalid"  onclick='submitForm(cForm.$valid)'>Continue</button>
					</td>
				</tr>
			</table>
			</form>
                </div>
                <div id="view3">
                    <div class="chosoe_pmt" style='display:block'>
                        <span class="payemnt_sec_head">Choose your mode of payment</span>
                        <p>
                            <input type="radio" id="cod" name="cod" selected><label for="cod">Cash-On-Delivery</label></p>
                        <p>
                            <input type="radio" id="nb" name="cod" disabled><label for="nb">Net Bankiing</label></p>
                        <p>
                            <input type="radio" id="debitcard" name="cod" disabled><label for="debitcard">Debit Cart & ATM</label></p>
                        <p>
                            <input type="radio" id="creditcard" name="cod" disabled><label for="creditcard">Credit Card</label></p>
                        <a class="btn_shipinfo" href='<%=ConfigUtil.hostURL() %>doPaymint'  title="Pay Now">Pay Now</a>
                    </div>
                    <div class="cnfrm_add" style='display:block'>
                            
                        <small style='float:right;text-align:right'><i>
                           {{ship.fName}} <br />
                          {{ship.address}},{{ship.city}},{{ship.state}} {{ship.pin}}  <br />
                          {{ship.email}}, {{ship.phone}}</i><br>
                          <a href='#' onclick='secondTab()'>edit</a>
                          </small>
                    </div>
                </div>
            </div>
        </div>
        <section>
<div class="order-summary">
    <div class="order-summary_head">Order Summary</div>
   <%if (!MFO.Commom.CommonUtil.DT.isEmptyOrNull(cartDT))
     { %>
    <table><thead class="header">
            <tr>
                <th>Product</th>
             	<th>Qty</th>
                <th>Delivery</th>
                <th class="price-col">Price</th>
            </tr></thead>
		<!--Loop content-->
		 <%for (int i = 0; i < cartDT.Rows.Count; i++)
        {    %>
        <%if (invDic.ContainsKey(cartDT.Rows[i]["SKU"] + "")){ %>
            <tr>
                <td colspan='3'> <span style="color:Red"><%=invDic[cartDT.Rows[i]["SKU"] + ""]%> </span></td>
                <td>
                    <a class='class="rem_sfl"'href='#' remove sku='<%=cartDT.Rows[i]["SKU"] %>'>Remove</a>
                </td>          
            </tr>
        <%} %>
		<tr class="order_cont">
                <td class="image_sec"><img alt="" src="<%=ConfigUtil.getServerPath() %><%=cartDT.Rows[i]["PathInternaldetailsSmallImage"] %>"><br>
                <p class=""><%=cartDT.Rows[i]["SKUBrand"]%></p>
                <p class="name"><%=cartDT.Rows[i]["SKUName"]%></p>
                <p class="name"><%=cartDT.Rows[i]["SKU"]%></p>
                <p class=""> 
                <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Size"] + ""))%>
                    <span> Size : <%=cartDT.Rows[i]["Size"]%></span>
                <%if (!MFO.Utils.StringUtil.isNullOrEmpty(cartDT.Rows[i]["Color"] + ""))%>
                    <span> Color :  <%=cartDT.Rows[i]["Color"]%>  </span></p>
                </td>
                <td class="">
                    <%if (invDic.ContainsKey(cartDT.Rows[i]["SKU"] + "")){ %>
                      <input type='text' maxlength='3' size='3' qtyUpdate='<%=cartDT.Rows[i]["SKU"]%>' value='<%=cartDT.Rows[i]["QTY"]%>' />
                    <%} else{ %>
                        <%=cartDT.Rows[i]["QTY"]%>
                     <%} %>
                 </td>
                <td class="">3-6<small class="">Business days</small></td>
                <td class=""><%=cartDT.Rows[i]["TOTAL"]%></td>
        </tr>
        <%} %>
        <!--End loop-->
		<tr  class="subtotal">
                <td colspan="3">Subtotal</td>
                 <td><%=subTotal%></td>
            </tr>
            <tr class="subtotal">
              <td colspan="3" class="">Cash on Delivery Charges</td>
                    <td class="">Available</td>
			</tr>
			<tr class="subtotal">
			        <td colspan="3" class="">Shipping Charges</td>
                    <td class="shipping">49</td>
			</tr>
            <tr class="total">
                <td colspan="3">Total</td>
                <td class="sel-total">Rs.<%=total%></td>
            </tr>
    </table>
    <%}else{ %>
        <p style="color:'red'">Your Cart is empty</p>        
    <%} %>
	</div>
</section>
</div>
<footer>
<div class="chkout_footer">
<div class="chkout_footsec">
<div><span><a href="#">About us</a></span>|<span><a href="#">Help</a></span>|<span><a href="#">Privacy</a></span>|<span><a href="#">Contact</a></span>|
<span><a href="#">Terms & Conditions</a></span></div>
<div><span>© 2014 SHOPPERSFLOOR.COM. ALL RIGHTS RESERVED.</span></div>
</div>
</div>
</footer>
<div class="checkout_background_overlay" style="display: none;"></div>
<section>
<div  id="checkout_overlay_form" style="display:none" class="loginregisterform" >
<a title="close" class="x" id="close" href="#" >x</a>		
<div class="loginform">
<div class="headtitle"><span>Login</span></div>
<form name='loginForm' class='css-form' >	
<p ng-show="login.errors.system" class="help-block" id='P2'> {{login.errors.system}}.</p>
<table>
<tr><th>Username:</th><td> <input type="email" name='logEmail' ng-keyup="validateEmail()" placeholder="e.g. example@example.com" required  ng-model="login.email" 
ng-change="removelogErro('email')">
<p ng-show="loginForm.logEmail.$invalid && !loginForm.logEmail.$pristine" class="help-block">Email is not valid.</p>
<p ng-show="login.errors.email" class="help-block" id='P4'> {{login.errors.email}}.</p>
<p ng-show="login.errors.info" style="color:Green" id='P3'> {{login.errors.info}}.</p>
</td></tr>
<tr><th>Password:</th><td><input type="Password" name='logPwd' placeholder="Password" required  ng-model="login.pwd" ng-minlength="8" ng-maxlength="20" 
ng-change="removelogErro('pwd')">
<p ng-show="loginForm.logPwd.$invalid && !loginForm.logPwd.$pristine" class="help-block">Password required length between 8 to 20</p>
<p ng-show="login.errors.pwd" class="help-block" id='errlogPwd'> {{login.errors.pwd}}.</p>
</td></tr>
<tr><th></th><td><p id="fgt_clk_hre" ><a class="fgtclk">Forgot password? click here</a></p></td></tr>

<tr><th></th><td> <input type="button" value="Login" ng-click="login()" ng-disabled="loginForm.$invalid"></td></tr>
</table>
</form>
</div>
<div class="midline"></div>
<div class="registerform">
<div class="headtitle"><span>Register</span></div>
<form name='regForm' class='css-form' ng-submit="register()">     
<p ng-show="user.errors.system" class="help-block" id='errSystem'>{{user.errors.system}}.</p>
<table>
<tr><th>Email ID:</th><td><input type="email" name='email'  ng-keyup="validateRegEmail()" placeholder="e.g. example@example.com" required  ng-model="user.email" ng-change="removeErro('email')">
<p ng-show="regForm.email.$invalid && !regForm.email.$pristine" class="help-block">Email is not valid.</p>
<p ng-show="user.errors.email" class="help-block" id='errUsrEmail'> {{user.errors.email}}.</p>
<p ng-show="user.errors.info" style="color:Green" id='P5'> {{user.errors.info}}.</p>
</td></tr>
<tr><th>Password:</th><td><input type="password" name='pwd' ng-change="removeErro('pwd')" placeholder="Password" required ng-model="user.pwd" ng-minlength="8" ng-maxlength="20">
<p ng-show="regForm.pwd.$invalid && !regForm.pwd.$pristine" class="help-block">Password required length between 8 to 20</p>
<p ng-show="user.errors.pwd" class="help-block" id='errPwd'> {{user.errors.pwd}}.</p>
</td></tr>
<tr><th>Mobile:</th><td><input type="text" name='mobile' ng-pattern="/[0-9]/" placeholder="Mobile" ng-model="user.mobile" ng-minlength="10" ng-maxlength="10">
<p ng-show="regForm.mobile.$invalid && !regForm.mobile.$pristine" class="help-block">Mobile no length should be 10 digit</p>
<p ng-show="user.errors.mobile" class="help-block" id='errMobile'> {{user.errors.mobile}}.</p></td></tr>
<tr><th>Gender:</th><td class="gender"><span>Male: </span><input type='radio' name='gender' value='Male' required ng-model="user.gender"/>
<span>Female:</span><input type='radio' name='gender' value='Female' required ng-model="user.gender"/>
<p ng-show="regForm.gender.$invalid && !regForm.gender.$pristine" class="help-block">Please select gender</p>
<p ng-show="user.errors.gender" class="help-block" id='P1'> {{user.errors.gender}}.</p>
</td></tr>
<tr><td colspan="2" class="offercheck"><input type="checkbox" name="checkbox" ng-model="user.newsLts">&nbsp;&nbsp;I want to receive news and special offers</td></tr>
<tr><th></th><td><input type="button" value="Signup" ng-click="register()" ng-disabled="regForm.$invalid"></td></tr>
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
<table><tr><td>Enter your email address</td></tr>
<tr><td><input type="email" name='logEmail' ng-keyup="validateEmail()" placeholder="e.g. example@example.com" required  ng-model="login.email" 
ng-change="removelogErro('email')">
<p ng-show="loginForm.logEmail.$invalid && !loginForm.logEmail.$pristine" class="help-block">Email is not valid.</p>
<p ng-show="login.errors.email" class="help-block" id='P7'> {{login.errors.email}}.</p>
<p ng-show="login.errors.info" style="color:Green" id='P8'> {{login.errors.info}}.</p></td></tr>
<tr><td><p>We'll send you a link to reset your password.</p></td></tr>
<tr><td><input type="button" value="Send" class="button" ng-click="login()" ng-disabled="loginForm.$invalid"></td></tr>
<tr><td><p><a id="logsign">Signup / Login</a></p> </td></tr></table>
</form>
</div>
</div>
</section>
<%}else{ %>
   <span style='color:red'> Your shopping cart is Empty, <a href=''>Click here to Shopping continue.</a></span>
<%} %>
</body>
</html>
