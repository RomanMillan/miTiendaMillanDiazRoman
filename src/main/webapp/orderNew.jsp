<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jacaranda.controller.*" %>
    <%@ page import="com.jacaranda.model.*" %>
     <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userString = (String) session.getAttribute("user");
		User user = UserControl.getUser(userString);
		PurchaseControl.getOrderAsc(user);
		response.sendRedirect("listPurchase.jsp");
	%>
</body>
</html>