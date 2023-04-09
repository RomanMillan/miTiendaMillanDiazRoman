<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jacaranda.model.*" %>
<%@ page import="com.jacaranda.controller.*" %>
<%@ page import="org.apache.commons.codec.digest.DigestUtils" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>add user</title>
	</head>
	<body>
		<%
			/* obtenemos los datos del formulario */
			String username = request.getParameter("username");
			String password = DigestUtils.md2Hex(request.getParameter("password"));
			String realName = request.getParameter("realName");
			String surname = request.getParameter("surname");
			String gender = request.getParameter("gender");
			boolean genderB = false;
			if(gender.equals("Masculino")){
				genderB = true;
			}
			String birthday = request.getParameter("birthday");
			
			/* creamos el objeto usurio */
			User u = new User();
			u.setUser(username);
			u.setPassword(password);
			u.setName(realName);
			u.setSurname(surname);
			u.setGender(genderB);
			u.setBirthday(birthday);
			
			
			/* agregamos el usuario a la base de datos */
			Boolean added = UserControl.addUser(u);
			if(added){
				response.sendRedirect("index.jsp");
			}else{
				response.sendRedirect("error.jsp");
			}
		%>
	</body>
</html>