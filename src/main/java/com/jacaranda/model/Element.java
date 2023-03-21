package com.jacaranda.model;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;


@Entity(name="elementDB")
public class Element {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	private int stock;
	private int price;
	@ManyToOne
	@JoinColumn(name="id_category")
	private Category cat;
	
//	Constructores
	public Element(int id, String name, String description, int stock, int price, Category cat) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.stock = stock;
		this.price = price;
		this.cat = cat;
	}


	public Element() {
		super();
		this.id = 0;
		this.name = null;
		this.description = null;
		this.stock = 0;
		this.price = 0;
		this.cat = null;
	}

// getter and setter
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getStock() {
		return stock;
	}


	public void setStock(int stock) {
		this.stock = stock;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public Category getCat() {
		return cat;
	}


	public void setCat(Category cat) {
		this.cat = cat;
	}

//hashCode and equals
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Element other = (Element) obj;
		return id == other.id;
	}

	
	
}