package com.jacaranda.controller;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.User;

public class UserControl {

	
	public static User getUser(String user, String password) {
		User u = (User) ConnectionDAO.getSession().get(User.class, user);
		User isValid = null;
		if(u != null && u.getPassword().equals(password)) {
			isValid = u;
		}
		return isValid;
	}
	
}
