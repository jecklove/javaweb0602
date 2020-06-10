<%@page import="org.jgs1905.service.UserService"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.jgs1905.entity.User"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册处理页面</title>
</head>
<body>
	
	<%
		User user = new User();
		BeanUtils.populate(user, request.getParameterMap());
		UserService userService = new UserService();
		int result = userService.regist(user);
		
		if (result == 1) {
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/user/login.jsp");
		} else {
			request.setAttribute("message", "注册失败，请重试！");
			request.setAttribute("user", user);
			request.getRequestDispatcher("/user/regist.jsp").forward(request, response);
		}
	%>
	
</body>
</html>