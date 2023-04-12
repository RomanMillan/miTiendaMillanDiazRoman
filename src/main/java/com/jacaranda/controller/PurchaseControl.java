package com.jacaranda.controller;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.Purchase;

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
	
}
