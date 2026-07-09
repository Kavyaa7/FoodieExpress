package com.tap.DAO;

import java.util.List;

import com.tap.model.OrderItem;

public interface OrderItemDAO {
	
	public void addOrderItem(OrderItem o);

	public void updateOrderItem(OrderItem o);
	
	public void deleteOrderItem(int orderItemId);

	public List<OrderItem> getOrderItemById(int orderItemId);
	
	public List<OrderItem> getOrderItemByOrder(int orderId);
	
	public List<OrderItem> getAllOrderItem();

}


