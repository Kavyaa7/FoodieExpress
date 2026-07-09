package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {
	
	private static final String INSERT_QUERY = "INSERT INTO menu(itemName, restaurantId, price, description, imageUrl, isAvailable) VALUES(?,?,?,?,?,?)";
	private static final String UPDATE_QUERY = "UPDATE menu SET itemName=?, restaurantId=?, price=?, description=?, imageUrl=?, isAvailable=? WHERE menuId = ?";
	private static final String DELETE_QUERY = "DELETE FROM menu WHERE menuId = ?";
	private static final String SELECT_QUERY = "SELECT * FROM menu WHERE menuId = ?";
	private static final String SELECT_BY_RESTAURANT = "SELECT * FROM menu WHERE restaurantId = ?";
	private static final String SELECT_ALL_QUERY = "SELECT * FROM menu";


	@Override
	public void addMenuItem(Menu m) {
		Connection con = DBConnection.getConnection();

		try {
			PreparedStatement stmt = con.prepareStatement(INSERT_QUERY);
			
			stmt.setString(1, m.getItemName());
			stmt.setInt(2, m.getRestaurantId());
			stmt.setFloat(3, m.getPrice());
			stmt.setString(4, m.getDescription());
			stmt.setString(5, m.getImageUrl());
			stmt.setBoolean(6, m.isAvailable());
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenuItem(Menu m) {
		
		Connection con = DBConnection.getConnection();

		try {
			PreparedStatement stmt = con.prepareStatement(UPDATE_QUERY);
			
			stmt.setString(1, m.getItemName());
			stmt.setInt(2, m.getRestaurantId());
			stmt.setFloat(3, m.getPrice());
			stmt.setString(4, m.getDescription());
			stmt.setString(5, m.getImageUrl());
			stmt.setBoolean(6, m.isAvailable());
			stmt.setInt(7, m.getMenuId());
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteMenuItem(int menuId) {
		
		Connection con = DBConnection.getConnection();

		try {
			PreparedStatement stmt = con.prepareStatement(DELETE_QUERY);
			
			stmt.setInt(1, menuId);
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Menu getMenuItem(int menuId) {
		
		Connection con = DBConnection.getConnection();
		Menu m = null;

		try {
			PreparedStatement stmt = con.prepareStatement(SELECT_QUERY);
			
			stmt.setInt(1, menuId);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				m = getMenuFromResultSet(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}
	
	@Override
	public List<Menu> getMenuByRestaurant(int restaurantId) {

		Connection con = DBConnection.getConnection();
		List<Menu> list = new ArrayList<Menu>();
		Menu m = null;

		try {
			PreparedStatement stmt = con.prepareStatement(SELECT_BY_RESTAURANT);
			
			stmt.setInt(1, restaurantId);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				m = getMenuFromResultSet(rs);
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}

	@Override
	public List<Menu> getAllMenuItems() {

		Connection con = DBConnection.getConnection();
		List<Menu> list = new ArrayList<Menu>();
		Menu m = null;

		try {
			Statement stmt = con.createStatement();
						
			ResultSet rs = stmt.executeQuery(SELECT_ALL_QUERY);
			
			while(rs.next()) {
				m = getMenuFromResultSet(rs);
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public Menu getMenuFromResultSet(ResultSet rs) {
		
		Menu m = new Menu();
		
		try {
			m.setMenuId(rs.getInt("menuId"));
			m.setRestaurantId(rs.getInt("restaurantId"));
			m.setItemName(rs.getString("itemName"));
			m.setPrice(rs.getFloat("price"));
			m.setDescription(rs.getString("description"));
			m.setImageUrl(rs.getString("imageUrl"));
			m.setAvailable(rs.getBoolean("isAvailable"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return m;
	}

}
