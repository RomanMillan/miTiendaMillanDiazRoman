<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.jacaranda.controller.*" %>
   <%@ page import="com.jacaranda.model.*" %>
   <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>modelos coches</title>
	</head>
	<body>
		
		<table align='center'>
			<thead>
				<tr>
					<td>Nombre</td>
					<td>Descripción</td>
					<td>Lista</td>
				</tr>
			</thead>
		<%
		
			int id = Integer.parseInt(request.getParameter("key"));
			
			
			Category category = CategoryControl.getCategory(id);
			List<Element> elementList = category.getElement();
			
			for(Element e : elementList){
		%>
		
		<tr>
				<td><%=e.getName()%></td>
				<td><%=e.getDescription()%></td>
				<td><%=e.getPrice()%></td>
				<td><%=e.getStock()%></td>
		</tr>
		<%
			}
		%>
		</table>		
			
	</body>
</html>