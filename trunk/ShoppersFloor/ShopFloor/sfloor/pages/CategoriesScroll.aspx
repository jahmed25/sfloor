<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoriesScroll.aspx.cs" Inherits="CategoriesScroll" %>

<asp:DataList ID="categories" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"
            OnItemDataBound="categories_Bound">
            <ItemTemplate>
                <div class="right_inner_categorydetailsimagesdetails">
                  <div style="position:absolute; z-index:1;"><img id="soldout" runat="server"/></div>

                 <div class="wishquick">
                 <span class="hover-image1"></span> 
                 <a class="wish-list" name='saveLater' sku='<%# Eval("SKUCode") %>'><span>Save for Later</span></a>
                  <a class="quick-view" pop='<%# Eval("SKUCode") %>' ><span>Quick View</span></a></div>
                    <div class="boxgrid captionfull"
                        <a href="<%# Eval("link") %>">
                         
                            <div class="loading item">
                               <a href='<%#Eval("link") %>'> <img src="<%#ConfigUtil.getServerPath()+Eval("PathInternaldetailsSmallImage")%>"
                                    alt="<%# Eval("SKUName") %>" class="right_inner_categorydetailsimagescss" /></a>
                           <%--      <span class="hover-image"><img src='http://admin.megafactoryoutlet.com/sfloor/new-images/sample-_12__2_1.jpg'></span>
                           --%> </div>
                        </a>
                        <asp:Label Font-Size="0px" ID="l" runat="server" Text='<%# Eval("SKUCode") %>'></asp:Label>
                        <asp:Label Font-Size="0px" ID="sdt" runat="server" Text='<%# Eval("SizeDataType") %>'></asp:Label>
                        <asp:Label Font-Size="0px" ID="c" runat="server" Text='<%# Eval("SKUClassification") %>'></asp:Label>
                        <asp:Label Font-Size="0px" ID="v" runat="server" Text='<%# Eval("VariantType") %>'></asp:Label>
                    </div>
               <div class="categorydetails_info_bottom">
            <div class="categorydetails_inner_brandname">   
            <a href="<%# Eval("link") %>" class='lnkbtn_brandname'><%# Eval("SKUBrand") %></a>
   </div>
   <div class="right_inner_categorydetailsimagesname">
               <a href="<%# Eval("link") %>"  class='lnkbtn_proname'><%# Eval("SKUName") %></a>
    </div>
   <div class='right_inner_categorydetailsimagesprize'>
    <asp:Panel ID ="pnl_disprice" runat="server"><img class="offerimg" id="offerprice" runat="server" /></asp:Panel>
        <img class="img_rupee" alt="" id="imgbtn_crosspriceimg" runat="server" />
    <a href='<%# Eval("link") %>' id="lnkbtn_crossprize" runat="server" class="a_proprize" ><%# Eval("MRP")%></a>
        <img class="margin" alt="" id="imgbtn_crosspriceimg2" runat="server"  />
    <a href='<%# Eval("link") %>' id="btn_crossprize" runat="server" class="a_proprize" ><%# Eval("MetaKeywords")%></a>
    
     <%-- <img class="margin" src="<%=ConfigUtil.hostURL() %>Images/rupee_11px.png"/>--%>
    <span class="margin" >Rs.</span><a href='<%# Eval("link") %>' id="lnkbtn_price" runat="server" class="lnkbtn_proprize  splprice" ><%# Eval("SpecialPrice")%></a>
   <%--    <asp:Label Font-Size="0px" ID="inventory" runat="server" visible ="false" Text='<%# Eval("Inventory") %>'></asp:Label>--%>
      </div>

            
   </div>
                    <div class="right_inner_categorydetailsimagesaddtocart">
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
            <input type="hidden" id="PBrand" value="<%=Request.Params["PBrand"] %>" />
        <input type="hidden" value="<%=PageNo%>" name="pageNo" id="pageNo">