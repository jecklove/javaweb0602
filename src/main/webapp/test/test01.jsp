<%@page import="org.jgs1905.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>测试页面1</title>
</head>
<body>

	<h3>算术运算</h3>
	<p>${ 1+2 }</p>
	<p>${ 1>2 }</p>
	
	<hr>
	<h3>关系运算</h3>
	<p>${ 1 eq 2 }</p>
	<p>${ 1 gt 2 }</p>
	<p>${ 1 lt 2 }</p>
	<%-- <p>${ 1 ne 2 }</p> --%>
	<p>${ 1 ge 2 }</p>
	<p>${ 1 le 2 }</p>
	
	<hr>
	<h3>逻辑运算</h3>
	<p>${ 1>2 || 2>1 }</p>
	<p>${ 1 > 2 ? "1>2" : "2>1" }</p>
	
	<hr>
	<h3>获取域中数据</h3>
	<%
		pageContext.setAttribute("name", "tom1");
		request.setAttribute("name", "tom2");
		session.setAttribute("name", "tom3");
		application.setAttribute("name", "tom4");
	%>
	<!-- el表达式从四大作用域取值，按照作用域从小到大获取 -->
	<p>${ name }</p>
	<p>${ pageScope.name }</p>
	<p>${ requestScope.name }</p>
	<p>${ sessionScope.name }</p>
	<p>${ applicationScope.name }</p>
	
	<p>${ pageScope["name"] }</p>
	<p>${ requestScope["name"] }</p>
	<p>${ sessionScope["name"] }</p>
	<p>${ applicationScope["name"] }</p>
	
	<hr>
	<h3>获取对象属性和方法</h3>
	<%
		Student stu = new Student(1L, "tom", "女", (byte)18);
		pageContext.setAttribute("stu", stu);
	%>
	<p>${ stu }</p>
	<p>${ stu.name }</p>
	<p>${ stu["name"] }</p>
	<p>${ stu.study() }</p>
	
	<hr>
	<h3>获取cookie</h3>
	<%
		Cookie cookie1 = new Cookie("cookie1", "value1");
		//cookie1.setMaxAge(1000);
		response.addCookie(cookie1);
	%>
	<p>${ cookie.cookie1.value }</p>
	
	<hr>
	<h3>获取jsp内置对象</h3>
	<p>${ pageContext.request.contextPath }</p>
	
	<hr>
	<h3>获取请求参数</h3>
	<p>${ param.token }</p>
	<p>${ paramValues.hobby[0] }</p>

</body>
</html>