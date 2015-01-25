<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="sfloor_pages_MyAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <%=Head %>
      <!-- start end-->
      <link type="text/css" rel="stylesheet" href="<%=ConfigUtil.StaticPath() %>new-css/style.css"/>
        <script type="text/javascript">
            jQuery(document).ready(function (e) {
                jQuery('.item').click(function (e) {
                    if (jQuery(this).next('.item-data').css('display') != 'block') {
                        jQuery('.active').slideUp('fast').removeClass('active');
                        jQuery(this).next('.item-data').addClass('active').slideDown('slow');
                    } else {
                        jQuery('.active').slideUp('fast').removeClass('active');
                    }
                });
                jQuery("#SaveProfileBtn").live("click", function () { 
                    
                });
            });
        </script>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                
                jQuery("#favListLink").live("click", function () {
                    window.location=path + "fav-items";
                });
                jQuery("#cartLink").live("click", function () {
                    window.location = path + "Add-To-Cart";
                });
                jQuery('#edit_profile').on('click', function () {
                    jQuery('#personal_details').hide();
                    jQuery('#edit_personal_details').show();
                });
                jQuery('#btn_personal_details').on('click', function () {
                    jQuery('#edit_personal_details').hide();
                    jQuery('#personal_details').show();
                });
                jQuery('#edit_address').on('click', function () {
                    jQuery('#address_detail').hide();
                    jQuery('#edit_address_detail').show();
                });
                jQuery('#btn_add_cancel').on('click', function () {
                    jQuery('#edit_address_detail').hide();
                    jQuery('#address_detail').show();
                });
            });
        </script>
        <script type="text/javascript">            jQuery(document).ready(function () { initTabs(); }); function initTabs() {
                jQuery('#accounttabMenu a').bind('click', function (e) { e.preventDefault(); var thref = jQuery(this).attr("href").replace(/#/, ''); jQuery('#accounttabMenu a').removeClass('actives'); jQuery(this).addClass('actives'); jQuery('#accounttabContent div.content').removeClass('actives'); jQuery('#' + thref).addClass('actives'); }); 
        
            var tab = '<%=Request.Params["tab"] %>';
            if (tab.trim().length > 0) {
                jQuery("#accounttabContent div").removeClass("actives");
                jQuery("a").removeClass('actives');
                switch (tab) {
                    case "profile":
                        jQuery("a[href^='mydetails']").addClass('actives');
                        jQuery("#mydetails").addClass('actives');
                        break;
                    case "order-details":
                        jQuery("a[href^='order_details']").addClass('actives');
                        jQuery("#order_details").addClass('actives');
                        break;
                    case "address-details":
                        jQuery("a[href^='adddetails']").addClass('actives');
                        jQuery("#adddetails").addClass('actives');
                        break;
                    case "change-password":
                        jQuery("a[href^='changepassword']").addClass('actives');
                        jQuery("#changepassword").addClass('actives');
                        break;
                    case "credit":
                        jQuery("a[href^='creditbalance']").addClass('actives');
                        jQuery("#creditbalance").addClass('actives');
                        break;
                    default:
                        jQuery("a[href^='mydetails']").addClass('actives');
                        jQuery("#mydetails").addClass('actives');
                        break;
                }
            }
        
        } </script>
   </head>
   <body class="cms-index-index cms-home">
      <div>
         <div class="page">
            <%=Header %>
            <div style="margin:0 auto;width:1170px">

           <div class="right_inner_categorydetailssortby">
                  <div class="bradcrumbs-contain">
                     <div class="breadcrumbs" id="crumbs">
                        <ul>
                           <li id="crumb1"><a  href='<%=ConfigUtil.hostURL() %>Home'> Home </a></li>
                           <li id="crumb2"><span></span><a id='catNav' href=''>My Account</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            <!-- End -->
              <div  id="account_tabs" style="clear:both">
	        <div id="accounttabMenu">
		        <ul class="menu">
			        <li><a href="mydetails" class="actives"><span>My Profile</span></a></li>
			        <li><a href="order_details"><span>Orders Details</span></a></li>
			        <li><a href="adddetails"><span>Address Details</span></a></li>
                    <li><a href="changepassword"><span>Change Password</span></a></li>
			        <li><a href="creditbalance"><span>Credit</span></a></li>
			        <li><a href="<%=ConfigUtil.StaticPath() %>fav-items" id='favListLink' ><span>My Wish-List</span></a></li>
			        <li><a href="<%=ConfigUtil.StaticPath() %>fav-items" id='cartLink' ><span>My Cart</span></a></li>

		        </ul>
	        </div>
	        <div id="accounttabContent">
		        <div id="mydetails" class="content actives">
			        <div class="mydetails" >
				        <h3>Profile Details</h3>
				        <div class="mydetailsleft" style="width:100%">
                            <table id="personal_details" style="width:100%">
					        <tr>
						        <td>
							         Name
						        </td>
						        <td>
                                    <%if (addressDT.Rows.Count > 0){%>
							            <%=addressDT.Rows[0]["NAME"]%>
                                    <%}%>
						        </td>
					        </tr>
					        <tr>
						        <td>
							        Email Id
						        </td>
						        <td>
							        <%=userDT.Rows[0]["EMAIL"] %>
						        </td>
					        </tr>
					        <tr>
						        <td>
							        Gender
						        </td>
						        <td>
   							        <%=userDT.Rows[0]["GENDER"] %>

						        </td>
					        </tr>
					        <tr>
						        <td>
							        Mobile No.
						        </td>
						        <td>
							         <%=userDT.Rows[0]["MOBILE"]%>
						        </td>
					        </tr>
					        </table>
                    
            		        <table style="display:none" id="edit_personal_details" style="width:100%">
					        <tr>
						        <td>
							         Name
						        </td>
						        <td>
  									<%if (addressDT.Rows.Count > 0){%>
											<input type="text" value='<%=addressDT.Rows[0]["NAME"]%>' />
									<%}else{%>
                                        <input type="text" />
                                     <%} %>
						        </td>
					        </tr>
					        <tr>
						        <td>
							        Email Id
						        </td>
						        <td>
							        <input type="email" value='<%=userDT.Rows[0]["EMAIL"] %>' />
						        </td>
					        </tr>
					        <tr>
						        <td>
							        Gender
						        </td>
						        <td>
                                    <%if ("Male".Equals(userDT.Rows[0]["GENDER"] + "")){%>
								        Male&nbsp;&nbsp;<input type="radio" name='gender' value="Male" checked="checked"/>&nbsp;&nbsp;|&nbsp;&nbsp;Female&nbsp;&nbsp;<input type="radio" name='gender' value="Female"/>
									<%}else{%>
       							       Male&nbsp;&nbsp;<input type="radio" name='gender' value="Male"/>&nbsp;&nbsp;|&nbsp;&nbsp;Female&nbsp;&nbsp;<input type="radio" checked="checked" value="Female" name='gender'/>
                                     <%} %>
						        </td>
					        </tr>
					        <tr>
						        <td>
							        Mobile No.
						        </td>
						        <td>
							        <input type="text" value=' <%=userDT.Rows[0]["MOBILE"]%>' />
						        </td>
					        </tr>
					        <tr>
						        <td colspan="2" align="center">
							        <input class="btn_save" type="button" value="Save" id="SaveProfileBtn">
							        <input class="btn_cancel" id="btn_personal_details" type="button" value="Cancel">
						        </td>
					        </tr>
					        </table>
            
				        </div>
				       <%-- <div class="mydetailsright">
					        <div style="" class="userimage"><img src="<%=ConfigUtil.StaticPath() %>new-images/blank-user.png"/></div>
                            <div class="uploadimage file_browse_wrapper">
						        <input type='file' class='file_browse'></div>
                                <input type="button" class="btn_save" value="Save Image">
				        </div>--%>
                                               <span class="edit"><a href="#" id="edit_profile">Edit Profile</a></span>
			    
			        </div>
		        </div>
		        <div id="order_details" class="content">
			        <div class="mydetails">
				        <h3>Orders Details</h3>
				        <div class='container'>
					        <div class='item'>
						        <span>Order No : #301273</span>|<span>Order Date : 08/03/2014</span>
					        </div>
					        <div class='item-data'>
						        <div class="status">
							        <p>
								        Payment Information : CashOnDelivery
							        </p>
							        <p>
								        Order Status : PendingConfirmation
							        </p>
							        <p>
								        Estimated delivery : 2 to 5 working days
							        </p>
						        </div>
						        <div class="cancel_order">
							        <input type="button" value="Cancel Order">
						        </div>
						        <table>
						        <tr>
							        <td>
								        Item
							        </td>
							        <td>
								        Description
							        </td>
							        <td>
								        Unit Price(Rs.)
							        </td>
							        <td>
								        Quantity
							        </td>
							        <td>
								        Sub Order No.
							        </td>
							        <td>
								        Sub Total
							        </td>
						        </tr>
						        <tr>
							        <td>
								        <img src="image1.jpg" </td>
								        <td>
									        Name
								        </td>
								        <td>
									        200
								        </td>
								        <td>
									        1
								        </td>
								        <td>
									        8736778
								        </td>
								        <td>
									        200
								        </td>
							        </tr>
							        <tr>
								        <td colspan="5" class="right">
									        Cash on delivery charges
								        </td>
								        <td>
									        200.00
								        </td>
							        </tr>
							        <tr>
								        <td colspan="5" class="right">
									        Shiping charges
								        </td>
								        <td>
									        49.00
								        </td>
							        </tr>
							        <tr>
								        <td colspan="5" class="right">
									        Total
								        </td>
								        <td>
									        249.00
								        </td>
							        </tr>
							        </table>
						        </div>
					        </div>
				        </div>
			        </div>
			    <div id="adddetails" class="content">
				    <div class="mydetails">
					    <h3>Address Details</h3>
					    <div class="myaddress">
						    <table id="address_detail">
						    <tr>
							    <td>
								    Name*
							    </td>
							    <td>
								    <%if (addressDT.Rows.Count > 0){%>
											<%=addressDT.Rows[0]["NAME"]%>
										<%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    Phone*
							    </td>
							    <td>
								    <%if (addressDT.Rows.Count > 0){%>
											<%=addressDT.Rows[0]["MOBILE"]%>
										<%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    Address*
							    </td>
							    <td>
								    
								    <%if (addressDT.Rows.Count > 0){%>
											<%=addressDT.Rows[0]["ADDRESS"]%>
										<%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    Postcode*
							    </td>
							    <td>
								    
								    <%if (addressDT.Rows.Count > 0){%>
											<%=addressDT.Rows[0]["PIN"]%>
										<%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    City*
							    </td>
							    <td>
								    
								    <%if (addressDT.Rows.Count > 0){%>
											<%=addressDT.Rows[0]["CITY"]%>
										<%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    State/Region*
							    </td>
							    <td>
								    
								    <%if (addressDT.Rows.Count > 0){%>
											<%=addressDT.Rows[0]["STATE"]%>/
										<%}%>
							    </td>
						    </tr>
						    </table>
						    <table id="edit_address_detail" style="display:none">
						    <tr>
							    <td>
								     Name*
							    </td>
							    <td>
                                <%if (addressDT.Rows.Count > 0){%>
								    <input type="text" id='addr-name' required value='<%=addressDT.Rows[0]["NAME"]%>'/>
								<%}else{%>
								    <input type="text" id='addr-name' required/>
                                 <%} %>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    Phone*
							    </td>
							    <td>
								 <%if (addressDT.Rows.Count > 0){%>
								    <input type="text" required id='addr-mobile'value='<%=addressDT.Rows[0]["MOBILE"]%>'/>
								<%}else{%>
								    <input type="text" required id='addr-mobile'/>
                                 <%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    Address
							    </td>
							    <td>
								    <%if (addressDT.Rows.Count > 0){%>
								        <input type="text" required id='addr-addr'value='<%=addressDT.Rows[0]["ADDRESS"]%>'/>
								    <%}else{%>
								        <input type="text" required id='addr-addr' />
                                     <%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    Postcode*
							    </td>
							    <td>
								    <%if (addressDT.Rows.Count > 0){%>
								        <input type="text" required id='addr-pin'value='<%=addressDT.Rows[0]["PIN"]%>'/>
								    <%}else{%>
								        <input type="text" required id='addr-pin' />
                                     <%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    City*
							    </td>
							    <td>
								     <%if (addressDT.Rows.Count > 0){%>
								        <input type="text" required id='addr-city'value='<%=addressDT.Rows[0]["CITY"]%>'/>
								    <%}else{%>
								        <input type="text" required id='addr-city' />
                                     <%}%>
							    </td>
						    </tr>
						    <tr>
							    <td>
								    State/Region*
							    </td>
							    <td>
								    <%if (addressDT.Rows.Count > 0){%>
								        <input type="text" required id='addr-state'value='<%=addressDT.Rows[0]["STATE"]%>'/>
								    <%}else{%>
								        <input type="text" required id='addr-state' />
                                     <%}%>
							    </td>
						    </tr>
						    <tr>
							    <td colspan="2" align="center">
								    <input class="btn_save" id='addressbtn' type="button" value="Save"/>
								    <input class="btn_cancel" id="btn_add_cancel" type="button" value="Cancel"/>
							    </td>
						    </tr>
						    </table>
					    </div>
					    <div class="myaddright">
						    <p>
							    <a href="#" id="edit_address">Edit Address</a>
						    </p>
					    </div>
				    </div>
			    </div>
                <div id="changepassword" class="content">
				    <div class="mydetails">
					    <h3>Change Password</h3>
					    <div class="myaddress">
					    <table>
					    <tr>
						    <td>
							    Password
						    </td>
						    <td>
							    <input type="text" placeholder="Enter new password"/>
						    </td>
					    </tr>
					    <tr>
						    <td>
							    Retype
						    </td>
						    <td>
							    <input type="text" placeholder="Retype"/>
						    </td>
					    </tr>
					    <tr>
                        <td></td>
						    <td>
							    <input class="btn_save" type="button" value="Save">
						    </td>
					    </tr>
					    </table>
			
                        </div>
				    </div>
			    </div>
                <div id="creditbalance" class="content">
				    <div class="mydetails">
					    <h3>Credit</h3>
					    <div class="myaddress">
					    <p>You account have <i>0.00</i> Credit balance</p>
                        </div>
				    </div>
			    </div>
            </div>
            </div>   
            <div style="height:30px;clear:both"></div>
            <%=Footer %>
         </div>
      </div>
      <div id="ajaxconfig_info" style="display: none">
         <button name="white" value="0.7">
         </button>
         <input id="enable_module" value="1" type="hidden"/>
      </div>
      </div>
   </body>
</html>
