<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPageLayout.master" AutoEventWireup="true" enableEventValidation="false" enableViewStateMac="false" viewStateEncryptionMode="Never" CodeFile="CategoryDetails.aspx.cs"  Inherits="CategoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <link href="http://web3.128.210.new.ocpwebserver.com/CSS/internalpage.css" rel="stylesheet" type="text/css" />
    <link href="http://web3.128.210.new.ocpwebserver.com/CSS/tab-view.css" rel="stylesheet" type="text/css" />
    <link href="http://web3.128.210.new.ocpwebserver.com/CSS/CategoriesScroll.css" rel="stylesheet" type="text/css" />
    <link href="http://web3.128.210.new.ocpwebserver.com/CSS/zoomIt-gallery.css" rel="stylesheet" type="text/css" />
    <link href="http://web3.128.210.new.ocpwebserver.com/CSS/recent.css" rel="stylesheet" type="text/css" />
    
    <link href="http://web3.128.210.new.ocpwebserver.com/CSS/breadcrumb.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     #background-white{background:#fff;}
     .bgClr{background:#464646;color:#F5F5F5}  
    </style>
    <script src="http://web3.128.210.new.ocpwebserver.com/js/popup.js" type="text/javascript"></script>
    <script src="http://web3.128.210.new.ocpwebserver.com/js/zoomit.jquery.js" type="text/javascript"></script>
    <script src="http://web3.128.210.new.ocpwebserver.com/js/tab-view.js" type="text/javascript"></script>
    <script src="http://web3.128.210.new.ocpwebserver.com/js/home-common-internal.js" type="text/javascript"></script>
    

    <script type="text/javascript">
        jQuery(window).load(function () {

            var previews = jQuery('.full-image a'), // image previews
			thumbnails = jQuery('.gallery-thumbnails a'); // small thumbnails for changing previews
            // start zoom only on visible element
            jQuery('.zoomIt.visible').jqZoomIt({
                init: function () { // on zoom init, add class to element
                    jQuery(this).addClass('zoomIt_loaded');
                }
            });
            // small navigation thumnails functionality
            jQuery(thumbnails).hover(function (e) {
                e.preventDefault();
                // hide all previews
                jQuery(previews).removeClass('visible').addClass('hidden');
                // get key of thumbnail
                var key = jQuery.inArray(this, thumbnails);
                // show preview having the same key as small thumbnail
                jQuery(previews[key]).removeClass('hidden').addClass('visible');
                // check if preview has loaded class and if not, start zoom and add class
                if (!jQuery(previews[key]).hasClass('zoomIt_loaded')) {
                    // start zoom
                    jQuery(previews[key]).jqZoomIt();
                    // add zoom loaded class
                    jQuery(previews[key]).addClass('zoomIt_loaded');
                }
            })

        });
</script>
    <script type="text/javascript">
        $(function () {
            if ($("#ContentPlaceHolder1_lnkbtn_categorytype").text() == "Bags" || $("#ContentPlaceHolder1_lnkbtn_categorytype").text() == " Storage") {
                //|| $("#ContentPlaceHolder1_lnkbtn_categorytype").text() == " Storage"
                $("#ContentPlaceHolder1_lbl_choosesize").text("");
                $("#p_size1").html("");
            }
            $(".btn_size50").click(function () {
                $('.btn_size50').removeClass('bgClr');
                $(this).addClass('bgClr');
                return true;
            });
        });
    </script>
<script type="text/javascript">
    !function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (!d.getElementById(id))
        { js = d.createElement(s); js.id = id; js.src = "https://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); }
    }
    (document, "script", "twitter-wjs");
</script>
<script type="text/javascript">
    function mfotweet() {
        window.open('https://twitter.com/MFOutlet', 'mywindow', 'menubar=yes')
    }
</script>
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-41893953-1']);
    _gaq.push('_addOrganic', 'google.com', 'q');
    _gaq.push(['_trackPageview']);
    _gaq.push('_trackPageLoadTime');


    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
    })();
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cat_hr" style="clear:both"></div>
    <div id="content" class="overflows">
<div class="contentsitemap">
<asp:Panel ID="pnl_saleends" runat="server" Visible="true">
  
       <div id="crumbs">
			<ul>
            <li><a href="<%=ConfigUtil.hostURL() %>">Home</a></li>
            <li><a ID="lnkbtn_category" runat="server" ></a></li>
             <li><a ID="lnkbtn_categorytype" runat="server" ></a></li>
            <li><a ID="lnkbtn_producttype" runat="server" ></a></li>
           <li> <a><asp:Label ID="lbl_sitemapproductname" runat="server"></asp:Label></a></li>
            </ul></div>
  </asp:Panel>
