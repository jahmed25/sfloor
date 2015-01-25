<%@ Page Language="C#" CodeFile="Categories.aspx.cs" Inherits="Categories" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <%=Head %>
      <link href='<%=ConfigUtil.StaticPath() %>new-css/styles-filter.css' rel="stylesheet" />
      <link href='<%=ConfigUtil.StaticPath() %>new-css/internalpage.css' rel="stylesheet" type="text/css" />
      <script src='<%=ConfigUtil.StaticPath() %>new-js/main.js' type="text/javascript"></script>
      <script src='<%=ConfigUtil.StaticPath() %>new-js/fixsidemenu.js' type="text/javascript"></script>
      <script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/category.js'></script>
      <style>
         div#spinner
         {
         display: none;
         width: 350px;
         height: 100px;
         position: fixed;
         top: 50%;
         left: 50%;
         text-align: center;
         margin-left: -50px;
         margin-top: -100px;
         z-index:999999992;
         overflow: auto;
         }
         #overlay_form_quick
         {
         background: WHITE;
         z-index: 100000;
         border-radius: 10px;
         }
         .background_overlay_quick
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
         #pcd_overlay_form_quick
         {
         background: WHITE;
         z-index: 100000;
         border-radius: 10px;
         }
         .pcd_background_overlay_quick
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
      </style>
      <script type="text/javascript">
         function removeFromCompareList(sku){
               jQuery("#compareProductList").find("li[sku='"+sku+"']").remove();
               jQuery("[compare][sku='"+sku+"']").removeAttr("checked");
               if(jQuery("#compare_list").is(":visible")&&jQuery("#compareProductList li").size()==0){
                   jQuery("#compare_list").hide();
         
               }
         }
         jQuery(document).ready(function () {
         
         jQuery("#showProd").live("click",function(){
           jQuery("#relatedProd").slideDown(2000); 
         });
             jQuery(window).scroll(function () {
                 if ((jQuery(document).height() - jQuery(window).scrollTop()) <= 500) {
                     jQuery("#compare_list").css({
                         position: 'fixed',
                         width:'59.25%',
                         top: 'auto',
                         bottom: '80%'
                         
                     });
                 } else if (jQuery(window).scrollTop() >= 30) {
                     jQuery("#compare_list").css({
                         position: 'fixed',
                         width: '59.25%',
                         top: '7.4%',
                         bottom: 'auto'
                     });
                 } else {
                     jQuery("#compare_list").css({
                         position: 'relative',
                         top: '-20px',
                         bottom: 'auto',
                         width: '97%',
         
                     });
                 }
             });
             
             jQuery("#compareButton").live("click",function(){
                   var str="";
                   jQuery("#compareProductList li").each(function(i){
                       str+="sku"+i+"="+jQuery(this).attr("sku")+"&"
                   });
                   window.open(path+"Compare-Products?"+str);
             })
             jQuery("#close-compare").live("click",function(){
               jQuery("#right_inner_contents input[compare]").removeAttr("checked");
               jQuery("#compareProductList").html("");
               jQuery("#compare_list").hide();
             });
             jQuery("[compare]").live("click",function(){
                var sku=jQuery(this).attr("sku")
                   if(jQuery(this).is(":checked")){
                      if(jQuery("#compareProductList li").size()==4){
                            alert("You can compare upto four items only.");
                            jQuery(this).removeAttr("checked");
                            return;
                       }
                      var src=jQuery(".image_slider[sku='"+sku+"']").find(".disp > img").attr("src");
                      var name=jQuery(this).parents(".right_inner_categorydetailsimagesdetails").find(".right_inner_categorydetailsimagesname > a").text();
                      var brand=jQuery(this).parents(".right_inner_categorydetailsimagesdetails").find(".categorydetails_inner_brandname > a").text();
                       var html="<li sku='"+sku+"'>"
                           +"<div style='height:80px;'>"
                               +"<img width='60' height='80' style='float:left' src='"+src+"'/>"
                               +"<span style='float:left; width:122px; overflow:hide;'>"+name+"</span>"
                               +"<span style='float:left; width:122px; overflow:hide;'>"+brand+"</span>"
                              +"<a  class='close' href='javascript:void(0);' title='Close' sku='"+sku+"' removeCompare>X</a>"		 	
                           +"</div>"
                       +"</li>";        
                       jQuery("#compareProductList").append(html);
                       if(!jQuery("#compare_list").is(":visible")){
                           jQuery("#compare_list").slideDown();
                       }
                   }else{
                        removeFromCompareList(sku);
                   }
         
             });
             jQuery("[removecompare]").live("click",function(){
                   removeFromCompareList(jQuery(this).attr("sku"));
             });
             if (jQuery('#crumb4').text().trim().length == 0) {
         
                 jQuery('#crumb4').css('display', 'none');
             }
             else {
                 jQuery('#crumb4').css('display', 'block');
             }
         });
         jQuery(document).ready(function () {
    jQuery(".filter-body > .head-title").click(function () {
      if(jQuery(this).hasClass('active'))
         {
          jQuery(this).next(".filter-body > div.inner-body").slideToggle("");
           jQuery(this).removeClass('active');
         }
         else
         {
         jQuery(this).next(".filter-body > div.inner-body").slideToggle("");
         
       jQuery(this).toggleClass("active");
       jQuery(this).addClass("active");
    }
   	});
});
      </script>
    <script type="text/javascript" id="sourcecode">
        $(function () {
            $('.scroll-pane').jScrollPane();
        });
        </script>
