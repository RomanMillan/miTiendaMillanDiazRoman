package com.jacaranda.model;

import java.util.Objects;

public class Purchase {
	
	private int amount;
	private int price;
	private String purchase_date;
	private int id_element;
	private String id_user;
	
//	constructores
	public Purchase(int amount, int price, String purchase_date, int id_element, String id_user) {
		super();
		this.amount = amount;
		this.price = price;
		this.purchase_date = purchase_date;
		this.id_element = id_element;
		this.id_user = id_user;
	}
	public Purchase() {
		super();
		this.amount = 0;
		this.price = 0;
		this.purchase_date = null;
		this.id_element = 0;
		this.id_user = null;
	}
	
//	getter and setter
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public int getId_element() {
		return id_element;
	}
	public void setId_element(int id_element) {
		this.id_element = id_element;
	}
	public String getId_user() {
		return id_user;
	}
	public void setId_user(String id_user) {
		this.id_user = id_user;
	}
	
//	hashcode and equals
	@Override
	public int hashCode() {
		return Objects.hash(id_element, id_user, purchase_date);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Purchase other = (Purchase) obj;
		return id_element == other.id_element && Objects.equals(id_user, other.id_user)
				&& Objects.equals(purchase_date, other.purchase_date);
	}
	
	
}
