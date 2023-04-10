<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.controller.*"%>
<%@ page import="com.jacaranda.model.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			int stock = Integer.parseInt(request.getParameter("stock"));
			int price = Integer.parseInt(request.getParameter("price"));
			int idCategory = Integer.parseInt(request.getParameter("idCategory"));
			int idElement = Integer.parseInt(request.getParameter("idElement"));
			
			Category c = CategoryControl.getCategory(idCategory);			
			Element e = ElementControl.getElement(idElement);
			
			if(c != null && e != null){				
				e.setName(name);
				e.setDescription(description);
				e.setStock(stock);
				e.setPrice(price);
				e.setCat(c);
				ElementControl.updateElement(e);
				response.sendRedirect("allElements.jsp");
			}else{
				response.sendRedirect("error.jsp");
			}
		
		%>
	</body>
</html>