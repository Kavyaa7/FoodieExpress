package com.tap.model;

public class Menu {

	private int menuId;
	private String itemName;
	private int restaurantId;
	private float price;
	private String description;
	private String imageUrl;
	private boolean isAvailable;
	
	
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public boolean isAvailable() {
		return isAvailable;
	}
	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	
	
	public Menu() {
		super();
	}
	
	public Menu(int menuId, String itemName, int restaurantId, float price, String description, String imageUrl,
			boolean isAvailable) {
		super();
		this.menuId = menuId;
		this.itemName = itemName;
		this.restaurantId = restaurantId;
		this.price = price;
		this.description = description;
		this.imageUrl = imageUrl;
		this.isAvailable = isAvailable;
	}
	
	
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", itemName=" + itemName + ", restaurantId=" + restaurantId + ", price="
				+ price + ", description=" + description + ", imageUrl=" + imageUrl + ", isAvailable=" + isAvailable
				+ "]";
	}
	
	
	
	
	

}
