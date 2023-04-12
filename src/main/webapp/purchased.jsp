<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<%
	
		HttpSession sesion = request.getSession();
		if(sesion.getAttribute("login") == null) {			
		request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	%>
		<!-- HEADER -->
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
			<div class="row">
				<h1 class="display-1">¡Enhorabuena!, compra realizada.</h1>
				<h3>Gracias, por realizar su compra</h3>
				
				<a href="categories.jsp" class="btn btn-secondary">Seguir Mirando</a>
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