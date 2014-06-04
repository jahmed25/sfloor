<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkoutPage3.aspx.cs" Inherits="sfloor_pages_checkoutPage3" %>
<%@ Register src="~/sfloor/pages/CheckoutHeader.ascx" tagname="checkoutHeader" tagprefix="ch" %>
<%@ Register src="~/sfloor/pages/CheckoutOrderPanal.ascx" tagname="checkoutOP" tagprefix="cp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
      <title>Check-out Step two</title>
   
   </head>
   <body>
      <ch:checkoutHeader runat="server" ID="chHeader"/>
      <script type="text/javascript">
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

      </script>
      <%if(!MFO.Commom.CommonUtil.DT.isEmptyOrNull(cartDT)){ %>
      <div class="ckeckoutmain_sec">
         <div class="ckeckoutmain">
            <ul class="tabs">
               <li><a href="<%=ConfigUtil.hostURL() %>checkout-step-1">Email Or Login <span>1</span></a></li>
               <li><a href="<%=ConfigUtil.hostURL() %>checkout-step-2" >Shipping <span>2</span></a></li>
               <li class='selected'><a >Payment <span>3</span></a></li>
            </ul>
            <div class="tabcontents">
              
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
                          <%=shipDT.Rows[0]["NAME"] %> <br />
                          <%=shipDT.Rows[0]["ADDRESS"] %>,<%=shipDT.Rows[0]["CITY"] %>,<%=shipDT.Rows[0]["STATE"] %> <%=shipDT.Rows[0]["PIN"] %>  <br />
                         <%=shipDT.Rows[0]["EMAIL"] %>, <%=shipDT.Rows[0]["MOBILE"] %></i><br>
                          <a href='<%=ConfigUtil.hostURL() %>checkout-step-2'>Edit Shipping Details</a>
                          </small>
                    </div>
               
            </div>
           
         </div>
         <section>
            <cp:checkoutOP runat="server" ID="checkOrderPanal"/>
           </section>
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
      <%}else{ %>
      <span style='color:red'> Your shopping cart is Empty, <a href=''>Click here to Shopping continue.</a></span>
      <%} %>
   </body>
</html>
