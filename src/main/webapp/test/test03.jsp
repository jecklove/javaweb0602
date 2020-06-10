<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>测试页面3</title>
</head>
<body>
	
	<fmt:formatNumber type="number" value="${ 10.0 / 3 }" pattern="#.00" />
	
	<fmt:formatNumber type="number" value="${ 10.0 / 2 }" pattern="#.00" />
	
	<hr>
	
	<%
		Date now = new Date();
		pageContext.setAttribute("now", now);
	%>
	<fmt:formatDate value="${ now }" pattern="yyyy-MM-dd HH:mm:ss.SSS"/>
	
	<fmt:formatDate value="${ now }" pattern="yyyy年MM月dd日"/>

</body>
</html>