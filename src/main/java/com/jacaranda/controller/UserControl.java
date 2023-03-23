package com.jacaranda.controller;

import java.util.Iterator;
import java.util.List;

import org.hibernate.query.Query;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.User;

public class UserControl {

	
	public static User getUser(String username, String password){
		User user = null;
		Query<User> query = ConnectionDAO.getSession().createQuery("SELECT u FROM com.jacaranda.model.User u");
		List<User> userList = (List <User>) query.getResultList();
		
		Iterator <User> pointer = userList.iterator();
		User aux = null;
		boolean found = false;
		while(pointer.hasNext()&&!found) {
			aux = pointer.next();
			if(aux.getUser().equals(username)&&aux.getPassword().equals(password)) {
				found = true;
				user = aux;
			}
		}
	
		return user;
	}
}
