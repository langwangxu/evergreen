<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
    String context = request.getContextPath();
    request.setAttribute("context",context);
%>
<div style="float:left;clear:left;">
	<a href="<c:url value="/home/index"/>">首页</a>
</div>
<div style="float:right;clear:right;">
	<c:if test="${!empty USER_CONTEXT.userName}">
	   ${sessionUser.userName},欢迎您的到来,<a href="<c:url value="/login/doLogout.html"/>">注销</a>&nbsp;&nbsp;
	   <a href="<c:url value="/vs/index.html"/>">管理景区</a>
	</c:if>
	&nbsp;&nbsp;
	<c:if test="${empty USER_CONTEXT.userName}">
	   <a href="<c:url value="/login.jsp"/>">登录</a>&nbsp;&nbsp;
	</c:if>
</div>
<br/>
