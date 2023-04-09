package com.jacaranda.controller;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.Category;
import com.jacaranda.model.Element;

import java.util.List;

import org.hibernate.query.Query;

public class CategoryControl {

	public static Category getCategory(int id) {
		Category category = (Category) ConnectionDAO.getSession().get(Category.class,id);
		
		return category;
	}
	
	public static List<Category> getCategory(){
		Query<Category> query = ConnectionDAO.getSession().createQuery("SELECT c FROM com.jacaranda.model.Category c");
		List<Category> category = (List<Category>) query.getResultList();
		return category;
		
	}
	
//	Comprueba si el nombre de la categoria ya esta registrado
	public static boolean isValid(String nameCategory) {
		boolean valid = true;
			Query<Category> query = ConnectionDAO.getSession().createQuery("SELECT c FROM com.jacaranda.model.Category c WHERE c.name =: nameCategory");
			query.setParameter("nameCategory", nameCategory);
			try {
				Category results = query.getSingleResult();
				valid= false;
			}catch (Exception e) {
				
			}
			return valid;
	}
	
	
	//	Añade una categoria
		public static boolean addCategory(Category c) {
			boolean added = true;
			try {
				ConnectionDAO.getSession().getTransaction().begin();
				ConnectionDAO.getSession().save(c);
				ConnectionDAO.getSession().getTransaction().commit();
			} catch (Exception e2) {
				added = false;
			}	
			return added;
		}
		
	// Borra una categoria
		public static boolean deleteCategory(Category c) {
			boolean deleted = true;
			try {
				ConnectionDAO.getSession().getTransaction().begin();
				ConnectionDAO.getSession().delete(c);
				ConnectionDAO.getSession().getTransaction().commit();
			} catch (Exception e2) {
				deleted = false;
			}
			return deleted;
		}
		
	
	// Actualiza una categoria
		public static boolean updateCategory(Category c) {
			boolean deleted = true;
			try {
				ConnectionDAO.getSession().getTransaction().begin();
				ConnectionDAO.getSession().update(c);
				ConnectionDAO.getSession().getTransaction().commit();
			} catch (Exception e2) {
				deleted = false;
			}
			return deleted;
		}
	
	
}
