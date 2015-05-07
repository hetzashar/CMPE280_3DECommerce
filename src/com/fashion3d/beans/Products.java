package com.fashion3d.beans;

import java.io.Serializable;
import java.util.HashMap;

public class Products implements Serializable{
	
	int productId;
	String category;
	String productName;
	int buyersCount;
	String tnImagePath;
	int productCount;
	String initialColor;
	int addedBy;
	String productDescription;
	float price;
	String imagePath;
	String title;
	HashMap<String, String> colorListMap;
	String hues;
	
	public String getHues() {
		return hues;
	}
	public void setHues(String hues) {
		this.hues = hues;
	}
	public HashMap<String, String> getColorListMap() {
		return colorListMap;
	}
	public void setColorListMap(HashMap<String, String> colorListMap) {
		this.colorListMap = colorListMap;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getBuyersCount() {
		return buyersCount;
	}
	public void setBuyersCount(int buyersCount) {
		this.buyersCount = buyersCount;
	}
	public String getTnImagePath() {
		return tnImagePath;
	}
	public void setTnImagePath(String tnImagePath) {
		this.tnImagePath = tnImagePath;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public String getInitialColor() {
		return initialColor;
	}
	public void setInitialColor(String initialColor) {
		this.initialColor = initialColor;
	}
	public int getAddedBy() {
		return addedBy;
	}
	public void setAddedBy(int addedBy) {
		this.addedBy = addedBy;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

}
