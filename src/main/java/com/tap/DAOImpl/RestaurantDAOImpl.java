package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO{

    private static final String INSERT_QUERY = "INSERT INTO restaurant(restaurantName, address, cuisineType, rating, deliveryTime, isActive, imagePath, userId) VALUES(?,?,?,?,?,?,?,?)";
    private static final String UPDATE_QUERY = "UPDATE restaurant SET restaurantName=?, address=?, cuisineType=?, rating=?, deliveryTime=?, isActive=?, imagePath=?, userId=? WHERE restaurantId = ?";
    private static final String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurantId = ?";
    private static final String SELECT_QUERY = "SELECT * FROM restaurant WHERE restaurantId = ?";
    private static final String SELECT_BY_USER_QUERY = "SELECT * FROM restaurant WHERE userId = ?";
    private static final String SELECT_ALL_QUERY = "SELECT * FROM restaurant";

    @Override
    public void addRestaurant(Restaurant r) {
        Connection con = DBConnection.getConnection();

        try {
            PreparedStatement stmt = con.prepareStatement(INSERT_QUERY);

            stmt.setString(1, r.getRestaurantName());
            stmt.setString(2, r.getAddress());
            stmt.setString(3, r.getCuisineType());
            stmt.setFloat(4, r.getRating());
            stmt.setInt(5, r.getDeliveryTime());
            stmt.setBoolean(6, r.isActive());
            stmt.setString(7, r.getImagePath());
            stmt.setInt(8, r.getUserId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateRestaurant(Restaurant r) {
        Connection con = DBConnection.getConnection();

        try {
            PreparedStatement stmt = con.prepareStatement(UPDATE_QUERY);

            stmt.setString(1, r.getRestaurantName());
            stmt.setString(2, r.getAddress());
            stmt.setString(3, r.getCuisineType());
            stmt.setFloat(4, r.getRating());
            stmt.setInt(5, r.getDeliveryTime());
            stmt.setBoolean(6, r.isActive());
            stmt.setString(7, r.getImagePath());
            stmt.setInt(8, r.getUserId());
            stmt.setInt(9, r.getRestaurantId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int id) {
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
    public Restaurant getRestaurant(int id) {
        Connection con = DBConnection.getConnection();
        Restaurant r = null;

        try {
            PreparedStatement stmt = con.prepareStatement(SELECT_QUERY);

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {
                r = getRestaurantFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    public Restaurant getRestaurantByUser(int id) {
        Connection con = DBConnection.getConnection();
        Restaurant r = null;

        try {
            PreparedStatement stmt = con.prepareStatement(SELECT_BY_USER_QUERY);

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while(rs.next()) {
                r = getRestaurantFromResultSet(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return r;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        Connection con = DBConnection.getConnection();
        Restaurant r = null;
        List<Restaurant> list = new ArrayList<Restaurant>();

        try {
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(SELECT_ALL_QUERY);

            while(rs.next()) {
                r = getRestaurantFromResultSet(rs);
                list.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public Restaurant getRestaurantFromResultSet(ResultSet rs) {
        Restaurant r = new Restaurant();

        try {
            r.setRestaurantId(rs.getInt("restaurantId"));
            r.setRestaurantName(rs.getString("restaurantName"));
            r.setAddress(rs.getString("address"));
            r.setCuisineType(rs.getString("cuisineType"));
            r.setRating(rs.getFloat("rating"));
            r.setDeliveryTime(rs.getInt("deliveryTime"));
            r.setActive(rs.getBoolean("isActive"));
            r.setImagePath(rs.getString("imagePath"));
            r.setUserId(rs.getInt("userId"));

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return r;
    }
}