<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.jacaranda.controller.*"%>
 <%@page import="com.jacaranda.model.*"%>
 <%@page import="com.jacaranda.model.User"%>
 <%@page import="java.util.List"%>
 <%@ page import="java.util.HashMap" %>
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
					<h1 class="display-1">Todas Mis Compras</h1>
					<div class="col-sm-10">
						<a href="categories.jsp" class="btn btn-secondary">Atrás</a>
					</div>
				</div>
				
				<br>
				<!-- list -->
				<div class="row">
					<table class="table table-striped">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Marca</th>
								<th scope="col">Modelo</th>
								<th scope="col">Precio (€)</th>
							    <th scope="col">Cantidad</th>
							    <th scope="col">
							    	<select class="orderList">
							    		<option>Fecha</option>
							    		<option value="orderNew.jsp">Reciente</option>
							    		<option value="orderOld.jsp">Antiguas</option>
							    	</select>
							    </th>
							</tr>
						</thead>
					<%	
						String user = (String)sesion.getAttribute("user");
						 List<Purchase> listPurchase = PurchaseControl.getPruchase(UserControl.getUser(user)); 
						
						for(Purchase pl: listPurchase){
						
					%>
					
					<tr>
							<td><%=pl.getElementObj().getCat().getName()%></td>
							<td><%=pl.getElementObj().getName()%></td>
							<td><%=pl.getPrice()%></td>
							<td><%=pl.getAmount()%></td>
							<td><%=pl.getPurchase_date()%></td>	
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
	
		<script src="js/app.js"></script>
		
	</body>
</html>