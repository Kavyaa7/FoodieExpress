package com.tap.model;

public class Restaurant {

    private int restaurantId;
    private String restaurantName;
    private String address;
    private String cuisineType;
    private float rating;
    private int deliveryTime;
    private boolean isActive;
    private String imagePath;
    private int userId;

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Restaurant() {
        super();
    }

    public Restaurant(int restaurantId, String restaurantName, String address, String cuisineType, float rating,
            int deliveryTime, boolean isActive, String imagePath) {
        super();
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.address = address;
        this.cuisineType = cuisineType;
        this.rating = rating;
        this.deliveryTime = deliveryTime;
        this.isActive = isActive;
        this.imagePath = imagePath;
    }

    public Restaurant(int restaurantId, String restaurantName, String address, String cuisineType, float rating,
            int deliveryTime, boolean isActive, String imagePath, int userId) {
        super();
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.address = address;
        this.cuisineType = cuisineType;
        this.rating = rating;
        this.deliveryTime = deliveryTime;
        this.isActive = isActive;
        this.imagePath = imagePath;
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Restaurant [restaurantId=" + restaurantId + ", restaurantName=" + restaurantName + ", address="
                + address + ", cuisineType=" + cuisineType + ", rating=" + rating + ", deliveryTime=" + deliveryTime
                + ", isActive=" + isActive + ", imagePath=" + imagePath + ", userId=" + userId + "]";
    }
}