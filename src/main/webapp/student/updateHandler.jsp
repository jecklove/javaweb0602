<%@page import="org.jgs1905.entity.Student"%>
<%@page import="org.jgs1905.service.StudentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改学生处理页面</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String stuId = request.getParameter("id");
		String stuName = request.getParameter("name");
		String stuSex = request.getParameter("sex");
		String stuAge = request.getParameter("age");

		StudentService service = new StudentService();

		Student student = new Student(Long.valueOf(stuId), stuName, stuSex, Byte.valueOf(stuAge));

		int result = service.update(student);

		response.sendRedirect("list.jsp");
	%>

</body>
</html>