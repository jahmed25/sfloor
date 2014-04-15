<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<c:forEach items="${pages}" var="page">
<P>  Id = ${page.id}. </P>
<P>  Name = ${page.pageName}. </P>
<P>  Act Name = ${page.actPageName}. </P>
<P>  Description = ${page.desc}. </P>
</c:forEach>
</body>
</html>
