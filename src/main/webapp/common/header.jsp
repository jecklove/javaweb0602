<%@page import="org.jgs1905.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="bp" value="${ pageContext.request.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公共头部代码</title>
<style type="text/css">
	#header {
		width: 800px;
		height: 60px;
		border: 1px solid green;
		margin: 0 auto;
		padding: 0 50px;
		box-sizing: border-box;
		position: relative;
		
		font-size: 30px;
		line-height: 60px;
	}
	
	#logoutBtn {
		position: absolute;
		right: 50px;
	}
	
</style>
</head>
<body>

	<%
		User onlineUser = (User)session.getAttribute("onlineUser");
		// 登录判断
		if (onlineUser == null) {
			session.setAttribute("message", "请登陆后再访问！");
			response.sendRedirect(request.getContextPath() + "/user/login.jsp");
			return;
		}
	%>
	
	<div id="header">
		<span>${ sessionScope.onlineUser.real_name }，欢迎您！</span>
		<span id="logoutBtn"><a href="${ pageContext.request.contextPath }/user/logoutHandler.jsp">退出登录</a></span>
	</div>

</body>
</html>