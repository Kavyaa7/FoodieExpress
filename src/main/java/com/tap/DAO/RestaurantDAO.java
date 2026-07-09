package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;

public interface RestaurantDAO {

	public void addRestaurant(Restaurant r);
	
	public void updateRestaurant(Restaurant r);
	
	public void deleteRestaurant(int id);
	
	public Restaurant getRestaurant(int id);
	
	public List<Restaurant> getAllRestaurants();
}