</div>
<div id="contenttop">
<div class="contenttopfirstlayer">
    <div id="productimage">
        <div class="productimage">
        <asp:Panel ID="Panel_PathMainImage" runat="server">
            <div class="container">
                <div><label runat="server" class="offer" id="lbl_offer" visible="false"></label></div>
	            <div class="full-image">
                       <asp:Repeater ID="DataGrid_Small" runat="server">
                            <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                    <a href='<%#ConfigUtil.getServerPath()+Eval("PathInternaldetailsZoomImage")%>' class="zoomIt visible">
                                    <img src="<%#ConfigUtil.getServerPath()+DataBinder.Eval(Container.DataItem, "PathInternaldetailsHoverImage")%>"  alt="<%# Eval("SKUName") %>" /></a>
		                            <a href='<%#ConfigUtil.getServerPath()+Eval("PathUpperInternaldetailsZoomImage")%>' class="zoomIt hidden">
                                    <img src="<%#ConfigUtil.getServerPath()+DataBinder.Eval(Container.DataItem, "PathUpperInternaldetailsHoverImage")%>" alt="<%# Eval("SKUName") %>-1" /></a>
                                    <a href='<%#ConfigUtil.getServerPath()+Eval("PathLowerInternaldetailsZoomImage")%>' class="zoomIt hidden">
                                    <img src="<%#ConfigUtil.getServerPath()+DataBinder.Eval(Container.DataItem, "PathLowerInternaldetailsHoverImage")%>" alt="<%# Eval("SKUName") %>-2" /></a>
                                    <a href='<%#ConfigUtil.getServerPath()+Eval("PathBackInternaldetailsZoomImage")%>' class="zoomIt hidden">
                                    <img src="<%#ConfigUtil.getServerPath()+DataBinder.Eval(Container.DataItem, "PathBackInternaldetailsHoverImage")%>" alt="<%# Eval("SKUName") %>-3" /></a>               
                                </ItemTemplate> 
                            <FooterTemplate></FooterTemplate>
                    </asp:Repeater>
	            </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnl_bigcolorimg" runat="server" Visible="false">
            <div class="container">
	            <div class="full-image">
                    <asp:Repeater ID="repeater_color" runat="server">
                            <HeaderTemplate></HeaderTemplate>
                                <ItemTemplate>
                                     <a href='<%#ConfigUtil.getServerPath()+Eval("PathBackInternaldetailsZoomImage")%>' class="zoomIt visible">
                                    <img src="<%#ConfigUtil.getServerPath()+DataBinder.Eval(Container.DataItem, "PathInternaldetailsHoverImage")%>"  alt="<%# Eval("SKUName") %>-4" /></a>              
                                </ItemTemplate> 
                            <FooterTemplate></FooterTemplate>
                    </asp:Repeater>
	            </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="Panel_PathFrontImage" runat="server">
        </asp:Panel>
        </div>
   
        <div class="img_hovericon sprite"><em id="hovericon"></em>&nbsp;&nbsp;<span>Hover over image to zoom</span>
        </div>
        <asp:Panel ID="Panel_SmallImage" runat="server">
        <div class="productmultiimage">   
            <ul class="gallery-thumbnails">
		        <li>
                    <asp:DataList ID="datalist_smallimage" runat="server"> 
                            <ItemTemplate> 
                                <div> 
                                    <a href="#">
                                    <asp:ImageButton ID="imgbtn_smallimage" Width="90" runat="server" 
                                    ImageUrl='<%#ConfigUtil.getServerPath()+Eval("PathInternaldetailsSmallImage")%>'></asp:ImageButton>
                                    </a>   
                                </div>    
                            </ItemTemplate> 
                    </asp:DataList>
                </li>
                <li><a><img ID="ImageButton1" Width="90" runat="server" /></a></li>
		        <li><a><img ID="ImageButton2" Width="90" runat="server" /></a></li>
		        <li><a><img ID="ImageButton3" Width="90" runat="server" /></a></li>
		        <li><a><img ID="ImageButton4" Width="90" runat="server" /></a></li>
	        </ul> 
        </div>
        </asp:Panel>
    </div> 
</div>
<div class="contenttopsecondlayer">
    <div id="productnamepriceborder">
    <div class="contentproductnameid">
        <div class="productname">
           <%-- <p><asp:LinkButton ID="lnkbtn_brandname" CssClass="productbrandnamecss" runat="server"></asp:LinkButton></p>
            <h1 id="H1" class="h1_prodName" runat="server"><asp:Literal ID="lbl_productname" runat="server"></asp:Literal></h1>--%>
        </div>
        <div class="productnamedetails">         
        </div>
    </div>
    <div class="contentproductprice sprite">
        <div class="productprice">
            <em id="pricelogo26"></em><asp:Label ID="lbl_productprice" CssClass="lbl_price" runat="server"></asp:Label>
            <p><asp:Image ID="image_crossprize" class="imgcross" ImageUrl="~/Images/rupee_13px_gray.png"
                    runat="server" /><asp:Label ID="lbl_crosprice"  CssClass="lbl_crossprice" runat="server"></asp:Label></p>
        </div>
    </div>
    <div class="contentproductcartpay">
    <div class="contentproduct_choose">
        <%--<asp:ScriptManager ID ="scriptmanager1" runat="server">
        </asp:ScriptManager>--%>
        <asp:Panel ID="pnl_size" runat="server" Visible="true">
          <em><asp:Label ID="lbl_choosesize" runat="server" Text="Choose your size&nbsp;:&nbsp;"><asp:Label ID="lbl_selectsizemssge" runat="server" ForeColor="Red" Visible="false"></asp:Label></asp:Label>
           <asp:Label ID="lbl_category" runat="server" Visible="false"></asp:Label><asp:Label Font-Size="0px" ID="lbl_SizeDataType" runat="server"></asp:Label>
            <a href="#" runat="server" visible="true" id="img_size"  class="size_guide sprite">
            <em id="sizeguide"></em><asp:Label  ID="lbl_sizeguide" runat="server" CssClass="size_guds" Visible="true" Text="SIZE GUIDE"></asp:Label></a></em>
            <div class="product_size" id="p_size1">
                     <%--<asp:UpdatePanel ID ="updatepanel1" runat="server">
                        <ContentTemplate>--%>
                            <asp:Button ID="btn_skusize1" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize1_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize2" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize2_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize3" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize3_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize4" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize4_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize5" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize5_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize6" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize6_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize7" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize7_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize8" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize8_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize9" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize9_Click" ></asp:Button>
                            <asp:Button ID="btn_skusize10" runat="server" Visible="false" CssClass="btn_size50" onclick="btn_skusize10_Click" ></asp:Button>
                       <%-- </ContentTemplate>--%>
                      <%--  <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize1" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize2" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize3" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize4" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize5" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize6" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize7" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize8" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize9" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="btn_skusize10" EventName="click" />
                        </Triggers>--%>
                  <%--  </asp:UpdatePanel>  --%>  
         </div>
        </asp:Panel>
        <div style="clear:both;width:100%;height:5px"></div>
