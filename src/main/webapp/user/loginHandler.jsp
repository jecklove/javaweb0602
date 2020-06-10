<%@page import="java.net.URLEncoder"%>
<%@page import="org.jgs1905.service.UserService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="org.jgs1905.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录处理页</title>
</head>
<body>
	
	<%
		User user = new User();
		BeanUtils.populate(user, request.getParameterMap());
		UserService userService = new UserService();
		User result = userService.login(user);
		
		if (result != null) {
			// 将登录用户保存到session
			session.setAttribute("onlineUser", result);
			
			// 登录成功，判断是否保存cookie
			String rememberMe = request.getParameter("rememberMe");
			if ("rememberMe".equals(rememberMe)) {
				// 1.创建cookie对象
				Cookie usernameCookie = new Cookie("username", URLEncoder.encode(result.getUsername(), "utf-8"));
				Cookie passwordCookie = new Cookie("password", result.getPassword());
				Cookie rememberMeCookie = new Cookie("rememberMe", rememberMe);
				
				// 2.设置cookie的生存时间（单位：秒）
				usernameCookie.setMaxAge(60 * 60 * 24 * 7);
				passwordCookie.setMaxAge(60 * 60 * 24 * 7);
				rememberMeCookie.setMaxAge(60 * 60 * 24 * 7);
				
				// 3.使用response对象将cookie写回到浏览器
				response.addCookie(usernameCookie);
				response.addCookie(passwordCookie);
				response.addCookie(rememberMeCookie);
			} else {
				// 1.创建cookie对象
				Cookie usernameCookie = new Cookie("username", "");
				Cookie passwordCookie = new Cookie("password", "");
				Cookie rememberMeCookie = new Cookie("rememberMe", "");
				
				// 2.设置cookie的生存时间（单位：秒）
				usernameCookie.setMaxAge(0);
				passwordCookie.setMaxAge(0);
				rememberMeCookie.setMaxAge(0);
				
				// 3.使用response对象将cookie写回到浏览器
				response.addCookie(usernameCookie);
				response.addCookie(passwordCookie);
				response.addCookie(rememberMeCookie);
			}
			
			response.sendRedirect(request.getContextPath() + "/main.jsp");
		} else {
			session.setAttribute("message", "用户名或密码错误！");
			request.setAttribute("user", user);
			request.getRequestDispatcher("/user/login.jsp").forward(request, response);
		}
	%>
	
</body>
</html>