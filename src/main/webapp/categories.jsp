<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.jacaranda.controller.*"%>
 <%@page import="com.jacaranda.model.Category"%>
 <%@page import="com.jacaranda.model.User"%>
 <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<link rel="stylesheet" href="css/style.css">
		<title>categorias</title>
	</head>
	<body>
	<!-- HEADER -->
		<%  
		HttpSession sesion = request.getSession();
			
		if(sesion.getAttribute("login") == null) {			
				request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		
		boolean isAdmin = (boolean) sesion.getAttribute("administrator");

		%>
		<nav class="navbar navbar-light bg-light">
	  		<span class="navbar-brand mb-0 h1">Todo Coches</span>
	  		<span class="navbar-brand mb-0 h1">Hola, <%=session.getAttribute("user") + "  👋"%></span>
	  		<a href='index.jsp' class="btn btn-danger a-closeSession">Cerrar Sesión</a>
	  		
		</nav>
			
	<!-- END HEADER -->
	
	<!-- MAIN -->
		<div class="container">
			<div class="row">			
				<h1 class="display-1">Todas Nuestras Marcas</h1>
				<h3 class="display-3">Marcas con personalidad</h3>
			</div>
			
			<div class="row">
				<div class="col">
					<a href="allElements.jsp" class="btn btn-primary">Ver todos los modelos</a>
				</div>
				<%
					
					if(isAdmin){
				
				%>
					<!-- añadir categoria -->
					<div class="col">
						<a href="addCategory.jsp" class="btn btn-primary">Añadir Marca</a>
					</div>
				
				<%} %>
			</div>
			
			<div class="row">
			<%
				List<Category> category = CategoryControl.getCategory();
				for(Category i: category){
			 %>
					<div class="card" style="width: 18rem;">
					  <img class="card-img-top" src="img/marcas.jpg" alt="Imagen marca">
					  <div class="card-body">		
					    <h5 class="card-title"><%=i.getName()%></h5>
					    <p class="card-text"><%=i.getDescription()%></p>
					    <a href='elements.jsp?key=<%=i.getId()%>' class="btn btn-primary">Modelos</a>
					    
					    <%
					
							if(isAdmin){
						
						%>
							<!-- actualizar categoria -->
							<a href='updateCategory.jsp?keyCategory=<%=i.getId()%>' class="btn btn-warning">Editar</a> 
							
							<!-- borrar  categoria-->
							<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#<%=i.getName()%>" data-bs-whatever="@h">Borrar</button>
	
					        <!-- modal oculto -->
					        <div class="modal fade" id="<%=i.getName()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					            <div class="modal-dialog">
					                <div class="modal-content">
					                    <div class="modal-header">
					                        <h5 class="modal-title" id="exampleModalLabel"> ¿Seguro que deseas borrar la marca <%=i.getName()%>?</h5>
					                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                    </div>
					                    <div>
					                        <p>Nombre: <%=i.getName()%></p>
					                        <p>Descripción: <%=i.getDescription()%></p>
					                    </div>
					                    <div class="modal-footer">
					                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					                        <a href='deleteCategory.jsp?keyCategory=<%=i.getId()%>' class="btn btn-danger">Sí, Borrar</a>
					                    </div>
					                </div>
					            </div>
					        </div>
						
						<%} %>
					    
					  </div>
					</div>
				<%}%>			
			</div>
		</div>
		<!-- FOOTER -->
		     <footer class="bg-light text-center text-lg-start">
			 	<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
			    	© 2023 Copyright: TodoCoches.com
			  	</div>
			</footer>
	    <!-- END FOOTER -->
			
			
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	</body>
</html>