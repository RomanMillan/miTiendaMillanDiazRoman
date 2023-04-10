<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.jacaranda.controller.*"%>
<%@page import="com.jacaranda.model.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		String nameCategory = request.getParameter("nameCategory");
		String nameElement = request.getParameter("nameElement");
		String description = request.getParameter("description");
		int stock = Integer.parseInt(request.getParameter("stock"));
		int price = Integer.parseInt(request.getParameter("price"));

		
		Category c = CategoryControl.getCategory(nameCategory);
		
		/* Necesito comprobar que el nombre es unico */
		boolean validElement = ElementControl.isValid(nameElement);
		
		Element e = new Element();
		if(c != null && validElement){				
			e.setName(nameElement);
			e.setDescription(description);
			e.setStock(stock);
			e.setPrice(price);
			e.setCat(c);
			ElementControl.addElement(e);
			response.sendRedirect("allElements.jsp");
		}else{
			response.sendRedirect("error.jsp");
		}
		
		
		%>
	</body>
</html>