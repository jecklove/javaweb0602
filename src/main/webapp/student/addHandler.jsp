<%@page import="org.jgs1905.entity.Student"%>
<%@page import="org.jgs1905.service.StudentService"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加学生处理页</title>
</head>
<body>

	<%
		// 解决请求乱码
		// 注意：在request被使用之前设置编码
		request.setCharacterEncoding("utf-8");
	
		// request内置对象：获取请求携带的参数
		
		// 获取请求参数map映射
		Map<String, String[]> paraMap = request.getParameterMap();
		out.write(paraMap.toString());
		out.write("<hr>");
		
		// 获取某个参数的值
		String name = request.getParameter("name");
		out.write(name);
		out.write("<hr>");
		
		// 获取某个参数的多个值
		String[] hobby = request.getParameterValues("hobby");
		out.write(Arrays.toString(hobby));
		out.write("<hr>");
		
		// 实例：获取并保存学生数据
		String stuName = request.getParameter("name");
		String stuSex = request.getParameter("sex");
		String stuAge = request.getParameter("age");
		
		StudentService service = new StudentService();
		
		int result = service.add(Student.builder().name(stuName).sex(stuSex).age(Byte.valueOf(stuAge)).build());
		
		if (result == 1) {
			out.write("保存成功！");
			response.sendRedirect("list.jsp");
		} else {
			out.write("保存失败！");
			request.getRequestDispatcher("add.jsp?message=保存失败，稍后再试！").forward(request, response);
		}
	%>

</body>
</html>