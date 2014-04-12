<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoriesScroll.aspx.cs" Inherits="CategoriesScroll" %>

<asp:DataList ID="categories" runat="server" RepeatDirection="Horizontal" RepeatColumns="3"
            OnItemDataBound="categories_Bound">
            <ItemTemplate>
                <div class="right_inner_categorydetailsimagesdetails">
                  <div style="position:absolute; z-index:1;"><img id="soldout" runat="server"/></div>
                    <div id="container" class="boxgrid captionfull">
                       <a  href='#' name='saveLater' sku='<%# Eval("SKUCode") %>'>fav</a> 
                        <a href="<%# Eval("link") %>">
                         
                            <div class="loading">
                                <img src="<%#ConfigUtil.getServerPath()+Eval("PathInternaldetailsSmallImage")%>"
                                    alt="<%# Eval("SKUName") %>" class=" right_inner_categorydetailsimagescss" />
                            </div>
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
        <asp:Panel ID ="pnl_disprice" runat="server"><img class="offerimg" id="offerprice" runat="server" /></asp:Panel>
       <div class='right_inner_categorydetailsimagesprize'>
            <img class="img_rupee" alt="" id="imgbtn_crosspriceimg" runat="server" />
        <a href='<%# Eval("link") %>' id="lnkbtn_crossprize" runat="server" class="a_proprize" ><%# Eval("MRP")%></a>
    
    
            <img class="margin" alt="" id="imgbtn_crosspriceimg2" runat="server"  />
        <a href='<%# Eval("link") %>' id="btn_crossprize" runat="server" class="a_proprize" ><%# Eval("MetaKeywords")%></a>
    
          <img class="margin" src="<%=ConfigUtil.hostURL() %>Images/rupee_11px.png"/>
        <a href='<%# Eval("link") %>' id="lnkbtn_price" runat="server" class="lnkbtn_proprize  splprice" ><%# Eval("SpecialPrice")%></a>
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