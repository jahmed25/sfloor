<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageLayout.master" AutoEventWireup="true" enableEventValidation="false" enableViewStateMac="false" viewStateEncryptionMode="Never" CodeFile="Categories.aspx.cs" Inherits="Categories" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
<link href='<%=ConfigUtil.StaticPath() %>new-css/layout.css' rel="stylesheet" type="text/css" />
<link href='<%=ConfigUtil.StaticPath() %>new-css/styles-filter.css' rel="stylesheet" type="text/css" />
<link href='<%=ConfigUtil.StaticPath() %>new-css/internalpage.css' rel="stylesheet" type="text/css" />

<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/jquery-1.8.3.min.js'></script>
<script src='<%=ConfigUtil.StaticPath() %>new-js/fixsidemenu.js' type="text/javascript"></script>
<script src='<%=ConfigUtil.StaticPath() %>new-js/main.js' type="text/javascript"></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/category.js'></script>
<script type="text/javascript" src='<%=ConfigUtil.StaticPath() %>new-js/common1.js'></script>

<style>
  #overlay_form_quick
    {
        background: WHITE;
        z-index: 100000; border-radius:10px;
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
    </style>

    
<div id="inner_middle_category" class="overflows">
<div class="right_inner_categorydetailssortby">
<div class="catcrumbs" id="crumbs">
			<ul>
<li><a  href='<%=ConfigUtil.hostURL() %>'> Home </a></li>
<li><a id='catNav' href='<%=catUrl%>'> <%=catName%> </a></li>
<li><a id='subCatNav' href='<%=subCatUrl%>'> <%=subCatName%> </a></li>
<li><a id='pTypeNav' href='<%=pTypeUrl%>'> <%=pTypeName%> </a></li>
    
</ul></div>
        <div class="select-style">
                  <select ID="price_select">
                    <option value="0">Sort by price : Select</option>
                    <option value="1">Sort by price : Low to High</option>
                    <option value="2">Sort by price : High to Low</option>
               </select>
       </div>
    </div>
    <!--End here Filter category-->
<div id="filter_float_threshold_start"></div>
<div id="floating_filter" style="width: 200px; top: 170px; position: fixed; ">

<div  class="inner_category_left">

<div class="filters-wrapper">
<div class="clear"></div>
<div id='cssmenu' style="display:none">
   <ul>
   <li class='has-sub'><a href='#'></a>
   <ul>
   <li></li>
   </ul>
   </li>
   </ul>
   </div>
<div id='cssmenu'>
<ul>
<li></li>
<li class='has-sub'><a href='#' id="MainCatHeader"  style="background-color:#E4E4E4;" runat="server">Accessories<em></em></a><a style="width:25px; z-index:1; text-align:right; background:transparant; float:right; padding:2px 10px 10px 160px;top:5px; cursor:pointer;  position:absolute"><em></em></a>
<ul style="height:auto">
    <asp:DataList ID="datalist_categoryname" Visible="true" runat="server" RepeatDirection="Vertical" RepeatColumns="1" > 
        <ItemTemplate> 
        <li>
        <a class="lnkbtn_category" href='<%# Eval("url") %>' data="<%# Eval("SKUProductType") %>" ><%# Eval("SKUProductType") %></a>
        </li>
        </ItemTemplate> 
    </asp:DataList>
    <asp:Label ID="lblmessagecategory" runat="server" Visible="false" ForeColor="Red" ></asp:Label>
</ul>
</li>
</ul>
</div>
<div class="clear"></div>
<div id='cssmenu'>
<ul>
<li class='has-sub'><a href='#' style="background-color:#E4E4E4" >Brand <em></em></a>
<ul>
 <asp:DataList ID="datalist_brandname" runat="server" RepeatDirection="Vertical" RepeatColumns="1" > 
        <ItemTemplate>      
       <li> <a class="lnkbtn_category" href="#"><%# Eval("SKUBrand") %></a></li>
        </ItemTemplate> 
    </asp:DataList>
    <asp:Label ID="lblmessagebrandname" runat="server" Visible="false" ForeColor="Red" ></asp:Label>
</ul>
</li>
</ul>
</div><div class="clear"></div>

<div class="clear"></div>
<div id='cssmenu' class="">
<ul>
<li class='has-sub'><a href='#' style="background-color:#E4E4E4">Price (Rs.)<em></em></a>
<ul>
<div class="priceinput">
<input type="number" name="min" id='minTxt' min="0" /><input id='maxTxt' type="number" min="0" name="max" /><input type="button" value="GO" id='priceRangeBtn'/><br><span id='errRange' style='display:none;color:red'>Please enter the min and max price</span></div>
</ul></li>
</ul>
</div>
<div class="clear"></div>

<div id="cssmenu">
<ul  class="color1">
<li class='has-sub'><a href='#' style="background-color:#E4E4E4">Color<em></em></a>
<ul>
<li><input type="checkbox" id="black"/><a href="#" title="black" style="background-color: Black"></a><label for="black">Black</label></li>
<li><input type="checkbox" id="brown"/><a href="#" title="brown" style="background-color: #7e4f2f"></a><label for="brown">Brown</label></li>
<li><input type="checkbox" id="cream"/><a href="#" title="cream"  style="background-color: #f4eedb"></a><label for="cream">Cream</label></li>
<li><input type="checkbox" id="white"/><a href="#" title="white"  style="background-color: White"></a><label for="white">White</label></li>
<li><input type="checkbox" id="grey"/><a href="#" title="grey" style="background-color: #b3b3b3"></a><label for="grey">Grey</label></li>
<li><input type="checkbox" id="red"/><a href="#" title="red" style="background-color: #d20000"></a><label for="red">Red</label></li>
<li><input type="checkbox" id="orange"/><a href="#" title="orange" style="background-color: #ff8726"></a><label for="orange">Orange</label></li>
<li><input type="checkbox" id="yellow"/><a href="#" title="yellow" style="background-color: #fbe14e"> </a><label for="yellow">Yellow</label></li>
<li><input type="checkbox" id="blue"/><a href="#" title="blue"  style="background-color: #00539f"></a><label for="blue">Blue</label></li>
<li><input type="checkbox" id="purple"/><a href="#" title="purple" style="background-color: #472f92"></a><label for="purple">Purple</label></li>
<li><input type="checkbox" id="pink"/><a href="#" title="pink"  style="background-color: #f06eaa" ></a><label for="pink">Pink</label></li>
<li><input type="checkbox" id="green"/><a href="#" title="green"  style="background-color: green"></a><label for="green">Green</label></li>
<li><input type="checkbox" id="gold"/><a href="#" title="gold"  style="background-color: Gold"></a><label for="gold">Gold</label></li>
</ul>
</li>
</ul>
</div>


<div id="cssmenu">
<ul  class="color1">
<li class='has-sub'><a href='#' style="background-color:#E4E4E4">Size<em></em></a>
<ul>
<div id="size">
<li id="li"><a href="#">0</a></li>
<li id="li"><a href="#">2</a></li>
<li id="li"><a href="#">4</a></li>
<li id="li"><a href="#">6</a></li>
<li id="li"><a href="#">8</a></li>
<li id="li"><a href="#">10</a></li>
<li id="li"><a href="#">12</a></li>
<li id="li"><a href="#">14</a></li>
</div>
<div id="size" style="margin-bottom:20px">
<li id="li"><a href="#">S</a></li>
<li id="li"><a href="#">M</a></li>
<li id="li"><a href="#">L</a></li>
<li id="li"><a href="#">XL</a></li>
<li id="li"><a href="#">XXL</a></li></div>
<a href="#" class="clear">View chart size</a>
</ul>
</li>
</ul>
</div>
</div>
</div>
</div>
<!--End here Filter category-->
<div id="right_inner_contents">
        <!--Start here Images repeater -->
       
        
        <asp:DataList ID="categories" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" >
            <ItemTemplate>

                <div class="right_inner_categorydetailsimagesdetails">
                  <div style="position:absolute; z-index:1;"><img id="soldout" runat="server"/></div>

                 <div class="wishquick">
                 <span class="hover-image1"></span> 
                 <a class="wish-list" name='saveLater' sku='<%# Eval("SKUCode") %>'><span>Save for Later</span></a>
                  <a class="quick-view" pop='<%# Eval("SKUCode") %>' ><span>Quick View</span></a></div>
                    <%--<a  href='#' name='saveLater' sku='<%# Eval("SKUCode") %>'>fav</a>--%>
                    <div class="boxgrid captionfull"
                        <a href="<%# Eval("link") %>">
                         
                            <div class="loading item">
                                <img src="<%#ConfigUtil.getServerPath()+Eval("PathInternaldetailsSmallImage")%>"
                                    alt="<%# Eval("SKUName") %>" class="right_inner_categorydetailsimagescss" />
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

        <div class="notfound sprite" id="message_main_box">
            <div id="message_box1">
                <p>
                    <a href="javascript:void(0)" class="right1" onclick="document.getElementById('message_box1').style.display='none';">
                        <em id="crosserr"></em></a></p>
                <div class="message_box_inner1">
                    <p>
                        In case, you are unable to find the product within your range, call our dedicated
                        helpline for assistance.</p>
                </div>
            </div>
        </div>
        <asp:Label ID="lblmessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
         <div id="filter_float_threshold_end">
        </div>
        <!--End here Images repeater -->
    </div>
</div>
<div class="right_inner_categorydetailsimages">
    <a href="#" id="showMoreLink">Show More Products</a>
</div>
<div class="background_overlay_quick" style="display: none;">
</div>
<section>
<div  id="overlay_form_quick"  style="  display:none;">
<div  style=" position:fixed; background:white; margin:0 auto; width:950px; border-radius:10px; height:580px; ">
<a title="close" style="text-align:right; font-size:20px; color:red; float:right; margin-right:10px" id="closequickview" href="#">x</a>	
<object type="text/html" id='quickViewObj' style=" background:white; margin:0 auto; width:950px; border-radius:10px; height:580px; "></object></div> 
</div>
</section>
<div style=" clear:both"></div>
<input type="hidden" value='<%=PType%>' id="PType"/>
<input type="hidden" value="1" name="pageNo" id="pageNo">
<input type="hidden" id="PBrand" value='<%=Request.Params["PBrand"] %>' /> 
<input type="hidden" id="range" value="" /> 
<input type="hidden" id="sortPrice" value="" /> 

<input type="hidden" id="error" value="false" />
 
</asp:Content>