<%--        <asp:UpdatePanel ID="updatepanel2" runat="server">--%>
        <%--<ContentTemplate>--%>
        <asp:Panel ID="pnl_color" runat="server">
        <p style=" width:100%;float:left;padding:2px 0 8px 0;"><asp:Label ID="lbl_colortext" runat="server" CssClass="lbl_color" Text="Color :"></asp:Label>
        <asp:Label ID="lbl_color" runat="server" CssClass="lbl_choose"></asp:Label></p>
        <asp:ImageButton ID="imgbtn_color1" runat="server" Visible="false" 
                OnCommand="imgbtn_color1_Command" CssClass="imgbtn_color" 
                CommandName="SKUColor1" Height="60px"
         Width="50px" ></asp:ImageButton>
        <asp:ImageButton ID="imgbtn_color2" runat="server" Visible="false" OnCommand="imgbtn_color2_Command" CssClass="imgbtn_color" CommandName="SKUColor2" Height="60px"
         Width="50px"></asp:ImageButton>
         <asp:ImageButton ID="imgbtn_color3" runat="server" Visible="false" OnCommand="imgbtn_color3_Command" CssClass="imgbtn_color" CommandName="SKUColor3" Height="60px"
         Width="50px"></asp:ImageButton> 
         <asp:ImageButton ID="imgbtn_color4" runat="server" Visible="false" OnCommand="imgbtn_color4_Command" CssClass="imgbtn_color" CommandName="SKUColor4" Height="60px"
         Width="50px"></asp:ImageButton>
         <asp:ImageButton ID="imgbtn_color5" runat="server" Visible="false" OnCommand="imgbtn_color5_Command" CssClass="imgbtn_color" CommandName="SKUColor5" Height="60px"
         Width="50px"></asp:ImageButton>
         <asp:ImageButton ID="imgbtn_color6" runat="server" Visible="false" OnCommand="imgbtn_color6_Command" CssClass="imgbtn_color" CommandName="SKUColor6" Height="60px"
         Width="50px"></asp:ImageButton>
         <asp:ImageButton ID="imgbtn_color7" runat="server" Visible="false" OnCommand="imgbtn_color7_Command" CssClass="imgbtn_color" CommandName="SKUColor7" Height="60px"
         Width="50px"></asp:ImageButton>
         <asp:ImageButton ID="imgbtn_color8" runat="server" Visible="false" OnCommand="imgbtn_color8_Command" CssClass="imgbtn_color" CommandName="SKUColor8" Height="60px"
         Width="50px"></asp:ImageButton>
         <asp:ImageButton ID="imgbtn_color9" runat="server" Visible="false" OnCommand="imgbtn_color9_Command" CssClass="imgbtn_color" CommandName="SKUColor9" Height="60px"
         Width="50px"></asp:ImageButton>
         <asp:ImageButton ID="imgbtn_color10" runat="server" Visible="false" OnCommand="imgbtn_color10_Command" CssClass="imgbtn_color" CommandName="SKUColor10" Height="60px"
         Width="50px"></asp:ImageButton>
        </asp:Panel>
       <%-- </ContentTemplate>
         <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color1" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color2" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color3" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color4" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color5" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color6" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color7" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color8" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color9" EventName="click" />
                            <asp:AsyncPostBackTrigger ControlID="imgbtn_color10" EventName="click" />
                        </Triggers>--%>
        <%--</asp:UpdatePanel>--%>
        <p class="p_quantity" runat="server" id="quantityP">
         <span class="a_quantity" >Quantity&nbsp;: <asp:DropDownList ID="dd_quantity" CssClass="ddl_quantity" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            </asp:DropDownList>
          </span>
            <span id="moreThanFiveSpan" runat="server" visible="false" style="color:Red">Quantity Must not more than 5</span>
        </p>
    </div>
    <div class="productcart">
        <span class="span_selectsize"></span>
        <p>
        <%if(Session["UserID"]==null) {%>
            <input type='button' id="btn_addtocart1"  onclick='showLoginDialog();' value="Add To Cart" 
                class="btn_productcart" runat="server" />
        <%}else {%>
        <asp:Button ID="btn_addtocart" runat="server" Text="Add To Cart" 
                CssClass="btn_productcart" CommandName="AddToCart" 
                OnCommand="btn_addtocart_Command" ></asp:Button>
         <%}%>       
        </p>

        <p>     
        <%if(Session["UserID"]==null) {%>
            <a href='#'class='lnkbtn_waitlist' onclick='showLoginDialog1();'>Add to Wishlist</a>
        <%}else {%>
            <asp:LinkButton ID="lnkbtn_ctaddtowaitlist" CssClass="lnkbtn_waitlist" runat="server" onclick="lnkbtn_ctaddtowaitlist_Click">Add to Wishlist</asp:LinkButton>
         <%}%> 
            
        
        </p>
    </div>
    <div class="content_prod_estimate">
        <p><span>Estimated Delivery :</span><asp:Label ID="lbl_estimate" CssClass="lbl_prod_return" runat="server" Text="2-5 Days"></asp:Label></p>
        <p><span><asp:Label ID="Label_returnpolicy" Text="Return Policy :" runat="server"></asp:Label></span><asp:Label ID="lbl_returnpolicy" CssClass="lbl_prod_return" runat="server"></asp:Label></p>
    </div>
    <div class="content_prod_mail">
        <p><span>Share :</span>Use these links to share Mega and get 500 INR after each new friend’s first order ships </p>
       <div class="content_prod_mail_btn">
            <a href = "javascript:void(0)" onclick = "document.getElementById('light_email').style.display='block';document.getElementById('fade_email').style.display='block'">
        <div class="email_btn"><img style="margin-left:5px" src="Images/messege.png" /><span>Email</span></div></a>
        <a href="#" onclick="mfotweet();" class="twitter_btn"><img alt="" src="http://web3.128.210.new.ocpwebserver.com/Images/twitter.png" /></a>
            <a href="#"><div class="fb_btn">
            <iframe src="https://www.facebook.com/plugins/like.php?href= http://www.facebook.com/megafactoryoutletindia" scrolling="no" frameborder="0"  class="iframe_fb"></iframe></div></a>
        </div>
    </div>
    </div>
    </div>
    <div id="contentproductreview">
    <div id="dhtmlgoodies_tabView1">
	<div class="dhtmlgoodies_aTab">
        <div onmouseover="this.className='scrolltab'" onmouseout="this.className='noscrolltab'" class="noscrolltab">
       <div class="tab-cat">
          <div class="tab-cat_heading">
        <hgroup><h2><i>Details of&nbsp;</i><asp:Label ID="lbl_descproductname" runat="server"></asp:Label></h2></hgroup>
        <p><asp:Label ID="lbl_productdescription" CssClass="lbl_details" runat="server"></asp:Label></p> 
       </div>
        <div class="tab-2_details">
        <%--<p><asp:Label ID="lbl_productdesc" runat="server" Font-Bold="true" Text="Description of Productname"></asp:Label></p>--%>
        <p><b>Brand :</b><asp:Label ID="lbl_productbrand" runat="server"></asp:Label></p>
        <p><b>Wash Care :</b><asp:Label ID="lbl_washcare" runat="server"></asp:Label></p>
        <p><b><asp:Label ID="lbl_txtcolor" runat="server" Text="Color :"></asp:Label></b><asp:Label ID="lbl_productcolor" runat="server"></asp:Label></p>
        <p><b><asp:Label ID="lbl_txtmaterial" runat="server" Text="Material :"></asp:Label></b><asp:Label ID="lbl_productmaterial" runat="server"></asp:Label></p>
        </div>      
        </div>
        </div> 
    </div>
	<div class="dhtmlgoodies_aTab">
        <div onmouseover="this.className='scrolltab'" onmouseout="this.className='noscrolltab'" class="noscrolltab">
        <div class="tab-cat">
       <div class="tab-cat_heading">
       <span>   <!----Write Heading here------->    </span>
       <p><asp:Label ID="lbl_ataglance" runat="server"></asp:Label></p>
       </div>
        </div>
        </div>
	</div>
	<div class="dhtmlgoodies_aTab">
		  <div onmouseover="this.className='scrolltab'" onmouseout="this.className='noscrolltab'" class="noscrolltab">
           <div class="tab-cat">
           <div class="tab-cat_heading">
           <ul>
           <li><a>We will leave no stone unturned in getting that curve back on your face.</a></li>
           <li><a><asp:Label ID="Label2" CssClass="lbl_prod_return" Text="Whatever may be the reason, if you want to return your purchase, we will pick the product back from your doorstep, free of cost." runat="server"></asp:Label><asp:Label ID="lbl_tabreturnpolicy" CssClass="lbl_prod_return" runat="server"></asp:Label>&nbsp;of receipt.</a></li>
           <li><a><asp:Label ID="lbl3" CssClass="lbl_prod_return" runat="server" Text="Please make sure it is not a USED product, should be in the original box and with all price tags attached as you got them." ></asp:Label></a></li>
           <li><a>To know more, please</a>&nbsp;<a class="a_faq" href="faq.aspx">Click here</a></li>
           </ul>
            </div>
            </div>
          </div>   	
	</div>
	<div class="dhtmlgoodies_aTab">
		Content of tab 4
	</div>
