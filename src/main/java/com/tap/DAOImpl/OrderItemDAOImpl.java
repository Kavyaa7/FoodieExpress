package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO{
	
	private static final String INSERT_QUERY = "INSERT INTO orderItem (orderId, menuId, quantity, itemTotal) VALUES (?, ?, ?, ?)";
	private static final String UPDATE_QUERY = "UPDATE orderItem SET orderId=?, menuId=?, quantity=?, itemTotal=?  WHERE orderItemId=?";
	private static final String DELETE_QUERY = "DELETE FROM orderItem WHERE orderItemId=?";
	private static final String SELECT_BY_ORDERID_QUERY = "SELECT * FROM orderItem WHERE orderId=?";
	private static final String SELECT_BY_USERID_QUERY = "SELECT * FROM orderItem WHERE userId=?";
	private static final String SELECT_ALL_QUERY = "SELECT * FROM orderItem";

	@Override
	public void addOrderItem(OrderItem o) {
		
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(INSERT_QUERY);
			
			stmt.setInt(1, o.getOrderItemId());
			stmt.setFloat(2, o.getOrderId());
			stmt.setInt(3, o.getMenuId());
			stmt.setInt(4, o.getQuantity());
			stmt.setFloat(5, o.getItemTotal());
			
			stmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateOrderItem(OrderItem o) {
		
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(UPDATE_QUERY);
			
			stmt.setFloat(1, o.getOrderId());
			stmt.setInt(2, o.getMenuId());
			stmt.setInt(3, o.getQuantity());
			stmt.setFloat(4, o.getItemTotal());
			stmt.setInt(5, o.getOrderItemId());

			
			stmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteOrderItem(int orderItemId) {
	    Connection con = DBConnection.getConnection();
	    try {
	        PreparedStatement stmt = con.prepareStatement(DELETE_QUERY);
	        stmt.setInt(1, orderItemId);
	        stmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	@Override
	public List<OrderItem> getOrderItemById(int orderItemId) {
	    List<OrderItem> items = new ArrayList<>();
	    Connection con = DBConnection.getConnection();
	    try {
	        PreparedStatement stmt = con.prepareStatement("SELECT * FROM orderItem WHERE orderItemId=?");
	        stmt.setInt(1, orderItemId);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            OrderItem item = new OrderItem();
	            item.setOrderItemId(rs.getInt("orderItemId"));
	            item.setOrderId(rs.getInt("orderId"));
	            item.setMenuId(rs.getInt("menuId"));
	            item.setQuantity(rs.getInt("quantity"));
	            item.setItemTotal(rs.getFloat("itemTotal"));
	            items.add(item);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return items;
	}

	@Override
	public List<OrderItem> getOrderItemByOrder(int orderId) {
	    List<OrderItem> items = new ArrayList<>();
	    Connection con = DBConnection.getConnection();
	    try {
	        PreparedStatement stmt = con.prepareStatement(SELECT_BY_ORDERID_QUERY);
	        stmt.setInt(1, orderId);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            OrderItem item = new OrderItem();
	            item.setOrderItemId(rs.getInt("orderItemId"));
	            item.setOrderId(rs.getInt("orderId"));
	            item.setMenuId(rs.getInt("menuId"));
	            item.setQuantity(rs.getInt("quantity"));
	            item.setItemTotal(rs.getFloat("itemTotal"));
	            items.add(item);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return items;
	}

	@Override
	public List<OrderItem> getAllOrderItem() {
	    List<OrderItem> items = new ArrayList<>();
	    Connection con = DBConnection.getConnection();
	    try {
	        PreparedStatement stmt = con.prepareStatement(SELECT_ALL_QUERY);
	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            OrderItem item = new OrderItem();
	            item.setOrderItemId(rs.getInt("orderItemId"));
	            item.setOrderId(rs.getInt("orderId"));
	            item.setMenuId(rs.getInt("menuId"));
	            item.setQuantity(rs.getInt("quantity"));
	            item.setItemTotal(rs.getFloat("itemTotal"));
	            items.add(item);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return items;
	}


}