</head>
<body>
    <div id="spinner">
        <img src="<%=ConfigUtil.StaticPath()%>new-images/loader.gif" alt="Loading..." style='height: 35; width: 170; z-index: 999999' />
    </div>
        <%=Header %>
            <div class="container">
             
                <%--breadcrumb--%>
                
                <div class="right_inner_categorydetailssortby">
                <div class="bradcrumbs-contain">
                    <div class="breadcrumbs" id="crumbs">
                        <ul>
                            <li id="crumb1"><a href='<%=ConfigUtil.hostURL() %>Home'>Home </a></li>
                            <li id="crumb2"><span></span><a id='catNav' href='<%=catUrl%>'>
                                <%=catName%>
                            </a>
                            </li>
                            <li id="crumb3"><span></span><a id='subCatNav' href='<%=subCatUrl%>'>
                                <%=subCatName%>
                            </a>
                            </li>
                            <li id="crumb4"><span></span><a id='pTypeNav' href='<%=pTypeUrl%>'>
                                <%=pTypeName%></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="dropdown">
                    <select class="dropdown-select" id="price_select">
                        <option value="0">Sort by price : Select</option>
                        <option value="1">Sort by price : Low to High</option>
                        <option value="2">Sort by price : High to Low</option>
                    </select>
                </div>
            </div>
                <div class="women_main">
            <!--End here Filter category-->
            <div id="filter_float_threshold_start">
            </div>
                   <div class="col-md-3">
                        <div class="w_sidebar" id="floating_filter" style="position: fixed;">
                            <section class="sky-form">
                                <h4  id="MainCatHeader" runat="server">Accessories<a href="#"></a></h4>
                                    
                                <div class="row1 scroll-pane">
                                    <input type="text" id="catsubCatTxt" placeholder='Type Categories for Filter.' class="txt_filter" />
                                    <div class="col col-4">
                                       <ul>
                         <%for (int i = 0; i < catNameDT.Rows.Count;i++ ) {%>
                                <li><a class="lnkbtn_category" href='<%=catNameDT.Rows[i]["url"]%>' data="<%=catNameDT.Rows[i]["SKUProductType"]%>">
                                <%=catNameDT.Rows[i]["SKUProductType"]%></a> 
                                </li>
                           <%} %>
                           <asp:Label ID="lblmessagecategory" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                        </ul>
                        </div> 
                     </div>
                            </section>
                            <section class="sky-form">
                                <h4>brand</h4>
                                <div class="row1 scroll-pane">
                                    <div class="col col-4">
                           <input type="text"  id="brandTxt"  placeholder='Type Brands for Filter' class="txt_filter"/>
                       <div class="scroll">
                         <%for (int i = 0; i < brandDT.Rows.Count;i++ ) {%>
                         <label class="checkbox" for='<%=brandDT.Rows[i]["SKUBrand"]%>-cb' brands='<%=brandDT.Rows[i]["SKUBrand"]%>'><%=brandDT.Rows[i]["SKUBrand"]%>
                         <input type="checkbox" name="checkbox" id="<%=brandDT.Rows[i]["SKUBrand"]%>-cb" brands='<%=brandDT.Rows[i]["SKUBrand"]%>' ><i></i><%# Eval("SKUBrand") %></label>
                          <%} %>
                           <asp:Label ID="lblmessagebrandname" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                                
                                    </div>
                                </div>
                            </section>
                            <section class="sky-form">
                                <h4>Price</h4>
                                <div class="row1 scroll-pane">
                                    <div class="col col-4">
                                        <div class="priceinput">
                                            <input type="number" name="min" id='minTxt' min="0" /><input id='maxTxt' type="number"
                                                min="0" name="max" />
                                            <input type="button" value="GO" id='priceRangeBtn' /><br>
                                            <p id='errRange' style='display: none; color: red'>
                                                Please enter the min and max price
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </section>

                  </div>
            </div>
            <!--End here Filter category-->
                    <div class="col-md-9 w_content">
                        <div style="display: none;" class="" id="compare_list">
                            <ul id="compareProductList">
                            </ul>
                            <a id="compareButton" style="margin-top: 10px; float: right;" href="#" class="button_1"><span>Compare Now </span></a>
                            <a id="minimize" href="#" title="Toggle">-</a>
                            <a id="close-compare" href="#" title="Close">X</a>

                        </div>
               <!--Start here Images repeater -->
			         <div class="women">
                <%if (Request.Params["searchId"] != null)
                  {%>
                    <h2 class="recentitem" style="text-align:left" >Search Result</h2>
               <%} %>

               <% if (prodDt != null)
                  {%>
                 <div id="categories">
                    <%for (int i = 0; i < prodDt.Rows.Count; i++)
                      { %>
                            <div class="right_inner_categorydetailsimagesdetails">
                                <div class="boxgrid">
                                <div class="loading item" sequence='<%#next()%>' sku='<%=prodDt.Rows[i]["SKUCode"]%>'>
                              <a href='<%=prodDt.Rows[i]["link"] %>'>
                                 <div class='lnkbtn_brandname'> <%=prodDt.Rows[i]["SKUBrand"]%></div>
                                 <ul class="image_slider" sku='<%=prodDt.Rows[i]["SKUCode"] %>' style='left:0px'>
                                    <%= MFO.Utils.StringUtil.dispLI(prodDt.Rows[i]["PathUpperInternaldetailsSmallImage"], prodDt.Rows[i]["SKUName"], false)%>
                                    <%= MFO.Utils.StringUtil.dispLI(prodDt.Rows[i]["PathLowerInternaldetailsSmallImage"], prodDt.Rows[i]["SKUName"], false)%>
                                    <%= MFO.Utils.StringUtil.dispLI(prodDt.Rows[i]["PathBackInternaldetailsSmallImage"], prodDt.Rows[i]["SKUName"], false)%>
                                    <%= MFO.Utils.StringUtil.dispLI(prodDt.Rows[i]["PathInternaldetailsSmallImage"], prodDt.Rows[i]["SKUName"], true)%>
                                 </ul>
                              </a>
                           </div>
                           <a href="javascript:void(0);" class="previmg" prev='<%=prodDt.Rows[i]["SKUCode"]%>' ></a>
                           <a href="javascript:void(0);" class="nextimg" next='<%=prodDt.Rows[i]["SKUCode"]%>' ></a>
                        </div>
                         <a href='<%=prodDt.Rows[i]["link"] %>'>
                        <div class="categorydetails_info_bottom">
                           <div class="wishquick1">
                                <a class="wish-list1" name='saveLater' sku='<%=prodDt.Rows[i]["SKUCode"]%>'><span><%=getToolTip()%></span></a>
                                <a class="quick-view1" pop='<%=prodDt.Rows[i]["SKUCode"] %>'><span>Quick View</span></a>
                                <a class="compare-view1"><label><input type="checkbox"  compare sku='<%=prodDt.Rows[i]["SKUCode"]%>'/>Compare</label><span>Add to compare</span></a>
                            </div>
                               <div class="productpricesection">
                                <div class='lnkbtn_proname'><%=catDT.Rows[i]["SKUName"]%></div>
                                <div class="splprice"><span class="margin">Rs.</span><%=prodDt.Rows[i]["SpecialPrice"]%></div>
                                <div class="crossprize" >Rs. <%=prodDt.Rows[i]["MRP"]%> </div>
                                <div><%=prodDt.Rows[i]["MetaKeywords"]%></div>
                                </div>
                                         
                        </div>
                        </a>
                     </div>
               <%}%>
               </div>
               <div class="clearfix"></div>
                   <a id="showProd" href="javascript:void(0)" style="text-align:left"><h2 class="recentitem">See Related Products</h2></a>
              <div id="relatedProd" style="display:none">
               <%} %>
               <%if (catDT != null && catDT.Rows.Count > 0)
                 { %>
               <div id="categories">
               <%for (int i = 0; i < catDT.Rows.Count; i++)
                 { %>
                            <div class="right_inner_categorydetailsimagesdetails">
                                <div class="boxgrid">
                                <div class="loading item" sequence='<%#next()%>' sku='<%=catDT.Rows[i]["SKUCode"]%>'>
                              <a href='<%=catDT.Rows[i]["link"] %>'>
                                 <div class='lnkbtn_brandname'> <%=catDT.Rows[i]["SKUBrand"]%></div>
                                 <ul class="image_slider" sku='<%=catDT.Rows[i]["SKUCode"] %>' style='left:0px'>
                                    <%= MFO.Utils.StringUtil.dispLI(catDT.Rows[i]["PathUpperInternaldetailsSmallImage"], catDT.Rows[i]["SKUName"], false)%>
                                    <%= MFO.Utils.StringUtil.dispLI(catDT.Rows[i]["PathLowerInternaldetailsSmallImage"], catDT.Rows[i]["SKUName"], false)%>
                                    <%= MFO.Utils.StringUtil.dispLI(catDT.Rows[i]["PathBackInternaldetailsSmallImage"], catDT.Rows[i]["SKUName"], false)%>
                                    <%= MFO.Utils.StringUtil.dispLI(catDT.Rows[i]["PathInternaldetailsSmallImage"], catDT.Rows[i]["SKUName"], true)%>
                                 </ul>
                              </a>
                           </div>
                           <a href="javascript:void(0);" class="previmg" prev='<%=catDT.Rows[i]["SKUCode"]%>' ></a>
                           <a href="javascript:void(0);" class="nextimg" next='<%=catDT.Rows[i]["SKUCode"]%>' ></a>
                        </div>
                         <a href='<%=catDT.Rows[i]["link"] %>'>
                        <div class="categorydetails_info_bottom">
                           <div class="wishquick1">
                                <a class="wish-list1" name='saveLater' sku='<%=catDT.Rows[i]["SKUCode"]%>'><span><%=getToolTip()%></span></a>
                                <a class="quick-view1" pop='<%=catDT.Rows[i]["SKUCode"] %>'><span>Quick View</span></a>
                                <a class="compare-view1"><label><input type="checkbox"  compare sku='<%=catDT.Rows[i]["SKUCode"]%>'/>Compare</label><span>Add to compare</span></a>
                            </div>
                               <div class="productpricesection">
                                <div class='lnkbtn_proname'><%=catDT.Rows[i]["SKUName"]%></div>
                                <div class="splprice"><span class="margin">Rs.</span><%=catDT.Rows[i]["SpecialPrice"]%></div>
                                <div class="crossprize" >Rs. <%=catDT.Rows[i]["MRP"]%> </div>
                                <div><%=catDT.Rows[i]["MetaKeywords"]%></div>
                                </div>
                                         
                        </div>
                        </a>
                     </div>
               <%} %>
               </div>
               <%} %>
               <%if (prodDt != null) %>
                </div>
               <% %>
               </div>
               <div class="clearfix"></div>
               <!--End here Images repeater -->
               <div style="text-align:center">
                        <a href="#" id="showMoreLink"><b>See More...</b></a>
                        <img id='loadImg' src="<%=ConfigUtil.StaticPath()%>new-images/loader.GIF" alt="Loading..." style='display: none; height: 20px; width: 160px; z-index: 999999' />
                </div>
            </div>
         </div>
         </div>
         <div id="filter_float_threshold_end">
         </div>
         <div class="background_overlay_quick" style="display: none;">
         </div>
         <section>
            <div  id="overlay_form_quick"  style="margin:0 auto; display:none;">
               <div  style=" position:fixed; left:200px; top:10px; background:white; width:1000px; border-radius:10px; height:580px; ">
                  <a title="close" style="text-align:right; font-size:20px; color:red; float:right; margin-right:10px" id="closequickview" href="#">x</a>	
                  <object type="text/html" id='quickViewObj' style=" background:white; margin:0 auto;  width:1000px; border-radius:10px; height:580px; "></object>
               </div>
            </div>
            <div class="pcd_background_overlay" style="display: none;"></div>
            <div  id="pcd_overlay_form_quick"  style="margin:0 auto; display:none;">
               <div  style=" position:fixed; left:200px; top:10px; background:white; width:300px; border-radius:10px; height:80px; ">
                  <a title="close" style="text-align:right; font-size:20px; color:red; float:right; margin-right:10px" id="A1" href="#">x</a>	
                  <div><input type="button" value="Continue to shopping" /> <input type="button" value="Proceed to buy" /></div>
               </div>
         </section>
         <div style="clear: both">
         </div>
         <input type="hidden" value='<%=PType%>' id="PType" />
         <input type="hidden" value="1" name="pageNo" id="pageNo">
         <input type="hidden" id="PBrand" value='<%=Request.Params["PBrand"] %>' />
         <input type="hidden" id="range" value="" />
         <input type="hidden" id="sortPrice" value="" />
         <input type="hidden" id="error" value="false" />
         <!-- End -->
         <%=Footer %>
         </div>
      </div>
      <div id="ajaxconfig_info" style="display: none">
         <button name="white" value="0.7">
         </button>
         <input id="enable_module" value="1" type="hidden">
      </div>
   </body>
</html>

