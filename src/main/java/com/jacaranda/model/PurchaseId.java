package com.jacaranda.model;

import java.io.Serializable;
import java.util.Objects;

public class PurchaseId implements Serializable{
	private String purchase_date;
	private String userObj;
	private int elementObj;
	
//	constructores
	public PurchaseId(String purchase_date, String userObj, int elementObj) {
		super();
		this.purchase_date = purchase_date;
		this.userObj = userObj;
		this.elementObj = elementObj;
	}
	
	
	
	public PurchaseId() {
		super();
	}



//	getter and setter
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getUserObj() {
		return userObj;
	}
	public void setUserObj(String userObj) {
		this.userObj = userObj;
	}
	public int getElementObj() {
		return elementObj;
	}
	public void setElementObj(int elementObj) {
		this.elementObj = elementObj;
	}
	
//	hashCode and Equals
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
		PurchaseId other = (PurchaseId) obj;
		return elementObj == other.elementObj && Objects.equals(purchase_date, other.purchase_date)
				&& Objects.equals(userObj, other.userObj);
	}
	
	

}
