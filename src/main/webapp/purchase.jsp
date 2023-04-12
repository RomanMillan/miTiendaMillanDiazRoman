<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
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
		HttpSession sesion = request.getSession();
			
		if(sesion.getAttribute("login") == null) {			
				request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		%>
		<nav class="navbar navbar-light bg-light">
		  		<div class="col-md-3">
			  		<span class="navbar-brand mb-0 h1">Todo Coches</span>
		  		</div>
		  		<div class="col-md-6 welcome">
			  		<span class="navbar-brand mb-0 h1"><%=session.getAttribute("user")%></span>
		  		</div>
		  		<%	  		
		  			HashMap p = (HashMap) session.getAttribute("purchase");
		  		%>
		  		<div class="col-md-3 pruClose">
			  		<img alt="purchaseImg" src="img/purchase.png">
			  		<a href='purchase.jsp' class="btn btn-info a-closeSession"><%=p.size()%></a>
			  		<a href='index.jsp' class="btn btn-danger a-closeSession">Cerrar Sesión</a>
		  		</div>
			</nav>
			
	<!-- END HEADER -->
	
	<!-- MAIN -->
		<div class="container">
			<div class="row">			
				<h1 class="display-1">Carrito de la compra</h1>
				<h3 class="display-3">Factura previa</h3>
				<div class="col-sm-11">
					<a href="categories.jsp" class="btn btn-secondary">Atrás</a>
				</div>
			</div>
		
			<table class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Marca</th>
						<th scope="col">Modelo</th>
					    <th scope="col">Precio Und</th>
					    <th scope="col">Cantidad</th>
					    <th scope="col"></th>
					</tr>
				</thead>
				<%	
					int totalPrice = 0;
					for(Object clave:p.keySet()) {
						int aux = Integer.parseInt(clave.toString()); 
						Element e = ElementControl.getElement(aux);
				%>
					<tr>
						<td><%=e.getCat().getName()%></td>
						<td><%=e.getName()%></td>
						<td><%=e.getPrice()%></td>
						<td><%=p.get(aux)%></td>
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
					                        <p>Cantidad: <%=p.get(aux)%></p>
					                        <p>Precio Und: <%=e.getPrice()%></p>
					                    </div>
					                    <div class="modal-footer">
					                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
					                        <a href='deletePurchase.jsp?key=<%=p.get(aux)%>' class="btn btn-danger">Sí, Borrar</a>
					                    </div>
					                </div>
					            </div>
					        </div>
					        
						</td>
					</tr>		
						
				<%
					totalPrice += e.getPrice() * (int) p.get(aux);
					}%>		
			</table>
			<hr>
			<h4>Precio Total: <%=totalPrice%> €</h4>
			<a href="buyPurchase.jsp" class="btn btn-success">Comprar</a>
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