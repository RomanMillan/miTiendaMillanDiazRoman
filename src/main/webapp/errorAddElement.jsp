<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Error agregar modelo</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<link rel="stylesheet" href="css/style.css">
	</head>
		<body>
		<!-- HEADER -->
		<%
		
		if(session.getAttribute("login") == null){
			response.sendRedirect("error.jsp");
		}else{
		%>
		<nav class="navbar navbar-light bg-light">
	  		<span class="navbar-brand mb-0 h1">Todo Coches</span>
		</nav>
		<!-- END HEADER -->
		
		<!-- MAIN -->		
		<%
			String id = request.getParameter("key");
		%>
		
		<div class="container">
			<div class="row">
				<h1 class="display-1">Ohh, ha ocurrido un error</h1>
				<h3>El modelo que est� intentando insertar no es v�lido</h3>
				
				<%
				if(id!=null){
				%>
					<a href="addElement.jsp?key=<%=id%>" class="btn btn-secondary">Atr�s</a>
				<%}else{ %>
					<a href="addAllElement.jsp" class="btn btn-secondary">Atr�s</a>
				<%} %>
				
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
	    <%} %>
	</body>
</html>