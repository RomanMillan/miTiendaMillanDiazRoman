<%@page import="com.jacaranda.controller.ElementControl"%>
<%@page import="com.jacaranda.model.Element"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<link rel="stylesheet" href="css/style.css">
		<title>Todos los modelos</title>
	</head>
	<body>
		<!-- HEADER -->
			<%
				/* compruebo que est� logeado */
				boolean isValid = (boolean) session.getAttribute("login");
				if(!isValid){
					request.getRequestDispatcher("/error.jsp").forward(request, response);
				}

				/* miro si es admin  */
				boolean admin = (boolean) session.getAttribute("administrator");
				
			%>
		<nav class="navbar navbar-light bg-light">
	  		<span class="navbar-brand mb-0 h1">Todo Coches</span>
	  		<span class="navbar-brand mb-0 h1"><%=session.getAttribute("user")%></span>
	  		<a href='index.jsp' class="btn btn-danger a-closeSession">Cerrar Sesi�n</a>
		</nav>
	<!-- END HEADER -->
	
		<!-- MAIN -->
			
			<div class="container">
				<!-- second header -->
				<div class="row">
					<h1 class="display-1"> Todos Los Modelos</h1>
					<div class="col-md-3">
						<form action="categories.jsp" method="get">
							<button class="btn btn-secondary">Atr�s</button>
						</form>
					</div>
					
					<%
						if(admin){
					%>
						<div class="col">
							<a href="addAllElement.jsp" class="btn btn-primary">A�adir</a>
						</div>
					<%} %>
					
				</div>
				
				<br>
				<!-- list -->
				<div class="row">
					<table class="table table-striped">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Modelo</th>
								<th scope="col">Nombre</th>
							    <th scope="col">Descripci�n</th>
							    <th scope="col">Precio</th>
							    <th scope="col">Disponibles</th>
							</tr>
						</thead>
					<%	
						List<Element> elementList = ElementControl.getAllElements();
						
						for(Element e : elementList){
					%>
					
					<tr>
							<td><%=e.getCat().getName()%></td>
							<td><%=e.getName()%></td>
							<td><%=e.getDescription()%></td>
							<td><%=e.getPrice()%></td>
							<td><%=e.getStock()%></td>
							<%
								if(admin){
							%>
								<td>
									<a href='updateAllElement.jsp?keyElement<%=e.getId()%>' class="btn btn-warning">Editar</a>
								</td>
								<td>
									<a href='#' class="btn btn-danger">Borrar</a>
								</td>
							<%} %>
					</tr>
					<%
						}
					%>
					</table>		
				</div>
			</div>	
			<!-- END MAIN -->
			
		<!-- FOOTER -->
		     <footer class="bg-light text-center text-lg-start">
			 	<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
			    	� 2023 Copyright: TodoCoches.com
			  	</div>
			</footer>
	    <!-- END FOOTER -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	
	</body>
</html>