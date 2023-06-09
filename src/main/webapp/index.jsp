<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
		<link rel="stylesheet" href="css/style.css">
	</head>
	<body>
	<%session.invalidate(); %>
		<!-- HEADER -->
		<nav class="navbar navbar-light bg-light">
	  		<span class="navbar-brand mb-0 h1">Todo Coches</span>
		</nav>
		<!-- END HEADER -->
		
		<!-- MAIN -->		
		
		<div class="container">
			<div class="row">			
				<h1 class="display-1">Todo Coches</h1>
				<h3 class="display-3">Coches para todos los gustos</h3>
			</div>
			
			<!-- Do loging -->
			<div class="row">
				
				<div class="col" id="holi"> <!-- No me identifica el id Arreglar -->
					<br>
					<h3>In�cio</h3>
					<form action="validUser.jsp" method="post">		  
					  <div class="form-row">					    
					      <label for="validationServer01">Nombre</label>
					      <input type="text" name="username" class="form-control" id="validationCustom01" placeholder="Nombre de usuario" required>

					      <label for="validationServer02">contrase�a</label>
					      <input type="password" name="password" class="form-control" id="validationCustom01" placeholder="*******" required>
					    </div>
					    <br>					  
					  <button class="btn btn-primary" type="submit">Entrar</button>
					</form>
				</div>
				
				<div class="col">
					<h3>Registrase</h3>
					<form action="addUser.jsp" method="post">
					  <div class="form-row">				    
					      <label for="validationServer01">Nombre</label>
					      <input type="text" name="username" class="form-control" id="validationCustom01" placeholder="Manolo" required>				    			    
					      
					      <label for="validationServer02">contrase�a</label>
					      <input type="password" name="password" class="form-control" id="validationCustom01" placeholder="*******" required>
						  
						  <label for="validationServer02">Repetir contrase�a</label>
					      <input type="password" name="passwordRep" class="form-control" id="validationCustom01" placeholder="*******" required>
						  
						  <label for="validationServer02">Nombre real</label>
					      <input type="text" name="realName" class="form-control" id="validationCustom01" placeholder="Manuel" required>
						  
						  <label for="validationServer02">Apellidos</label>
					      <input type="text" name="surname" class="form-control" id="validationCustom01" placeholder="Sanchez Juli�n" required>
	
						 <label for="validationServer02">Sexo</label>
						 <br>
					     <select class="form-select" name="gender">
							<option>Femenino</option>
							<option>Masculino</option>
						</select>
							<br>
						  <label for="validationServer02">Fecha nacimiento</label>
					      <input type="date" name=birthday class="form-control" id="validationCustom01" required>
					  </div>
					  <br>
					  <button class="btn btn-primary" type="submit">Registrarse</button>
					</form>
				</div>
				
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