<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jacaranda.controller.*" %>
<%@ page import="com.jacaranda.model.*" %>
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
			int idCategory = Integer.parseInt(request.getParameter("idCategory"));
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			
			
			Category c = CategoryControl.getCategory(idCategory);
			
			if(CategoryControl.isValid(name)){
				c.setName(name);
				c.setDescription(description);
				CategoryControl.updateCategory(c);
				response.sendRedirect("categories.jsp");
			}else{
				response.sendRedirect("error.jsp");
			}
		}
		%>
	</body>
</html>