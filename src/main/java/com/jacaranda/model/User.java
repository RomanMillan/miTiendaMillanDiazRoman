package com.jacaranda.model;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name="userDB")
public class User {
	@Id
	private String user;
	private String password;
	private String name;
	private String surname;
	private boolean gender;
	private String birthday;
	private boolean administrator;
	@OneToMany(mappedBy="userObj")
	private List<Purchase> purchase;
	
//	constructores
	
	public User(String user, String password, String name, String surname, boolean gender, String birthday,
			boolean administrator, List<Purchase> purchase) {
		super();
		this.user = user;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.gender = gender;
		this.birthday = birthday;
		this.administrator = administrator;
		this.purchase = purchase;
	}
	
	public User() {
		super();
		this.user = null;
		this.password = null;
		this.name = null;
		this.surname = null;
		this.gender = false;
		this.birthday = null;
		this.administrator = false;
		this.purchase = null;
	}
	

//	getter and setter
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public boolean isAdministrator() {
		return administrator;
	}
	public void setAdministrator(boolean administrator) {
		this.administrator = administrator;
	}
	
	public List<Purchase> getPurchase() {
		return purchase;
	}

	public void setPurchase(List<Purchase> purchase) {
		this.purchase = purchase;
	}

	//	hashCode and Equals
	@Override
	public int hashCode() {
		return Objects.hash(user);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(user, other.user);
	}
	
	
	
	
}
