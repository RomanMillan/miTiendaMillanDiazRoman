<%@page import="com.jacaranda.controller.ElementControl"%>
<%@page import="com.jacaranda.controller.CategoryControl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.model.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			int stock = Integer.parseInt(request.getParameter("stock"));
			int price = Integer.parseInt(request.getParameter("price"));
			int idCategory = Integer.parseInt(request.getParameter("idCategory"));
			
			Category c = CategoryControl.getCategory(idCategory);
			
			/* Necesito comprobar que el nombre es unico */
			boolean validElement = ElementControl.isValid(name);
			
			Element e = new Element();
			if(c != null && validElement){				
				e.setName(name);
				e.setDescription(description);
				e.setStock(stock);
				e.setPrice(price);
				e.setCat(c);
				ElementControl.addElement(e);
				String path = "elements.jsp?key=" + idCategory;
				response.sendRedirect(path);
			}else{
				String path = "errorAddElement.jsp?key=" + idCategory;
				response.sendRedirect(path);
			}
		
		%>
		
	</body>
</html>