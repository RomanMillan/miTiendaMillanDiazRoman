<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jacaranda.model.*" %>
<%@ page import="com.jacaranda.controller.ElementControl" %>
 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		</head>
	<body>
		<%
			int idElement = Integer.parseInt(request.getParameter("key"));
			Element e = ElementControl.getElement(idElement);
			
			Category category = e.getCat();
			int categoryId  = category.getId();
			
			ElementControl.deleteElement(e);
			String path = "elements.jsp?key=" + categoryId;
			response.sendRedirect(path);
			
		%>
	</body>
</html>