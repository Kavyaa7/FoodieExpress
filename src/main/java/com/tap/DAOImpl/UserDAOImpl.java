package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO{
	
	private static final String INSERT_QUERY = "INSERT INTO user(userName, email, password, phone_number, address, role, lastLoginDate) VALUES(?,?,?,?,?,?,?)"; 
	private static final String UPDATE_QUERY = "UPDATE user SET userName=?, email=?, password=?, phone_number=?, address=?, role=? WHERE userId = ?";
	private static final String DELETE_QUERY = "DELETE FROM User WHERE userId = ?";
	private static final String SELECT_QUERY = "SELECT * FROM user WHERE userId = ?";
	private static final String SELECT_ALL_QUERY = "SELECT * FROM user";
	private static final String LOGIN_QUERY = "SELECT * FROM user WHERE email = ? AND password = ?";
	private static final String UPDATE_PROFILE_QUERY = "UPDATE user SET userName=?, phone_number=?, address=? WHERE userId=?";
	
	@Override
	public int addUser(User u) {
		
		Connection con = DBConnection.getConnection();

		try {
			
			PreparedStatement stmt = con.prepareStatement(INSERT_QUERY);
			
			stmt.setString(1, u.getName());
			stmt.setString(2, u.getEmail());
			stmt.setString(3, u.getPassword());
			stmt.setString(4, u.getPhoneNumber());
			stmt.setString(5, u.getAddress());
			stmt.setString(6, u.getRole());
			stmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			
			int i = stmt.executeUpdate();
			
			return i;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
		

	}

	@Override
	public void updateUser(User u) {
		
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(UPDATE_QUERY);
			
			stmt.setString(1, u.getName());
			stmt.setString(2, u.getEmail());
			stmt.setString(3, u.getPassword());
			stmt.setString(4, u.getPhoneNumber());
			stmt.setString(5, u.getAddress());
			stmt.setString(6, u.getRole());
			stmt.setInt(7, u.getId());
			
			stmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void deleteUser(int id) {
		
		Connection con = DBConnection.getConnection();
		
		try {
			PreparedStatement stmt = con.prepareStatement(DELETE_QUERY);
			
			stmt.setInt(1, id);
			
			stmt.executeUpdate();

		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public User getUser(int id) {
		
		Connection con = DBConnection.getConnection();
		User u = null;
		
		try {
			PreparedStatement stmt = con.prepareStatement(SELECT_QUERY);
			
			stmt.setInt(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				u = getUserFromResultSet(rs);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public List<User> getAllUsers() {
		
		Connection con = DBConnection.getConnection();
		User u = null;
		List<User> list = new ArrayList<User>();
		
		try {
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery(SELECT_ALL_QUERY);
			
			while(rs.next()) {
				u = getUserFromResultSet(rs);
				list.add(u);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	public User getUserFromResultSet(ResultSet rs) {

		User u = new User();

		try {

			u.setId(rs.getInt("userId"));
			u.setName(rs.getString("userName"));
			u.setEmail(rs.getString("email"));
			u.setPassword(rs.getString("password"));
			u.setPhoneNumber(rs.getString("phone_number"));
			u.setAddress(rs.getString("address"));
			u.setRole(rs.getString("role"));
			u.setCreatedDate(rs.getTimestamp("createdDate"));
			u.setLastLoginDate(rs.getTimestamp("lastLoginDate"));

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return u;
	}

	@Override
    public User login(String email, String password) {
        
        User user = null;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(LOGIN_QUERY)) {

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = getUserFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

	public void updateProfile(User user) {

	    Connection con = DBConnection.getConnection();

	    try {

	        PreparedStatement stmt = con.prepareStatement(UPDATE_PROFILE_QUERY);

	        stmt.setString(1, user.getName());
	        stmt.setString(2, user.getPhoneNumber());
	        stmt.setString(3, user.getAddress());
	        stmt.setInt(4, user.getId());

	        stmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	

}
