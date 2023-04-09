<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jacaranda.controller.*" %>
<%@ page import="com.jacaranda.model.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<link rel="stylesheet" href="css/style.css">
		
	</head>
	<body>
		
		
		<!-- HEADER -->
			<%
			if(session.getAttribute("login") == null || 
					request.getParameter("keyElement") == null || request.getParameter("keyElement").isBlank() || 
					request.getParameter("keyCategory") == null || request.getParameter("keyCategory").isBlank() || 
					!(boolean) session.getAttribute("administrator")){
				response.sendRedirect("error.jsp");
			}else{
				
				int idElement = Integer.parseInt(request.getParameter("keyElement"));
				Element e = ElementControl.getElement(idElement);
				
				int idCategory = Integer.parseInt(request.getParameter("keyCategory"));
				Category c = CategoryControl.getCategory(idCategory);
				
				if(c == null){
					request.getRequestDispatcher("/categories.jsp").forward(request, response);
				}
					
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
						<br>
						<div class="row">
							<div class="row">
								<div class="col-md-3">
									<a href="elements.jsp?key=<%=c.getId()%>" class="btn btn-secondary">Atrás</a>
								</div>
							</div>
							<div class="row">
								<h1 class="display-1"><%=c.getName()%> , <%=e.getName()%></h1>
							</div>
						</div>
					
						<br>
						
						<!-- form -->
						<div class="row">
							<form action="updateElementData.jsp" method="post">	
								<div class="form-group">
									<label>Nombre</label>
									<input class="form-control" type="text" name="name" required>
								</div>
								<div class="form-group">
									<label>Descripción</label>
									<input class="form-control" type="text" name="description" required>
								</div>
								<div class="form-group">
									<label>Stock</label>
									<input class="form-control" type="number" name="stock" required>
								</div>
								<div class="form-group">
									<label>Precio</label>
									<input class="form-control" type="number" name="price" required>
								</div>
								
								
								<input type="text" name="idCategory" hidden="true" value="<%=c.getId()%>">
								<input type="text" name="idElement" hidden="true" value="<%=e.getId()%>">
								<br>
								<button class="btn btn-primary" type="submit">Actualizar</button>
							</form>
						</div>
					
					
					</div>
		
		<%}%>
	<!-- END MAIN -->
	
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