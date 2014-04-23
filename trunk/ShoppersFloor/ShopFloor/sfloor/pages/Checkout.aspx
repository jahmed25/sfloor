<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="sfloor_pages_Checkout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Checkout</title>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/lib/angular.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/menu.js'></script>
    <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
    <script src="<%=ConfigUtil.StaticPath() %>new-js/tabcontent.js" type="text/javascript"></script>
    <script src="<%=ConfigUtil.StaticPath() %>new-js/common1.js" type="text/javascript"></script>
    <link href="<%=ConfigUtil.StaticPath() %>new-css/checkoutpage_n.css" rel="stylesheet" type="text/css" />
    <link href='<%=ConfigUtil.StaticPath() %>new-css/login-forms.css' rel="stylesheet" type="text/css" />
    
</head>
<body>
<style>
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
                    <table>
                        <tr>
                            <th>
                                Email Address:
                            </th>
                            <td>
                                <input type="email" name="txt_email">
                            </td>
                        </tr>
                        <tr>
                            <th>
                            </th>
                            <td>
                                <p>
                                    Your order details will be sent to this email address.</p>
                            </td>
                        </tr>
                        <tr>
                            <th>
                            </th>
                            <td>
                                <p>
                                    <input type="radio" name="chkout_radio">&nbsp;&nbsp;Continue without password
                                    <br>
                                    <i>(You do not need a password)</i></p>
                            </td>
                        </tr>
                        <tr>
                            <th>
                            </th>
                            <td>
                                 <p><input type="radio" id="checkoutlogin" name="chkout_radio">&nbsp;&nbsp;I have a Shoppersfloor account and password<br>
                                    <i>Sign in to your account and checkout faster</i></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input class="btn_shipinfo" type="button" value="Submit">
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="view2">
                    <h1>
                        Shipping Information</h1>
                    <table>
                        <tr>
                            <th>
                                First Name
                            </th>
                            <td>
                                <input type="text" name="fname">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Last Name
                            </th>
                            <td>
                                <input type="text" name="lname">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Email Id
                            </th>
                            <td>
                                <input type="email" name="email">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Phone No.
                            </th>
                            <td>
                                <input type="text" name="phno">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Address
                            </th>
                            <td>
                                <textarea name="address"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                City
                            </th>
                            <td>
                                <input type="text" name="city">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                State
                            </th>
                            <td>
                                <input type="text" name="state">
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Pin:
                            </th>
                            <td>
                                <input type="text" name="Pin">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <input class="btn_shipinfo" type="button" value="Submit">
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="view3">
                    <div class="cnfrm_add">
                        <span class="payemnt_sec_head">Your Shipping Address</span>
                        <ul>
                            <li>Kunal</li>
                            <li>Sharma</li>
                            <li>kk@gmail.com</li>
                            <li>987171717</li>
                            <li>Khandsa, GGN</li>
                            <li>Gurgaon</li>
                            <li>haryana</li>
                            <li>1111111</li>
                            <input type="button" class="edit_btn" value="Edit" name="paynow">
                        </ul>
                    </div>
                    <div class="chosoe_pmt">
                        <span class="payemnt_sec_head">Choose your mode of payment</span>
                        <p>
                            <input type="radio" id="cod" name="cod"><label for="cod">Cash-On-Delivery</label></p>
                        <p>
                            <input type="radio" id="nb" name="cod"><label for="nb">Net Bankiing</label></p>
                        <p>
                            <input type="radio" id="debitcard" name="cod"><label for="debitcard">Debit Cart & ATM</label></p>
                        <p>
                            <input type="radio" id="creditcard" name="cod"><label for="creditcard">Credit Card</label></p>
                        <input type="button" class="btn_shipinfo" value="Pay Now" name="paynow">
                    </div>
                </div>
            </div>
        </div>
        <section>

<div class="order-summary">
    <div class="order-summary_head">Order Summary</div>
    <table><thead class="header">
            <tr>
                <th>Product</th>
             	<th>Qty</th>
                <th>Delivery</th>
                <th class="price-col">Price</th>
            </tr></thead>
		<!--Loop content-->
		<tr class="order_cont">
                <td class="image_sec"><img alt="" src="<%=ConfigUtil.StaticPath() %>new-images/thumbs/image1.jpg"><br>
                            <p class="">Brand name</p>
                            <p class="name">Product Name</p>
                            <p class=""> <span> Size : L  </span><span> color : Red  </span></p></td>
                <td class="">2</td>
                <td class="">3-6<small class="">Business days</small></td>
                <td class="">Rs.2798</td>
        </tr>
        <!--End loop-->
		<tr  class="subtotal">
                <td colspan="3">Subtotal</td>
                 <td>Rs.2798</td>
            </tr>
            <tr class="subtotal">
              <td colspan="3" class="">Cash on Delivery Charges</td>
                    <td class="">49</td>
			</tr>
			<tr class="subtotal">
			        <td colspan="3" class="">Shipping Charges</td>
                    <td class="shipping">Free</td>
			</tr>
            <tr class="total">
                <td colspan="3">Total</td>
                <td class="sel-total">Rs.2798</td>
            </tr>
    </table>
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
<div  id="checkout_overlay_form" style="display:none" class="loginregisterform" ng-app='registration' ng-controller='regCtrl'>
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
</body>
</html>
