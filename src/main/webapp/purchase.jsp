<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		HashMap p = (HashMap)  session.getAttribute("purchase");
		
	%>
	
		<table class="table table-striped">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Modelo</th>
								<th scope="col">Nombre</th>
							    <th scope="col">Descripción</th>
							    <th scope="col">Precio</th>
							    <th scope="col">Disponibles</th>
							</tr>
						</thead>
					<%	
						
					%>
					
					<tr>
			
						
						</table>
	
</body>
</html>