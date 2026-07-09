package com.tap.DAO;

import java.sql.ResultSet;
import java.util.List;

import com.tap.model.User;

public interface UserDAO {

	public int addUser(User u);
	
	public void updateUser(User u);
	
	public void deleteUser(int id);
	
	public User getUser(int id);
	
	public List<User> getAllUsers();
	
	public User getUserFromResultSet(ResultSet rs);
	
	public User login(String email, String password);
	
	public void updateProfile(User u);
}
