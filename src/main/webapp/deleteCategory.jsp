<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jacaranda.model.*" %>
<%@ page import="com.jacaranda.controller.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			
		if(session.getAttribute("login") == null || 
		!(boolean) session.getAttribute("administrator")){
			response.sendRedirect("error.jsp");
		}else{
			int keyCategory  = Integer.parseInt(request.getParameter("keyCategory"));
			Category c = CategoryControl.getCategory(keyCategory);
			CategoryControl.deleteCategory(c);
			response.sendRedirect("categories.jsp");
		}
		%>
	</body>
</html>