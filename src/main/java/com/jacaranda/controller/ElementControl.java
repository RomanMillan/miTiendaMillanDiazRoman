package com.jacaranda.controller;

import java.util.List;

import org.hibernate.query.Query;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.Category;
import com.jacaranda.model.Element;

public class ElementControl {
	
//	devuelve todos los elementos
	public static List<Element> getAllElements() {
		Query<Element> query = ConnectionDAO.getSession().createQuery("SELECT c FROM com.jacaranda.model.Element c");
		List<Element> elementList = (List <Element>) query.getResultList();
		return elementList;
	}
	
//	devuelve el elemento que coincide con la PK
	public static Element getElement(int id) {
		return (Element) ConnectionDAO.getSession().get(Element.class,id);
	}
	
	
//	Comprueba si el nombre del elemento ya esta registrado
	public static boolean isValid(String nameElement) {
		boolean valid = true;
			Query<Element> query = ConnectionDAO.getSession().createQuery("SELECT e FROM com.jacaranda.model.Element e WHERE e.name =: nameElement");
			query.setParameter("nameElement", nameElement);
			try {
				Element results = query.getSingleResult();
				valid= false;
			}catch (Exception e) {
				
			}
			return valid;
	}
	
//	Añade un elemento
	public static boolean addElement(Element e) {
		boolean added = true;
		try {
			ConnectionDAO.getSession().getTransaction().begin();
			ConnectionDAO.getSession().save(e);
			ConnectionDAO.getSession().getTransaction().commit();
		} catch (Exception e2) {
			added = false;
		}	
		return added;
	}
	
// Borra un elemento
	public static boolean deleteElement(Element e) {
		boolean deleted = true;
		try {
			ConnectionDAO.getSession().getTransaction().begin();
			ConnectionDAO.getSession().delete(e);
			ConnectionDAO.getSession().getTransaction().commit();
		} catch (Exception e2) {
			deleted = false;
		}
		return deleted;
	}
	
	
	// Actualiza un elemento
		public static boolean updateElement(Element e) {
			boolean deleted = true;
			try {
				ConnectionDAO.getSession().getTransaction().begin();
				ConnectionDAO.getSession().update(e);
				ConnectionDAO.getSession().getTransaction().commit();
			} catch (Exception e2) {
				deleted = false;
			}
			return deleted;
		}
	
	
}
