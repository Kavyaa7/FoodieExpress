package com.tap.model;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tap.DAOImpl.CartItemDAOImpl;

public class Cart {
	
	Map<Integer, CartItem> cartItems;
	
	private int cartId;
    private int userId;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    
	public Cart() {
		cartItems = new HashMap<Integer, CartItem>();
	}

	public Map<Integer, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Map<Integer, CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public void addItem(CartItem cartItem) {
		int menuId = cartItem.getMenuId();
		
		if(cartItems.containsKey(menuId)) {
			CartItem existingItem = cartItems.get(menuId);
			existingItem.setQuantity(existingItem.getQuantity()+1);
		}
		else {
			cartItems.put(menuId, cartItem);
		}
	}

	public void updateItem(int menuId, int quantity) {
		
		if(cartItems.containsKey(menuId)) {
			if(quantity <= 0) {
				cartItems.remove(menuId);
			}
			else {
				CartItem cartItem = cartItems.get(menuId);
				cartItem.setQuantity(quantity);
			}
		}
	}

	public void removeItem(int menuId) {
		cartItems.remove(menuId);
	}
	
	
    
	
    
}