</div>
<script type="text/javascript">
    initTabs('dhtmlgoodies_tabView1', Array('Features', 'At a Glance', 'Returns'), 0, 567, 267);
</script>
    </div>    
</div>
</div>
<div id="contentrelatedproduct">
    <div class="relatedproducttext">
    <p>RELATED PRODUCTS</p>
    </div>
    <div class="relatedproductimage">
    <div id="main-container">
        <div id="container">
            <div id="myspan">
                <div id="example1_wrap" >
                    <ul id="example1">
                        <asp:DataGrid ID="DataGrid_ImageSlider" runat="server" DataKeyField="ImageNewID" AutoGenerateColumns="False"
                            ShowHeader="true" CellPadding="5">
                            <Columns>
                                <asp:TemplateColumn HeaderText="Photo">
                                    <ItemTemplate>
                                        <li >
                                        <table cellpadding="0" cellspacing="0" border="0" align ="center">
                                        <tr>
                                             <td align="center">
                                             <asp:ImageButton ID="imgbtn_bag" runat="server" OnCommand="imgbtn_bag_Command" CommandArgument='<%# Eval("SKUCode") %>' 
                                              CommandName="bagsimagclick" ImageUrl='<%#ConfigUtil.getServerPath()+Eval("PathInternaldetailsSmallImage")%>' />
                                             </td>
                                        </tr>
                                         <tr>
                                             <td align="center" style="text-align:center">
                                                 <asp:LinkButton ID="btnlnk_brand" runat="server" OnCommand="imgbtn_bag_Command" CssClass="lnkbtn_proname"
                                                 Text='<%# Eval("SKUBrand") %>'  CommandName="bagsimagclick" CommandArgument='<%# Eval("SKUCode") %>'></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td align="center" style="text-align:center">
                                                 <asp:LinkButton ID="btnlnk_bagsname" runat="server" OnCommand="imgbtn_bag_Command" CssClass="lnkbtn_brandname" 
                                                 Text='<%# Eval("SKUName") %>'  CommandName="bagsimagclick" CommandArgument='<%# Eval("SKUCode") %>'></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td align="center" class="sprite" ><div style="width:60px; height:18px;">
                                            <em id="price-logo" style="margin-left:10px"></em><asp:LinkButton ID="btnlnk_prize" runat="server" OnCommand="imgbtn_bag_Command" CssClass="lnkbtn_proprize" 
                                                 Text='<%# Eval("SpecialPrice") %>' CommandName="bagsimagclick"  CommandArgument='<%# Eval("SKUCode") %>'></asp:LinkButton>
                                             </div></td>
                                        </tr>
                                        </table>
                                        </li>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>


