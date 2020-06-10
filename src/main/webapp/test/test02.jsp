<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="bp" value="${ pageContext.request.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>测试页面2</title>
</head>
<body>

	<h3>jstl核心标签库</h3>

	<!-- 判断标签 -->
	<c:if test="${ 1 eq 1 }">
		hello jstl
	</c:if>
	
	<hr>
	
	<!-- 循环标签 -->
	<!-- 遍历数字区间 -->
	<c:forEach begin="1" end="10" step="2" var="i" varStatus="vs">
		${ i }--${ vs.count }--${ vs.current }<br>
	</c:forEach>
	
	<hr>
	
	<!-- 遍历集合对象 -->
	<%
		List<String> list = new ArrayList<>();
		list.add("tom");
		list.add("lucy");
		list.add("lili");
		pageContext.setAttribute("names", list);
		
		pageContext.setAttribute("list1", null);
		pageContext.setAttribute("list2", new ArrayList<>());
	%>
	<c:forEach items="${ names }" var="name" varStatus="vs">
		${ vs.count }--${ name }<br>
	</c:forEach>
	
	<p>${ empty names }</p>
	<p>${ empty list1 }</p>
	<p>${ empty list2 }</p>
	
	<hr>
	<!-- 向域中设置数据 -->
	<c:set var="var1" value="value1" scope="session" />
	<p>${ sessionScope.var1 }</p>
	
	<hr>
	<!-- choose判断 -->
	<c:set var="week" value="3"  />
	<c:choose>
		<c:when test="${ week == 1 }">
			周一睡觉
		</c:when>
		<c:when test="${ week == 2 }">
			周二打游戏
		</c:when>
		<c:otherwise>
			周三到周末敲代码
		</c:otherwise>
	</c:choose>

</body>
</html>