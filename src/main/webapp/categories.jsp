<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.jacaranda.controller.CategoryControl"%>
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