<div class="relatedproducttext">
    <p>RECENT VIEW PRODUCTS</p>
</div>
<div class="recent-head">
<asp:DataList ID="recentViewGrid" runat="server" DataKeyField="ImageNewID" RepeatDirection="Horizontal" RepeatColumns="4">
<ItemTemplate>
 <div class="recent-views">
 <div class="categorydetails_scroll">
     <table cellpadding="0" cellspacing="0" border="0" align="center">
         <tr>
             <td align="center">
                 <asp:ImageButton ID="imgbtn_bag" runat="server" OnCommand="imgbtn_bag_Command" CommandArgument='<%# Eval("SKUCode") %>'
                     CommandName="bagsimagclick" ImageUrl='<%#ConfigUtil.getServerPath()+Eval("PathInternaldetailsSmallImage")%>' />
             </td>
         </tr>
         <tr>
             <td align="center" style="text-align: center" >
                 <asp:LinkButton ID="btnlnk_brand" runat="server" OnCommand="imgbtn_bag_Command" CssClass="lnkbtn_proname"
                     Text='<%# Eval("SKUBrand") %>' CommandName="bagsimagclick" CommandArgument='<%# Eval("SKUCode") %>'></asp:LinkButton>
             </td>
         </tr>
         <tr>
             <td align="center" style="text-align: center">
                 <asp:LinkButton ID="btnlnk_bagsname" runat="server" OnCommand="imgbtn_bag_Command"
                     CssClass="lnkbtn_brandname" Text='<%# Eval("SKUName") %>' CommandName="bagsimagclick"
                     CommandArgument='<%# Eval("SKUCode") %>'></asp:LinkButton>
             </td>
         </tr>
         <tr>
             <td align="center" class="sprite"><div style=" width:60px; height:18px;">
                  <em id="price-logo" style=""></em>
                  <asp:LinkButton ID="btnlnk_prize" runat="server" OnCommand="imgbtn_bag_Command" CssClass="lnkbtn_proprize"
                     Text='<%# Eval("SpecialPrice") %>' CommandName="bagsimagclick" CommandArgument='<%# Eval("SKUCode") %>'></asp:LinkButton></div>
             </td>
         </tr>
     </table>
     </div>
 </div>
</ItemTemplate>
</asp:DataList>
 
</div>


<div style="clear:both;"></div>
<!--Start here Email Popup--->
<div id="light_email" class="white_email sprite">
    <div id="email_content">
      <table width="100%"><tr><td>
        <a href = "javascript:void(0)" onclick = "document.getElementById('light_email').style.display='none';document.getElementById('fade_email').style.display='none'">
        <em id="close"></em></a></td></tr> 
        <tr><td style="padding-left:10px;padding-right:10px;padding-bottom:10px;">  
        <asp:Panel ID="pnl_userreg" runat="server" Visible="true">
            <div class="email_content">
                <div class="email_content_inner">
                    <em class="em_mail">Email</em>
                    <p>To :</p>
                    <p><span><asp:TextBox ID="txt_email" runat="server"></asp:TextBox></span></p>
                    <p>List emails separated by commas, semi-colons, or spaces </p>
                    <p>Messege :</p>
                    <p><span><asp:TextBox ID="txt_edescription" runat="server"></asp:TextBox></span></p>
                    <p>Your friend will receive a message with a link to this page. Recipients who are not Mega members will receive an invitation to join.</p>
                    <p><asp:Label ID="lbl_erremailsignup" runat="server" ForeColor="Red" Visible="true"></asp:Label></p>
                    <p><button id="btn_emailsubmit" runat="server" onserverclick="btn_emailsubmit_OnClick">Submit</button></p>
                </div>
            </div>
        </asp:Panel>
    </td></tr>          
    </table>     
    <div align="center" class=" headertext">
    <asp:Label ID="txtlbl" runat="server"  ></asp:Label></div>
    </div>
