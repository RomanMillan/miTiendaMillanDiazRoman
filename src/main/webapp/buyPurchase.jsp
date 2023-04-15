<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.HashMap" %>
    <%@page import="com.jacaranda.controller.*"%>
<%@page import="com.jacaranda.model.*"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>	
		<%
			
			HashMap p = (HashMap) session.getAttribute("purchase");
			if(p != null && !p.isEmpty()){
				String userName = (String) session.getAttribute("user");
				User u = UserControl.getUser(userName);
				String datePurchase = LocalDateTime.now().toString();
				
				boolean validStock = true;
				
				Iterator<Object> it = p.keySet().iterator();
				while(it.hasNext() && validStock){
				    Object clave = it.next();
				    int aux = Integer.parseInt(clave.toString()); 
					Element e = ElementControl.getElement(aux);
					if(e.getStock() < (int) p.get(aux)){
						validStock = false;
					}
				    
				}
				
				if(validStock){
					for(Object clave:p.keySet()) {
						Purchase purc = new Purchase();
						int aux = Integer.parseInt(clave.toString()); 
						Element e = ElementControl.getElement(aux);
						
						int amount = (int) p.get(aux);
						
						purc.setAmount(amount);
						purc.setPrice(e.getPrice());
						purc.setPurchase_date(datePurchase);
						purc.setElementObj(e);
						purc.setUserObj(u);
						
						if(!PurchaseControl.addPurchase(purc)){
							System.out.println("no ha sido registrado");	
						}
						
						e.setStock(e.getStock()-amount);
						
					}
					p.clear();
					
					response.sendRedirect("purchased.jsp");
				}else{
					response.sendRedirect("errorPurchase.jsp");
				}
			}else{
				response.sendRedirect("purchase.jsp");
			}
			
		%>
	
	</body>
</html>