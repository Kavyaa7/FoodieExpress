<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodieExpress - Home</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">

</head>
<body>
	<nav class="navbar">

		<div class="logo">
			Foodie<span>Express</span>
		</div>

		<div class="nav-links">
			<%
    	User user = (User)session.getAttribute("loggedInUser");
    
    	if(user!=null){
    %>
			<span class="welcome-text"><%= "Hi, "+ user.getName() %></span>
			<%		
    	}
    %>

			<a href="views/profile.jsp">Profile</a> 
			<a href="views/cart.jsp">Cart</a> 
			<a href="views/orderHistory.jsp">Orders</a>
			
			<% if(user == null){ %>
			<a href="views/login.jsp">Login</a>
			<% } else { %>
			
			<a href="<%=request.getContextPath()%>/logout">Logout</a>

			<% } %>
		</div>

	</nav>

	<!-- HERO -->

	<section class="hero">

		<div class="hero-content">
			<h1>
				Delicious Food <br> <span>Delivered Fast</span>
			</h1>

			<p>Discover the best restaurants around you, order your favorite
				meals, and track deliveries in real time.</p>

			<div class="hero-buttons">
				<a href="#featured-restaurants" class="btn-primary">Order Now</a> <a href="#"
					class="btn-secondary">Browse Restaurants</a>
			</div>
		</div>

		<div class="hero-image">
			<img
				src="https://images.pexels.com/photos/17050759/pexels-photo-17050759.jpeg"
				alt="Food">
		</div>

	</section>

	<!-- FEATURED RESTAURANTS -->

	<section class="section" id="featured-restaurants">

		<h2 class="section-title">
			Featured <span>Restaurants</span>
		</h2>

		<div class="restaurant-grid">

			<%
		List<Restaurant> allRestaurants = (List<Restaurant>)request.getAttribute("allRestaurants");

		for(Restaurant restaurant: allRestaurants) {
	%>

			<a
				href="<%= request.getContextPath() %>/menu?restaurantId=<%= restaurant.getRestaurantId()%> ">
				<div class="restaurant-card">
					<img src="<%= restaurant.getImagePath()%>">
					<div class="restaurant-content">
						<h3><%= restaurant.getRestaurantName() %></h3>
						<p><%= restaurant.getCuisineType()%></p>
						<p><%= restaurant.getDeliveryTime()%>
							minutes
						</p>
						<p><%= restaurant.getAddress()%></p>
						<div class="rating">
							⭐
							<%= restaurant.getRating()%></div>
					</div>
				</div>
			</a>

			<%
	}
	%>

		</div>

	</section>



	<!-- FOOTER -->

	<footer class="footer"> © 2026 FoodieExpress. All Rights
		Reserved. </footer>
</body>
</html>