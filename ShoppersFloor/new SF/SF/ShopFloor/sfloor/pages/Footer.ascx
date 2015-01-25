<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Footer" %>

<!-- footer_top -->
<div style="height:30px;clear:both"></div>
<div class="footer_top">
 <div class="container">
	<div class="span_of_4">
		<div class="span1_of_4">
			<h4>Shop</h4>
			<ul class="f_nav">
				<li><a href="#">new arrivals</a></li>
				<li><a href="#">men</a></li>
				<li><a href="#">women</a></li>
				<li><a href="#">accessories</a></li>
				<li><a href="#">kids</a></li>
				<li><a href="#">brands</a></li>
				<li><a href="#">trends</a></li>
				<li><a href="#">sale</a></li>
				<li><a href="#">style videos</a></li>
			</ul>	
		</div>
		<div class="span1_of_4">
			<h4>Policies</h4>
			<ul class="f_nav">
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx#ordering">Ordering</a></li>
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx#payments">Payments</a></li>
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx#shipping-and-tracking">Shipping And Tracking</a></li>
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx#cancellations-and-Returns">Cancellations And Returns</a></li>
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx#credit">Credit</a></li>
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx#gift-wrapping">Gift Wrapping</a></li>
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/faqs.aspx#self-pickup">Self Pickup</a></li>
            <li><a href="<%=ConfigUtil.hostURL() %>sfloor/pages/privacy_policy.aspx">Privacy Policy</a></li>
    	</ul>	
		</div>
		<div class="span1_of_4">
			<h4>account</h4>
			<ul class="f_nav">
				<li><a href="#">login</a></li>
				<li><a href="#">create an account</a></li>
				<li><a href="#">create wishlist</a></li>
				<li><a href="#">my shopping bag</a></li>
				<li><a href="#">brands</a></li>
				<li><a href="#">create wishlist</a></li>
			</ul>
		</div>
		<div class="span1_of_4">
			<h4>Newsletter</h4>
			<div class="input-box">
             <input name="email" size=40 id="newsletter" title="Sign up for our newsletter" onfocus="if(this.value == 'yourname@example.com') { this.value = ''; }"
                    onblur="this.value=!this.value?'yourname@example.com':this.value;" value="yourname@example.com"
                    class="input-text required-entry validate-email" type="text">
            </div>
            <div class="actions">
                <button type="submit" title="Submit" class="button">
                    <span><span>Submit</span></span></button>
            </div>		
		</div>
		<div class="clearfix"></div>
		</div>
		<!-- start span_of_2 -->
		<div class="span_of_2">
		<div class="span1_of_2">
			<h5>need help? <a href="#">contact us <span> ></span> </a> </h5>
			<p>(or) Call us: +91-9876543210</p>
		</div>
		<div class="span1_of_2">
			<h5>follow us </h5>
			<div class="social-icons">
				     <ul>
				        <li><a href="#" target="_blank"></a></li>
				        <li><a href="#" target="_blank"></a></li>
				   <%--     <li><a href="#" target="_blank"></a></li>
				        <li><a href="#" target="_blank"></a></li>
				        <li><a href="#" target="_blank"></a></li>--%>
					</ul>
			</div>
		</div>
		<div class="clearfix"></div>
		</div>
                         <div style="display: none;" id="back-top" class="hidden-phone"><a href="#" rel="tooltip" title="Top"></a>	</div>
      
 </div>
</div>
<!-- footer -->
<div class="footer">
 <div class="container">
	<div class="copy">
		<address class="link"> &copy; 2014 shoppersfloor.com | All Rights Reserved.| Design & Developer by&nbsp; <a href="#go3">Go3 & Kunal</a></address>
	</div>
 </div>
</div>
