<%@page import="org.jgs1905.service.StudentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除处理页面</title>
</head>
<body>
	<%
		String idStr = request.getParameter("id");	
	
		if (idStr != null && !idStr.trim().equals("")) {
			StudentService service = new StudentService();
			int result = service.deleteById(Long.valueOf(idStr));
			/* if (result == 1) {
				out.write("删除成功！");
			} else {
				out.write("删除失败！");
			} */
			response.sendRedirect("list.jsp");
		}
	
		
	%>
</body>
</html>