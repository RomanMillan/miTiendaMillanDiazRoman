package com.jacaranda.model;

import java.util.Objects;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="purchase")
public class Purchase {
	
	private int amount;
	private int price;
	@Id
	private String purchase_date;
	@ManyToOne
	@JoinColumn(name="id_user")
	private User userObj;
	@ManyToOne
	@JoinColumn(name="id_element")
	private Element elementObj;
	
//	constructores
	
	public Purchase() {
		super();
		this.amount = 0;
		this.price = 0;
		this.purchase_date = null;
		this.elementObj = null;
	}
	

	public Purchase(int amount, int price, String purchase_date, User userObj, Element elementObj) {
		super();
		this.amount = amount;
		this.price = price;
		this.purchase_date = purchase_date;
		this.userObj = userObj;
		this.elementObj = elementObj;
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


	public User getUserObj() {
		return userObj;
	}


	public void setUserObj(User userObj) {
		this.userObj = userObj;
	}


	public Element getElementObj() {
		return elementObj;
	}


	public void setElementObj(Element elementObj) {
		this.elementObj = elementObj;
	}


	//	hashcode and equals
	@Override
	public int hashCode() {
		return Objects.hash(elementObj, purchase_date, userObj);
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
		return Objects.equals(elementObj, other.elementObj) && Objects.equals(purchase_date, other.purchase_date)
				&& Objects.equals(userObj, other.userObj);
	}

	
	
	
	
}
