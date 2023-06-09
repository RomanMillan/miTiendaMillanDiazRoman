<%@page import="com.jacaranda.controller.ElementControl"%>
<%@page import="com.jacaranda.model.Element"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
 <%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UFT-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<link rel="stylesheet" href="css/style.css">
		<title>Todos los modelos</title>
	</head>
	<body>
		<!-- HEADER -->
			<%
				/* compruebo que está logeado */
				HttpSession sesion = request.getSession();
				if(sesion.getAttribute("login") == null) {			
				request.getRequestDispatcher("/error.jsp").forward(request, response);
				}

				/* miro si es admin  */
				boolean admin = (boolean) session.getAttribute("administrator");
				
			%>
			<nav class="navbar navbar-light bg-light">
		  		<div class="col-md-3">
			  		<span class="navbar-brand mb-0 h1">Todo Coches</span>
		  		</div>
		  		<div class="col-md-6 welcome">
			  		<span class="navbar-brand mb-0 h1"><%=sesion.getAttribute("user")%></span>
		  		</div>
		  		<%	  		
		  			HashMap purchase = (HashMap) sesion.getAttribute("purchase");
		  		%>
		  		<div class="col-md-3 pruClose">
			  		<img alt="purchaseImg" src="img/purchase.png">
			  		<a href='purchase.jsp' class="btn btn-info a-closeSession"><%=purchase.size()%></a>
			  		<a href='index.jsp' class="btn btn-danger a-closeSession">Cerrar Sesión</a>
		  		</div>
			</nav>
	<!-- END HEADER -->
	
		<!-- MAIN -->
			
			<div class="container">
				<!-- second header -->
				<div class="row">
					<h1 class="display-1"> Todos Los Modelos</h1>
					<div class="col-sm-11">
						<a href="categories.jsp" class="btn btn-secondary">Atrás</a>
					</div>
					
					<%
						if(admin){
					%>
						<div class="col">
							<a href="addAllElement.jsp" class="btn btn-dark">Añadir</a>
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
							    <th scope="col">Descripción</th>
							    <th scope="col">Precio</th>
							    <th scope="col">Disponibles</th>
							    <th scope="col">Cantidad</th>
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
							<form action="addPurchase.jsp" method="post">
								<td>
									<input type="number" name="amount" min="1" max="<%=e.getStock()%>" required>
									<input type="text" name="key" value="<%=e.getId()%>"  hidden="true">
								</td>
								<td>
									<button type="submit" class="btn btn-success">Lo Quiero</button>
									<%-- <a href='addPurchase.jsp?key=<%=e.getId()%>' class="btn btn-success">Lo Quiero</a> --%>
								</td>
							</form>
							<%
								if(admin){
							%>
								<td>
									<a href='updateAllElement.jsp?keyElement=<%=e.getId()%>' class="btn btn-warning">Editar</a>
								</td>
								<td>						
									
									<!-- borrar  categoria-->
									<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#<%=e.getName()%>" data-bs-whatever="@h">Borrar</button>
			
							        <!-- modal oculto -->
							        <div class="modal fade" id="<%=e.getName()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							            <div class="modal-dialog">
							                <div class="modal-content">
							                    <div class="modal-header">
							                        <h5 class="modal-title" id="exampleModalLabel"> ¿Seguro que deseas borrar el modelo <%=e.getName()%>?</h5>
							                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							                    </div>
							                    <div>
							                        <p>Nombre: <%=e.getName()%></p>
							                        <p>Descripción: <%=e.getDescription()%></p>
							                        <p>Stock: <%=e.getStock()%></p>
							                        <p>Precio: <%=e.getPrice()%></p>
							                    </div>
							                    <div class="modal-footer">
							                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
							                        <a href='deleteAllElement.jsp?keyElement=<%=e.getId()%>' class="btn btn-danger">Sí, Borrar</a>
							                    </div>
							                </div>
							            </div>
							        </div>
									
								</td>
							<%} %>
					</tr>
					<%}%>
					</table>		
				</div>
			</div>	
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