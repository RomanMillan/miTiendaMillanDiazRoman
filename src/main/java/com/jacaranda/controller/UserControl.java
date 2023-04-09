package com.jacaranda.controller;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.User;

public class UserControl {

//	obtiene un usuario
	public static User getUser(String user, String password) {
		User u = (User) ConnectionDAO.getSession().get(User.class, user);
		User isValid = null;
		if(u != null && u.getPassword().equals(password)) {
			isValid = u;
		}
		return isValid;
	}
	
	
//	agrega un usuario
	public static boolean addUser(User user) {
		boolean added = true;
		try {
			ConnectionDAO.getSession().getTransaction().begin();
			ConnectionDAO.getSession().save(user);
			ConnectionDAO.getSession().getTransaction().commit();
		} catch (Exception e2) {
			added = false;
		}	
		return added;
	}
	
}
