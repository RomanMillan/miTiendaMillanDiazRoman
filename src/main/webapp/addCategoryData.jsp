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
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			
			Category c = new Category();
			
			c.setName(name);
			c.setDescription(description);
			
			if(CategoryControl.isValid(name)){
				CategoryControl.addCategory(c);
				response.sendRedirect("categories.jsp");
			}else{
				response.sendRedirect("errorAddCategory.jsp");
			}
		}
		%>
	</body>
</html>