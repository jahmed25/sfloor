<%@ Page Title="" Language="C#"  CodeFile="Error500.aspx.cs" Inherits="sfloor_pages_Error500" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <%=Header %>
</head>
<body class=" cms-index-index cms-home">
    <div>
        <noscript>
            <div class="global-site-notice noscript">
                <div class="notice-inner">
                    <p>
                        <strong>JavaScript seems to be disabled in your browser.</strong><br />
                        You must have JavaScript enabled in your browser to utilize the functionality of
                        this website.
                    </p>
                </div>
            </div>
        </noscript>
        <div class="page">
            <%=Header %>
           <h1 style='color'>Opps !! Internal Server Error.</h1>
            <h4 style='color'>This site is under construction, our team will review the error and will provide the solutio ASAP</h4>
            <h4 style='color'>Thank You!!</h4>
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