</div>
<div id="fade_email" class="black_overlay_email"></div>
<!--Start here Email Popup--->
<!--Start here Add to Wait List Popup--->
<div id="light_addlist" class="sprite white_addlist">
        <div id="addlist_content">
        <table width="100%"><tr><td>
          <a href = "javascript:void(0)" onclick = "document.getElementById('light_addlist').style.display='none';document.getElementById('fade_addlist').style.display='none'">
          <em id="close"></em><%--<img src="Images/cancel.png" style="border :0px"  width="18px" align="right" height="18px"/>--%></a></td></tr> 
          <tr><td style="padding-left:10px;padding-right:10px;padding-bottom:10px;">  
          <asp:Panel ID="Panel1" runat="server" Visible="true">
             <div class="addlist_content">
             <em class="em_waitlist">Add to Wish List</em>
             <div class="addlist_content_inner_bg">
               <div class="addlist_content_inner">
             <p><%--<asp:Label ID="Label4" runat="server" CssClass="lbl_prodavail" Text="  Sorry, this item is unavailable right now."></asp:Label>--%></p>
             <p>Add it to your Wish List and we can notify you if more items become available.</p>
              </div>
             <div class="addlist_to">
               <div class="addlist_img">
               <span><asp:Image ID="img_product" runat="server" width="70px" height="110px"></asp:Image></span>
               <p>
               <asp:Label ID="lbl_brandtype" runat="server" CssClass="lblbrand"></asp:Label></p>
               <p>
               <asp:Label ID="lbl_productnamee" runat="server" CssClass="lbltype"></asp:Label>
               </p>
               </div>
               <div class="addlist_item">
                    <p>Quantity : <asp:DropDownList ID="dd_waitlistquantity" CssClass="ddl_waitlist" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                    </p>
                   <%-- <p>Color : <asp:DropDownList ID="DropDownList3" CssClass="ddl_waitlist" runat="server"></asp:DropDownList></p>--%>
               </div>
            </div>
            <div class="addlist_btn">
                <asp:Button ID="btn_addtowaitlist" CssClass="btn_addList" runat="server" Text="Add to Wish List" onclick="btn_addtowaitlist_Click"></asp:Button>
            </div>
            <div class="addlist_btn">
                <asp:LinkButton ID="lnkbtn_continue" CssClass="lnkbtn_cont" runat="server" onclick="lnkbtn_continue_Click">Continue Shopping</asp:LinkButton>
            </div>
            </div>
           </div>
         </asp:Panel>
        </td></tr>          
     </table>     
     <div align="center" class=" headertext">
     <asp:Label ID="Label1" runat="server"  ></asp:Label></div>
      </div>
</div>
<div id="fade_addlist" class="black_overlay_addlist"></div>
<!------End here Add to Wait List----->
     <!----Start here Empty Add cart----->
<div id="emptywaitlist_light" class="white_emptywaitlist">
<div id="emptywaitlist_content">
    <table cellpadding="0" cellspacing="0" border="0" width="100%"><tr><td style="height:18px">
    <a href = "javascript:void(0)" onclick = "document.getElementById('emptywaitlist_light').style.display='none';document.getElementById('emptywaitlist_fade').style.display='none'">
    <em id="close"></em><%--<img src="Images/cancel.png" style="border :0px"  width="18px" align="right" height="18px"/>--%></a></td></tr> 
    <tr><td style="padding-left:10px;padding-right:0px;padding-bottom:10px;">  
    <div class="emptwaitlist_content">
        <em>Wish List Comfirmation</em>
        <div class="emptwaitlist_continue">
            <p>The item has been added to your 
            <asp:LinkButton ID="lnkbtn_waitlist" CssClass="lnkbtn_cont" runat="server" onclick="lnkbtn_waitlist_Click" >Wish List</asp:LinkButton> in your account.</p>
            <span><asp:LinkButton ID="lnkbtn_continueshopping" CssClass="lnkbtn_cont" runat="server" onclick="lnkbtn_continueshopping_Click">
            Continue Shopping</asp:LinkButton></span>
        </div>
    </div>
    </td></tr>           
