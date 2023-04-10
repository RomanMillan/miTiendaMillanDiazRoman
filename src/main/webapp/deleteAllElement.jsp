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
		
			int keyElement = Integer.parseInt(request.getParameter("keyElement"));
			Element e = ElementControl.getElement(keyElement);
			ElementControl.deleteElement(e);
			response.sendRedirect("allElements.jsp");
		
		%>
	</body>
</html>