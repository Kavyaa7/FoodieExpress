package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tap.DAO.CartItemDAO;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class CartItemDAOImpl implements CartItemDAO{
	
	private static final String SELECT_BY_MENUID = "SELECT * FROM cartitem WHERE menuId = ?";
	
	@Override
	public CartItem getCartItem(int menuId) {
		Connection con = DBConnection.getConnection();
		CartItem c = null;

		try {
			PreparedStatement stmt = con.prepareStatement(SELECT_BY_MENUID);
			
			stmt.setInt(1, menuId);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				c = getCartItemFromResultSet(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}
	
public CartItem getCartItemFromResultSet(ResultSet rs) {
		
	CartItem c = new CartItem();
		
		try {
			c.setMenuId(rs.getInt("menuId"));
			c.setRestaurantId(rs.getInt("restaurantId"));
			c.setName(rs.getString("itemName"));
			c.setPrice(rs.getFloat("price"));
			c.setQuantity(rs.getInt("quantity"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}

}
