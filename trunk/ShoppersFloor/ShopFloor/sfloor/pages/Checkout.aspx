<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="sfloor_pages_Checkout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Tabbed Content</title>
    <script src="<%=ConfigUtil.StaticPath() %>new-js/tabcontent.js" type="text/javascript"></script>
    <link href="<%=ConfigUtil.StaticPath() %>new-css/checkoutpage_n.css" rel="stylesheet"
        type="text/css" />
</head>
<body>
    <div class="ckeckoutmain_sec">
        <header><div id="header">
        <div class="logo"><a href="<%=ConfigUtil.hostURL() %>Home"><img src="<%=ConfigUtil.StaticPath() %>new-images/newlogo.png" width="220px" height="50px"></a></diV>


<div>
<a href='<%=ConfigUtil.hostURL() %>Home' class="btn_shipinfo bck_to_shp">Back to shop</a>
</div>

</div> </header>
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
                                <p>
                                    <input type="radio">&nbsp;&nbsp;I have a Shoppersfloor account and password<br>
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
                <td class="image_sec"><img alt="" src="images/thumbs/image3.jpg"><br>
                            <p class="">Brand name</p>
                            <p class="name">Product Name</p>
                            <p class=""> <span> Size : L  </span><span> color : Red  </span></p>
                </td>
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
</body>
</html>
