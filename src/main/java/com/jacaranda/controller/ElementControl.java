package com.jacaranda.controller;

import java.util.List;

import org.hibernate.query.Query;

import com.jacaranda.BD.ConnectionDAO;
import com.jacaranda.model.Element;

public class ElementControl {
	
	public static Element getElement(int id) {
		return (Element) ConnectionDAO.getSession().get(Element.class,id);
	}
	
//	public static Element getElement(String nombre) {
//		return (Element) ConnectionDAO.getSession().get(Element.class,id);
//	}
//	
	public static List<Element> getAllElements() {
			Query<Element> query = ConnectionDAO.getSession().createQuery("SELECT c FROM com.jacaranda.model.Element c");
			List<Element> elementList = (List <Element>) query.getResultList();
			return elementList;
	}
	
	
}