</table>     
<div align="center" class=" headertextt">
<asp:Label ID="Label8" runat="server"  ></asp:Label></div>
</div>   
</div>  
<div id="emptywaitlist_fade" class="black_overlay_emptywaitlist"></div>
      <!----End here Empty Add cart----->      
      <!---Start here Guide Size Popup---->
 <div id="size_light" class="size_white sprite">
 <div id="size_guide">
    <div class="cancelpop"><a href="#" id="img_close">
    <em id="closepopup"></em></a></div>
    <table width="100%">
    <tr>
    <td style="padding-left:10px;padding-right:0px;padding-bottom:10px;">  
    <asp:Panel ID="pnl_Women_Top" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label4" runat="server" CssClass="lbl_size_wom" Text="Women's"></asp:Label>&nbsp;<asp:Label ID="Label5" runat="server" CssClass="lbl_size_prod" Text="Top"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label6" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label28" runat="server" Text="XS"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label7" runat="server" Text="S"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label9" runat="server" Text="M"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label10" runat="server" Text="L"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label194" runat="server" Text="XL"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label11" runat="server" Text="XXL"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label12" runat="server" Text="Shoulder(in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label15" runat="server" Text="14"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label16" runat="server" Text="14.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label195" runat="server" Text="15"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label29" runat="server" Text="15.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label13" runat="server" Text="16"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label14" runat="server" Text="16.5"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label17" runat="server" Text="Bust (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label18" runat="server" Text="32.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label19" runat="server" Text="34.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label20" runat="server" Text="36.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label21" runat="server" Text="38.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label30" runat="server" Text="40.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label196" runat="server" Text="43.5"></asp:Label></p>
    </div>
    <div class="left_size">
   <p class="p_sizeonprod"><asp:Label ID="Label22" runat="server" Text="Waist (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label23" runat="server" Text="24"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label24" runat="server" Text="26"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label25" runat="server" Text="28"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label26" runat="server" Text="30"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label31" runat="server" Text="32"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label197" runat="server" Text="35"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="imgbtn_tops" ImageUrl="~/Images/line sketch/top.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom sprite">
    <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label27" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Women_dress" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label222" runat="server" CssClass="lbl_size_wom" Text="Women's"></asp:Label>&nbsp;<asp:Label ID="Label223" runat="server" CssClass="lbl_size_prod" Text="Dress"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label224" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label225" runat="server" Text="XS"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label226" runat="server" Text="S"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label227" runat="server" Text="M"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label228" runat="server" Text="L"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label229" runat="server" Text="XL"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label230" runat="server" Text="XXL"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label231" runat="server" Text="Shoulder(in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label232" runat="server" Text="14"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label233" runat="server" Text="14.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label234" runat="server" Text="15"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label235" runat="server" Text="15.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label236" runat="server" Text="16"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label237" runat="server" Text="16.5"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label238" runat="server" Text="Bust (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label239" runat="server" Text="32.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label240" runat="server" Text="34.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label241" runat="server" Text="36.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label242" runat="server" Text="38.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label243" runat="server" Text="40.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label244" runat="server" Text="43.5"></asp:Label></p>
    </div>
    <div class="left_size">
   <p class="p_sizeonprod"><asp:Label ID="Label245" runat="server" Text="Waist (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label246" runat="server" Text="24"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label247" runat="server" Text="26"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label248" runat="server" Text="28"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label249" runat="server" Text="30"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label250" runat="server" Text="32"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label251" runat="server" Text="35"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="ImageButton6" ImageUrl="~/Images/line sketch/dress.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
     <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label252" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Women_bottom" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label32" runat="server" CssClass="lbl_size_wom" Text="Women's"></asp:Label>&nbsp;<asp:Label ID="Label33" runat="server" CssClass="lbl_size_prod" Text="Bootom"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label34" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label35" runat="server" Text="XS"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label36" runat="server" Text="S"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label37" runat="server" Text="M"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label38" runat="server" Text="L"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label39" runat="server" Text="XL"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label198" runat="server" Text="XXL"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label52" runat="server" Text="Waist (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label53" runat="server" Text="27.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label54" runat="server" Text="29.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label55" runat="server" Text="31.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label56" runat="server" Text="33.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label57" runat="server" Text="35.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label40" runat="server" Text="38.5"></asp:Label></p>
    </div>
    <div class="left_size">
   <p class="p_sizeonprod"><asp:Label ID="Label46" runat="server" Text="Hips (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label47" runat="server" Text="34.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label48" runat="server" Text="36.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label49" runat="server" Text="38.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label50" runat="server" Text="40.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label51" runat="server" Text="42.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label41" runat="server" Text="45.5"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="imgbtn_Womenbottom" ImageUrl="~/Images/line sketch/legging.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
     <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label58" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Women_Jumpsuit" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label111" runat="server" CssClass="lbl_size_wom" Text="Women's"></asp:Label>&nbsp;<asp:Label ID="Label154" runat="server" CssClass="lbl_size_prod" Text="Jumpsuit"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label155" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label156" runat="server" Text="XS"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label157" runat="server" Text="S"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label158" runat="server" Text="M"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label159" runat="server" Text="L"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label187" runat="server" Text="XL"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label188" runat="server" Text="XXL"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label189" runat="server" Text="Shoulder (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label190" runat="server" Text="24"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label191" runat="server" Text="26"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label192" runat="server" Text="28"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label204" runat="server" Text="30"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label205" runat="server" Text="32"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label206" runat="server" Text="34"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label207" runat="server" Text="Bust (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label208" runat="server" Text="29.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label209" runat="server" Text="31.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label210" runat="server" Text="33.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label211" runat="server" Text="35.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label212" runat="server" Text="37.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label213" runat="server" Text="39.5"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label215" runat="server" Text="Waist (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label216" runat="server" Text="23.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label217" runat="server" Text="35.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label218" runat="server" Text="37.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label219" runat="server" Text="39.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label220" runat="server" Text="41.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label221" runat="server" Text="43.5"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="ImageButton5" ImageUrl="~/Images/line sketch/jumpsuit.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
    <p class="footer_logo"><em></em></p>
    <p style="margin-left:160px;"><asp:Label ID="Label214" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label></p>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Women_Shoes" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label113" runat="server" CssClass="lbl_size_wom" Text="Women's"></asp:Label>&nbsp;<asp:Label ID="Label114" runat="server" CssClass="lbl_size_prod" Text="Footwear"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label115" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label116" runat="server" Text="36"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label117" runat="server" Text="37"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label118" runat="server" Text="38"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label119" runat="server" Text="39"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label120" runat="server" Text="40"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label42" runat="server" Text="41"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label133" runat="server" Text="Euro Size"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label134" runat="server" Text="36"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label135" runat="server" Text="37"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label136" runat="server" Text="38"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label137" runat="server" Text="39"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label138" runat="server" Text="40"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label45" runat="server" Text="41"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label121" runat="server" Text="IN/UK Size"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label122" runat="server" Text="3"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label123" runat="server" Text="4"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label124" runat="server" Text="5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label125" runat="server" Text="6"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label126" runat="server" Text="7"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label43" runat="server" Text="8"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label44" runat="server" Text="US Size"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label127" runat="server" Text="5.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label128" runat="server" Text="6.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label129" runat="server" Text="7.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label130" runat="server" Text="8.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label131" runat="server" Text="9.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label132" runat="server" Text="10.5"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="imgbtn_WomenShoe" ImageUrl="~/Images/line sketch/Womenfootwear.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
    <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label139" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Men_Shirt" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label59" runat="server" CssClass="lbl_size_wom" Text="Men's"></asp:Label>&nbsp;<asp:Label ID="Label60" runat="server" CssClass="lbl_size_prod" Text="Shirt"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label61" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label62" runat="server" Text="XS"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label63" runat="server" Text="S"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label64" runat="server" Text="M"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label65" runat="server" Text="L"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label66" runat="server" Text="XL"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label199" runat="server" Text="XXL"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label67" runat="server" Text="Shoulder(in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label68" runat="server" Text="16.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label69" runat="server" Text="17.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label70" runat="server" Text="18"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label71" runat="server" Text="19.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label72" runat="server" Text="20.5"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label200" runat="server" Text="20.5"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label79" runat="server" Text="Waist (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label80" runat="server" Text="35"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label81" runat="server" Text="37"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label82" runat="server" Text="39"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label83" runat="server" Text="41"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label84" runat="server" Text="43"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label201" runat="server" Text="45"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label73" runat="server" Text="Hips (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label74" runat="server" Text="39"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label75" runat="server" Text="41"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label76" runat="server" Text="43"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label77" runat="server" Text="45"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label78" runat="server" Text="47"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label202" runat="server" Text="49"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="imgbtn_Menshirts" ImageUrl="~/Images/line sketch/shirt.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
    <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label85" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Men_Tshirts" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label167" runat="server" CssClass="lbl_size_wom" Text="Men's"></asp:Label>&nbsp;<asp:Label ID="Label168" runat="server" CssClass="lbl_size_prod" Text="T-Shirt"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label169" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label171" runat="server" Text="S"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label172" runat="server" Text="M"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label173" runat="server" Text="L"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label174" runat="server" Text="XL"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label203" runat="server" Text="XXL"></asp:Label></p>
    </div>
    <div class="left_size">
   <p class="p_sizeonprod"><asp:Label ID="Label175" runat="server" Text="Chest (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label176" runat="server" Text="37"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label177" runat="server" Text="39"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label178" runat="server" Text="41"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label179" runat="server" Text="43"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label180" runat="server" Text="45"></asp:Label></p>
    </div>
    <div class="left_size">
   <p class="p_sizeonprod"><asp:Label ID="Label181" runat="server" Text="Length (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label182" runat="server" Text="26"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label183" runat="server" Text="27"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label184" runat="server" Text="28"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label185" runat="server" Text="29"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label186" runat="server" Text="30"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="imgbtn_tshirt" ImageUrl="~/Images/line sketch/t-shirts.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
    <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label193" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Men_Pant" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label86" runat="server" CssClass="lbl_size_wom" Text="Men's"></asp:Label>&nbsp;<asp:Label ID="Label87" runat="server" CssClass="lbl_size_prod" Text="Trouser/Chinos"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label88" runat="server" Text="Sizes as on Product"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label89" runat="server" Text="28"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label90" runat="server" Text="30"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label91" runat="server" Text="32"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label92" runat="server" Text="34"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label93" runat="server" Text="36"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label170" runat="server" Text="38"></asp:Label></p>
    </div>
    <div class="left_size">
   <p class="p_sizeonprod"><asp:Label ID="Label94" runat="server" Text="Waist (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label95" runat="server" Text="28"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label96" runat="server" Text="30"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label97" runat="server" Text="32"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label98" runat="server" Text="34"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label99" runat="server" Text="36"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label106" runat="server" Text="38"></asp:Label></p>
    </div>
    <div class="left_size">
   <p class="p_sizeonprod"><asp:Label ID="Label100" runat="server" Text="Length (in inches)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label101" runat="server" Text="45"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label102" runat="server" Text="45"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label103" runat="server" Text="45"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label104" runat="server" Text="45"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label105" runat="server" Text="45"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label107" runat="server" Text="45"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="imgbtn_trousersize" ImageUrl="~/Images/line sketch/MenTrouser.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
     <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label112" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_Men_Shoes" Visible="false" runat="server">
    <div class="size_top">
    <p class="p_head">MEGA&nbsp;<asp:Label ID="Label140" runat="server" CssClass="lbl_size_wom" Text="Men's"></asp:Label>&nbsp;<asp:Label ID="Label141" runat="server" CssClass="lbl_size_prod" Text="Footwear"></asp:Label></p>
    <div class="size_inner">
    <div class="left">
    <div class="left_size">
    <p class="p_sizeonprod"><b><asp:Label ID="Label142" runat="server" Text="Sizes in India/UK"></asp:Label></b></p>
    <p class="p_size p_none"><asp:Label ID="Label143" runat="server" Text="6"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label144" runat="server" Text="7"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label145" runat="server" Text="8"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label146" runat="server" Text="9"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label147" runat="server" Text="10"></asp:Label></p>
    <p class="p_size p_none"><asp:Label ID="Label108" runat="server" Text="11"></asp:Label></p>
    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label148" runat="server" Text="Sizes in Euro"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label149" runat="server" Text="40"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label150" runat="server" Text="41"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label151" runat="server" Text="42"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label152" runat="server" Text="43"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label153" runat="server" Text="44"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label110" runat="server" Text="45"></asp:Label></p>

    </div>
    <div class="left_size">
    <p class="p_sizeonprod"><asp:Label ID="Label160" runat="server" Text="Length (in cm)"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label161" runat="server" Text="25.4"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label162" runat="server" Text="25.7"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label163" runat="server" Text="26.0"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label164" runat="server" Text="26.7"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label165" runat="server" Text="27.3"></asp:Label></p>
    <p class="p_size"><asp:Label ID="Label109" runat="server" Text="27.9"></asp:Label></p>
    </div>
    </div>
    <div class="right">
    <asp:ImageButton ID="imgbtn_shoesize" ImageUrl="~/Images/line sketch/MenFootwear.jpg" runat="server"></asp:ImageButton>
    </div>
    <div class="size_bottom">
    <p class="footer_logo"><em></em></p>
    <asp:Label ID="Label166" runat="server" CssClass="lbl_sizecon" Text="All size conversions are approximate. Fits may vary by style or personal preference; foreign sizes may vary by manufacturer. All widths are in the standard (Medium/D) width."></asp:Label>
    </div>
    </div>
    </div>
    </asp:Panel>
    </td>
    </tr>           
</table>   
</div>  
<div align="center" class=" headertextt">
<asp:Label ID="Label3" runat="server"  ></asp:Label></div>
</div>
<div id="size_fade" class="size_black"></div> 
      <!---End here Guide Size--->
 <div style="clear:both"></div>
 <noscript></noscript>
</asp:Content>
