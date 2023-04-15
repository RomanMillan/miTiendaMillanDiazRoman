package com.jacaranda.controller;

import java.util.List;

import org.hibernate.query.Query;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.Purchase;
import com.jacaranda.model.User;

public class PurchaseControl {

//	agrega un usuario
	public static boolean addPurchase(Purchase purchae) {
		boolean added = true;
		try {
			ConnectionDAO.getSession().getTransaction().begin();
			ConnectionDAO.getSession().save(purchae);
			ConnectionDAO.getSession().getTransaction().commit();
		} catch (Exception e2) {
			System.out.println(e2);
			added = false;
		}	
		return added;
	}
	
	
//	obtengo la lista completa de todos los usuarios
	public static List<Purchase> getPruchase(){
		Query<Purchase> query = ConnectionDAO.getSession().createQuery("SELECT p FROM com.jacaranda.model.Purchase p");
		List<Purchase> purchase = (List<Purchase>) query.getResultList();
		return purchase;
		
	}
	
//	obtengo la lista de comptra de un usuario especifico
	public static List<Purchase> getPruchase(User user){
		List<Purchase> purchase = null;
		Query<Purchase> query = ConnectionDAO.getSession().createQuery("SELECT p FROM com.jacaranda.model.Purchase p WHERE p.userObj =: user");
		query.setParameter("user", user);
		try {
			 purchase = query.getResultList();
		}catch (Exception e) {
		}
		return purchase;
		
	}
	
}
