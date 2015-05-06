package com.fashion3d.beans;

import java.io.Serializable;
import java.util.Date;

public class ShoppingCart implements Serializable{
	
	Products products;
	int totalItems;
	float priceOfTotalItems;
	int productId;
	int userId;
	String isCompleteTransaction;
	String modifiedColor;
	int cartId;
	Date orderDate;
	
	public Products getProducts() {
		return products;
	}
	public void setProducts(Products products) {
		this.products = products;
	}
	public int getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}
	public float getPriceOfTotalItems() {
		return priceOfTotalItems;
	}
	public void setPriceOfTotalItems(float priceOfTotalItems) {
		this.priceOfTotalItems = priceOfTotalItems;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getIsCompleteTransaction() {
		return isCompleteTransaction;
	}
	public void setIsCompleteTransaction(String isCompleteTransaction) {
		this.isCompleteTransaction = isCompleteTransaction;
	}
	public String getModifiedColor() {
		return modifiedColor;
	}
	public void setModifiedColor(String modifiedColor) {
		this.modifiedColor = modifiedColor;
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
}
