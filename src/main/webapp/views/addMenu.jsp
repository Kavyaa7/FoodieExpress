<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Restaurant, com.tap.model.User"%>

<%
User loggedInUser = (User) session.getAttribute("loggedInUser");

if (loggedInUser == null || !"restaurant_admin".equalsIgnoreCase(loggedInUser.getRole())) {
	response.sendRedirect(request.getContextPath() + "/views/login.jsp");
	return;
}

Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Menu Item</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home.css">

<style>

body {
	background: #F3F4F6;
	font-family: 'Poppins', sans-serif;
}

.form-container {
	max-width: 700px;
	margin: 50px auto;
	background: #fff;
	padding: 35px;
	border-radius: 24px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, .08);
}

.form-title {
	text-align: center;
	margin-bottom: 30px;
}

.form-title h2 {
	margin-bottom: 8px;
	color: #222;
}

.form-title p {
	color: #666;
}

.form-group {
	margin-bottom: 22px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #333;
}

.form-group input, .form-group textarea, .form-group select {
	width: 100%;
	padding: 14px;
	border: 1px solid #ddd;
	border-radius: 14px;
	font-size: 15px;
	font-family: inherit;
	outline: none;
}

.form-group textarea {
	resize: vertical;
	min-height: 120px;
}

.form-group input:focus, .form-group textarea:focus, .form-group select:focus
	{
	border-color: #FFC107;
}

.button-group {
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
}

.submit-btn, .cancel-btn {
	text-decoration: none;
	padding: 14px 28px;
	border: none;
	border-radius: 14px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
}

.submit-btn {
	background: #FFC107;
	color: #222;
}

.submit-btn:hover {
	background: #FFB300;
}

.cancel-btn {
	background: #E0E0E0;
	color: #333;
}

.cancel-btn:hover {
	background: #D5D5D5;
}
</style>

</head>

<body>

	<div class="form-container">

		<div class="form-title">

			<h2>Add Menu Item</h2>

			<p>
				<%
					if(restaurant!=null){
				%>
				Restaurant : <strong><%=restaurant.getRestaurantName()%></strong>
				
				<% } %>
			</p>

		</div>

		<form action="<%=request.getContextPath()%>/addMenu" method="post">

			<input type="hidden" name="restaurantId"
				value="<%=restaurant.getRestaurantId()%>">

			<div class="form-group">

				<label>Item Name</label> <input type="text" name="itemName" required>

			</div>

			<div class="form-group">

				<label>Description</label>

				<textarea name="description" required></textarea>

			</div>

			<div class="form-group">

				<label>Price (₹)</label> <input type="number" name="price" min="1"
					step="0.5" required>

			</div>

			<div class="form-group">

				<label>Category</label> <select name="category" required>

					<option value="">Select Category</option>

					<option value="Veg">Veg</option>

					<option value="Non-Veg">Non-Veg</option>

					<option value="Beverage">Beverage</option>

					<option value="Dessert">Dessert</option>

					<option value="Fast Food">Fast Food</option>

					<option value="Main Course">Main Course</option>

				</select>

			</div>

			<div class="form-group">

				<label>Image URL / Image Path</label> <input type="text"
					name="imageUrl" placeholder="images/burger.jpg" required>

			</div>

			<div class="form-group">

				<label>Availability</label> <select name="isAvailable">

					<option value="true">Available</option>

					<option value="false">Unavailable</option>

				</select>

			</div>

			<div class="button-group">

				<a class="cancel-btn"
					href="<%=request.getContextPath()%>/restaurantDashboard">
					Cancel </a>

				<button class="submit-btn" type="submit">Add Menu Item</button>

			</div>

		</form>

	</div>

</body>
</html>
