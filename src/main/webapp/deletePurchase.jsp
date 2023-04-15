<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int key = Integer.parseInt(request.getParameter("key"));
			HashMap p = (HashMap) session.getAttribute("purchase");
			p.remove(key);
			response.sendRedirect("purchase.jsp");
		%>
	</body>
</html>