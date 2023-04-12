<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int key = Integer.parseInt(request.getParameter("key"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		HashMap p = (HashMap)  session.getAttribute("purchase");
		p.put(key, amount);
		response.sendRedirect("allElements.jsp");
	%>
</body>
</html>