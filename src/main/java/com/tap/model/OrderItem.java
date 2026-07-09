package com.tap.model;

public class OrderItem {

	private int orderItemId;
	private int orderId;
	private String itemName;
	private int menuId;
	private float itemTotal;
	private int quantity;
	
	
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public float getItemTotal() {
		return itemTotal;
	}
	public void setItemTotal(float itemTotal) {
		this.itemTotal = itemTotal;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public OrderItem() {
		super();
	}
	
	public OrderItem(int orderItemId, int orderId, String itemName, int menuId, float itemTotal, int quantity) {
		super();
		this.orderItemId = orderItemId;
		this.orderId = orderId;
		this.itemName = itemName;
		this.menuId = menuId;
		this.itemTotal = itemTotal;
		this.quantity = quantity;
	}
	
	@Override
	public String toString() {
		return "OrderItem [orderItemId=" + orderItemId + ", orderId=" + orderId + ", itemName=" + itemName + ", menuId="
				+ menuId + ", itemTotal=" + itemTotal + ", quantity=" + quantity + "]";
	}
	
	
	

}
