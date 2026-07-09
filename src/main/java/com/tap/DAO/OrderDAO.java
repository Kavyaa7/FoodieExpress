package com.tap.DAO;

import java.util.List;

import com.tap.model.Order;

public interface OrderDAO {
	
	public int addOrder(Order o);
	
	public void updateOrder(Order o);
	
	public void deleteOrder(int orderId);
	
	public Order getOrderById(int orderId);
	
	public List<Order> getOrderByUser(int userId);
	
	public List<Order> getAllOrders();
}
