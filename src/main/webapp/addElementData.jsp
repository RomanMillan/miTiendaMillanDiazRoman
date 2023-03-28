<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jacaranda.model.Element" %>
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
		String nameBrand = request.getParameter("nameBrand");
		
		/* TENGO QUE OBTENER EL OJETO MARCA CON EL NOMBRE PARA
			DESPUES CREAR EL OBJETO elmenet y PODER GUARDARLO */
		
		
			
			
		/* TENGO QUE GUARDAR EL ID */
		//Element e = new Element(name,description,stock,price,);
	
	%>
</body>
</html>