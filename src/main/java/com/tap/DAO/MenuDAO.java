package com.tap.DAO;

import java.util.List;

import com.tap.model.Menu;

public interface MenuDAO {

	public void addMenuItem(Menu m);
	
	public void updateMenuItem(Menu m);
	
	public void deleteMenuItem(int menuId);
	
	public Menu getMenuItem(int menuId);
	
	public List<Menu> getAllMenuItems();

	public List<Menu> getMenuByRestaurant(int restaurantId);

}
