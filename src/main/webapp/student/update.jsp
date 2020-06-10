<%@page import="org.jgs1905.entity.Student"%>
<%@page import="org.jgs1905.service.StudentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="bp" value="${ pageContext.request.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生页面</title>
<link href="${ bp }/static/css/main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%
		String idStr = request.getParameter("id");	
		Student result = null;
		if (idStr != null && !idStr.trim().equals("")) {
			StudentService service = new StudentService();
			result = service.findById(Long.valueOf(idStr));
		}
		pageContext.setAttribute("result", result);
	%>
	<div id="pageContent">
		<form action="${ bp }/student/updateHandler.jsp" method="post">
			<p><input type="hidden" name="id" value="${ result.id }"></p>
			<p>姓名：<input type="text" name="name" value="${ result.name }"></p>
			<p>性别：<input type="text" name="sex"  value="${ result.sex }"></p>
			<p>年龄：<input type="number" name="age" value="${ result.age }"></p>
			
			<p><input type="submit" value="保存"></p>
		</form>
	</div>
</body>
</html>