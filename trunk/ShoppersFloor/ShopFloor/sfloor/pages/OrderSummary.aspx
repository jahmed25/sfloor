<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="sfloor_pages_OrderSummary" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <title>Thank you</title>
      <link rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/thankyou.css">
   </head>
   <body>
      <div id="thankyoupage">
         <div class="box">
            <div class="confirm">
               <a href='<%=ConfigUtil.hostURL() %>Home' ><img src="<%=ConfigUtil.StaticPath() %>new-images/newlogo.png" width="250px" height="50px" /></a>
               <h1>Thank for your order (<%=orderDT.Rows[0]["ORDER_NO"] %>)</h1>
               <p>We're processing it now. You will recieve an email confirmation shortly.</p>
               <p>Please <a href="#" onClick="window.print()">print this page</a> or write down your Order Number(See below)</p>
               <b>For any assistance call <span>123456</span> </b>
            </div>
            <div class="address">
               <p>Shipping Address</p>
               <table border="0">
                  <tr>
                     <td>Email Id :</td>
                     <td><%=shippingDT.Rows[0]["EMAIL"]%></td>
                  </tr>
                  <tr>
                     <td>Name :</td>
                     <td><%=shippingDT.Rows[0]["NAME"]%></td>
                  </tr>
                  <tr>
                     <td>Phone :</td>
                     <td><%=shippingDT.Rows[0]["MOBILE"]%></td>
                  </tr>
                  <tr>
                     <td>Address :</td>
                     <td><%=shippingDT.Rows[0]["ADDRESS"]%></td>
                  </tr>
                  <tr>
                     <td>City :</td>
                     <td><%=shippingDT.Rows[0]["CITY"]%></td>
                  </tr>
                  <tr>
                     <td>State :</td>
                     <td><%=shippingDT.Rows[0]["STATE"]%></td>
                  </tr>
                  <tr>
                     <td>Pin:</td>
                     <td><%=shippingDT.Rows[0]["PIN"]%></td>
                  </tr>
               </table>
            </div>
         </div>
         <div class="orderdetails">
            <table border="1" bordercolor="#ABABAB">
               <thead class="header">
                  <tr>
                     <th>Product</th>
                     <th>Brand</th>
                     <th class="fourhun">Name</th>
                     <th>Qty</th>
                     <th>Color</th>
                     <th>Size</th>
                     <th class="">Price</th>
                  </tr>
               </thead>
               <!--Loop content-->
               <%foreach(System.Data.DataRow row in orderDetailsDT.Rows) {%>
               <tr class="order_cont">
                  <td class="hund image_sec"><img alt="" height="50px" width="30px" src="<%=ConfigUtil.getServerPath()%><%=row["PathInternaldetailsSmallImage"]%>"></td>
                  <td class="twohund"><%=row["SKUBrand"]%></td>
                  <td class="fourhun"><%=row["SKUName"]%></td>
                  <td class="fifty"><%=row["QTY"]%></td>
                  <td class="fifty"><%=row["Color"]%></td>
                  <td class="fifty"><%=row["Size"]%></td>
                  <td class="right hund"><%=row["TOTAL"]%></td>
               </tr>
               <%} %>
               <!--End loop-->
               <tr  class="thankyou_subtotal right">
                  <td colspan="6">Subtotal</td>
                  <td>RS.<%=orderDT.Rows[0]["AMOUNT"]%></td>
               </tr>
               <tr class="thankyou_subtotal right">
                  <td colspan="6" class="">Shipping Charges</td>
                  <td class="">RS.<%=orderDT.Rows[0]["SHIPPING_CHARGE"]%></td>
               </tr>
               <tr class="thankyou_subtotal right">
                  <td colspan="6" class="">VAT</td>
                  <td class="shipping">RS.<%=orderDT.Rows[0]["VAT"]%></td>
               </tr>
               <tr class="thankyou_subtotal right">
                  <td colspan="6">Total</td>
                  <td class="sel-total">Rs.<%=orderDT.Rows[0]["TOTAL_AMOUNT"]%></td>
               </tr>
            </table>
         </div>
      </div>
      <footer>
         <div class="chkout_footer">
            <div class="chkout_footsec">
               <div><span><a href="#">About us</a></span>|<span><a href="#">Help</a></span>|<span><a href="#">Privacy</a></span>|<span><a href="#">Contact</a></span>|
                  <span><a href="#">Terms & Conditions</a></span>
               </div>
               <div><span>© 2014 SHOPPERSFLOOR.COM. ALL RIGHTS RESERVED.</span></div>
            </div>
         </div>
      </footer>
   </body>
</html>