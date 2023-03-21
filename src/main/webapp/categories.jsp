<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.jacaranda.controller.*"%>
 <%@page import="com.jacaranda.model.*"%>
 <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>categorias</title>
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
			List<Category> category = CategoryControl.getCategory();
			for(Category i: category){
		%>
			<tr>
					<td><%=i.getName()%></td>
					<td><%=i.getDescription()%></td>
					<td><%=i.getElement()%></td>
					</form>
				</tr>
			<%
			}
			%>
		</table>		
		
	</body>
</html>