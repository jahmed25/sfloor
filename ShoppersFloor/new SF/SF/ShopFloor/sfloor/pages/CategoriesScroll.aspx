<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoriesScroll.aspx.cs" Inherits="CategoriesScroll" %>
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
       
<input type="hidden" id="PBrand" value="<%=Request.Params["PBrand"] %>" />
<input type="hidden" value="<%=PageNo%>" name="pageNo" id="pageNo"/>
