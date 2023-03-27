<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.jacaranda.model.User" %>
    <%@page import="com.jacaranda.controller.UserControl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession sesion = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		if(username == null || password == null){
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}else{			
			User user = UserControl.getUser(username, password);
			
			if(user == null){
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}else{
				sesion.setAttribute("login",true);
				sesion.setAttribute("user",username);
				sesion.setAttribute("administrator", false);
				
				if(user.isAdministrator()) {
					sesion.setAttribute("administrator", true);
				}	
				request.getRequestDispatcher("/categories.jsp").forward(request, response);
			}
		}
		
		
	%>
</body>
</html>