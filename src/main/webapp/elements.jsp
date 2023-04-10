<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.jacaranda.controller.*" %>
   <%@ page import="com.jacaranda.model.*" %>
   <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
				<link rel="stylesheet" href="css/style.css">
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<title>modelos coches</title>
	</head>
	<body>
	<!-- HEADER -->
			<%
				/* compruebo que está logeado  y que no pasa valores nulos o vacios*/
				
				if(session.getAttribute("login") == null || request.getParameter("key") == null || request.getParameter("key").isBlank() ){
					response.sendRedirect("error.jsp");
				}else{
					
					Boolean valid = (Boolean) session.getAttribute("login");
								
					int id = Integer.parseInt(request.getParameter("key"));
					
					Category category = CategoryControl.getCategory(id);
					
					//TODO: TENGO QUE PONER EL ELSE (DISPACHER / SENDREDIRECT )
					/* compruebo que es un objeto valido */ 
					if(category == null){
						request.getRequestDispatcher("/categories.jsp").forward(request, response);
					}
					
					/* miro si es admin  */
					boolean admin = (boolean) session.getAttribute("administrator");
				
			%>
			<nav class="navbar navbar-light bg-light">
		  		<span class="navbar-brand mb-0 h1">Todo Coches</span>
		  		<span class="navbar-brand mb-0 h1"><%=session.getAttribute("user")%></span>
		  		<a href='index.jsp' class="btn btn-danger a-closeSession">Cerrar Sesión</a>
			</nav>
			<!-- END HEADER -->
		
			<!-- MAIN -->
				
				<div class="container">
					<!-- second header -->
					<div class="row">
						<% String categoryName = category.getName(); %>
						<h1 class="display-1">Modelos <%=categoryName %></h1>
						<div class="col-sm-10">
							<a href="categories.jsp" class="btn btn-secondary">Atrás</a>
						</div>
						<%
							if(admin){
						%>
								<div class="col">
									<a href="addElement.jsp?key=<%=category.getId()%>" class="btn btn-dark">Añadir</a>
								</div>
						<%
							}
						%>
					</div>
					
					<br>
					<!-- list -->
					<%
					
						List<Element> elementList = category.getElement();
						
						if(elementList != null){
					%>
					
					
					<div class="row">
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
							
							for(Element e : elementList){
						%>
						
						<tr>
								<td><%=categoryName%></td>
								<td><%=e.getName()%></td>
								<td><%=e.getDescription()%></td>
								<td><%=e.getPrice()%></td>
								<td><%=e.getStock()%></td>
								<%
									if(admin){
								%>
									<td>						
										 <a href='updateElement.jsp?keyCategory=<%=category.getId()%>&keyElement=<%=e.getId()%>' class="btn btn-warning">Editar</a> 
									</td>
									<td>
										<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#<%=e.getName()%>" data-bs-whatever="@h">Borrar</button>
	
								        <!-- modal oculto -->
								        <div class="modal fade" id="<%=e.getName()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								            <div class="modal-dialog">
								                <div class="modal-content">
								                    <div class="modal-header">
								                        <h5 class="modal-title" id="exampleModalLabel"> ¿Seguro que deseas borrar el modelo <%=e.getName()%>?</h5>
								                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								                    </div>
								                    <div class="modal-footer">
								                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
								                        <a href='deleteElement.jsp?key=<%=e.getId()%>' class="btn btn-danger">Sí, Borrar</a>
								                    </div>
								                </div>
								            </div>
								        </div>
									
									</td>
								<%} %>
						</tr>
					<%
						}
					%>
					</table>		
				</div>
				
				<%
				}else{
					%>
						<h1>Nada por aquí :(</h1>
						<h3>¡Agrege algún modelo!</h3>
					<%
					
				}
				%>
			</div>	
			<!-- END MAIN -->
			
		<!-- FOOTER -->
		     <footer class="bg-light text-center text-lg-start">
			 	<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
			    	© 2023 Copyright: TodoCoches.com
			  	</div>
			</footer>
	    <!-- END FOOTER -->
			<%} %>
			<script src="js/app.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	</body>
</html>