<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Maven Demo</title>
</head>
<body>
<h1></h1>
<h2>welcome , my ${yep} }</h2>
<h3><a href="<c:url value="/dao?id=1"/>">Dao正常错误</a></h3>
<h3><a href="<c:url value="/dao?id=10"/>">Dao参数错误</a></h3>
<h3><a href="<c:url value="/dao?id="/>">Dao未知错误</a></h3>
<br />
<h3><a href="<c:url value="/service?id=1"/>">Service正常错误</a></h3>
<h3><a href="<c:url value="/service?id=10"/>">Service参数错误</a></h3>
<h3><a href="<c:url value="/service?id="/>">Service未知错误</a></h3>
<br />
<h3><a href="<c:url value="/controller?id=1"/>">Controller正常错误</a></h3>
<h3><a href="<c:url value="/controller?id=10"/>">Controller参数错误</a></h3>
<h3><a href="<c:url value="/controller?id="/>">Controller未知错误</a></h3>
<br />
<h3><a href="<c:url value="/404?id=1"/>">404错误</a></h3>
</body>
</html>
