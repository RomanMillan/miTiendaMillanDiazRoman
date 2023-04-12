<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.HashMap" %>
    <%@page import="com.jacaranda.controller.*"%>
<%@page import="com.jacaranda.model.*"%>
<%@ page import="java.time.LocalDateTime" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>	
		<%
			
			HashMap p = (HashMap) session.getAttribute("purchase");
			Purchase purc = new Purchase();
			String userName = (String) session.getAttribute("user");
			User u = UserControl.getUser(userName);
			String datePurchase = LocalDateTime.now().toString();
			
			for(Object clave:p.keySet()) {
				int aux = Integer.parseInt(clave.toString()); 
				Element e = ElementControl.getElement(aux);
				int amount = (int) p.get(aux);
				
				purc.setAmount(amount);
				purc.setPrice(amount);
				purc.setPurchase_date(datePurchase);
				purc.setElementObj(e);
				purc.setUserObj(u);
				
				if(!PurchaseControl.addPurchase(purc)){
					System.out.println("no ha sido registrado");	
				}
			}
			p.clear();
			
			response.sendRedirect("purchased.jsp");
			
		%>
	
	</body>
</html>