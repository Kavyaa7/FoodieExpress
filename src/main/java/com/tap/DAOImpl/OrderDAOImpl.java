package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.OrderDAO;
import com.tap.model.Order;
import com.tap.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

	private static final String INSERT_QUERY = "INSERT INTO orders (userId, totalAmount, status, paymentMethod, restaurantid, orderDate) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_QUERY = "UPDATE orders SET totalAmount=? status=? paymentmethod=? WHERE orderId=?";
	private static final String DELETE_QUERY = "DELETE FROM orders WHERE orderId=?";
	private static final String SELECT_BY_ORDERID_QUERY = "SELECT * FROM orders WHERE orderId=?";
	private static final String SELECT_BY_USERID_QUERY = "SELECT * FROM orders WHERE userId=?";
	private static final String SELECT_ALL_QUERY = "SELECT * FROM orders";
	private static final String SELECT_CONFIRMED_ORDERS = "SELECT * FROM orders WHERE status=?";
	private static final String UPDATE_ORDER_STATUS = "UPDATE orders SET status=? WHERE orderId=?";



	@Override
	public int addOrder(Order o) {
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(INSERT_QUERY, Statement.RETURN_GENERATED_KEYS);
			int orderId=0;
			
			stmt.setInt(1, o.getUserId());
			stmt.setFloat(2, o.getTotalAmount());
			stmt.setString(3, o.getStatus());
			stmt.setString(4, o.getPaymentMethod());
			stmt.setInt(5, o.getRestaurantId());
			stmt.setTimestamp(6, o.getOrderDate());
			
			stmt.executeUpdate();
			
			ResultSet generatedKeys = stmt.getGeneratedKeys();
			
			while(generatedKeys.next()) {
				orderId = generatedKeys.getInt(1);
			}
			
			return orderId;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}

	@Override
	public void updateOrder(Order o) {

	Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(UPDATE_QUERY);
			
			stmt.setFloat(1, o.getTotalAmount());
			stmt.setString(2, o.getStatus());
			stmt.setString(3, o.getPaymentMethod());
			stmt.setInt(4, o.getOrderId());
			
			stmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOrder(int orderId) {

		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(DELETE_QUERY);
			
			stmt.setInt(1, orderId);
			
			stmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	

	@Override
	public List<Order> getOrderByUser(int userId) {
	
		Connection con = DBConnection.getConnection();
		Order o = null;
		List<Order>list = new ArrayList<Order>();
		
		try {
			PreparedStatement stmt = con.prepareStatement(SELECT_BY_USERID_QUERY);
			
			stmt.setInt(1, userId);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				o = getOrderFromResultSet(rs);
				list.add(o);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Order> getAllOrders() {

		Connection con = DBConnection.getConnection();
		Order o = null;
		List<Order>list = new ArrayList<Order>();
		
		try {
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery(SELECT_ALL_QUERY);
			while(rs.next()) {
				o = getOrderFromResultSet(rs);
				list.add(o);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Order> getConfirmedOrders() {
		
		Connection con = DBConnection.getConnection();
		Order o = null;
		List<Order>list = new ArrayList<Order>();
		
		try {
			PreparedStatement stmt = con.prepareStatement(SELECT_CONFIRMED_ORDERS);
			
			stmt.setString(1,"confirmed");
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				o = getOrderFromResultSet(rs);
				list.add(o);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Order getOrderFromResultSet(ResultSet rs) {
		
		Order o = new Order();
		
		try {
			o.setOrderId(rs.getInt("orderId"));
			o.setUserId(rs.getInt("userId"));
			o.setOrderDate(rs.getTimestamp("orderDate"));
			o.setTotalAmount(rs.getFloat("totalAmount"));
			o.setStatus(rs.getString("status"));
			o.setPaymentMethod(rs.getString("paymentMethod"));
			o.setRestaurantId(rs.getInt("restaurantId"));
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return o;
	}

	@Override
	public Order getOrderById(int orderId) {
		Connection con = DBConnection.getConnection();
		Order o = null;
		
		try {
			PreparedStatement stmt = con.prepareStatement(SELECT_BY_ORDERID_QUERY);
			
			stmt.setInt(1, orderId);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				o = getOrderFromResultSet(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return o;
	}
	
	public void updateOrderStatus(int orderId, String status) {
		
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(UPDATE_ORDER_STATUS);
			
			stmt.setString(1,status);
			stmt.setInt(2, orderId);
			
			stmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
