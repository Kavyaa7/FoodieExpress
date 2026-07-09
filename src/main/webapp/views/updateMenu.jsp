
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Menu"%>

<%
User loggedInUser = (User) session.getAttribute("loggedInUser");

if (loggedInUser == null || !"restaurant_admin".equalsIgnoreCase(loggedInUser.getRole())) {
	response.sendRedirect(request.getContextPath() + "/views/login.jsp");
	return;
}

Menu menu = (Menu) request.getAttribute("menu");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Menu Item</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home.css">

<style>
/* Page Specific CSS */

body{
	background:#F3F4F6;
	font-family:'Poppins',sans-serif;
}

.form-container{
	max-width:700px;
	margin:50px auto;
	background:#fff;
	padding:35px;
	border-radius:24px;
	box-shadow:0 8px 20px rgba(0,0,0,.08);
}

.form-title{
	text-align:center;
	margin-bottom:30px;
}

.form-title h2{
	margin:0;
	color:#222;
}

.form-title p{
	color:#666;
	margin-top:8px;
}

.form-group{
	margin-bottom:22px;
}

.form-group label{
	display:block;
	margin-bottom:8px;
	font-weight:600;
	color:#333;
}

.form-group input,
.form-group textarea,
.form-group select{
	width:100%;
	padding:14px;
	border:1px solid #ddd;
	border-radius:14px;
	font-size:15px;
	font-family:inherit;
	outline:none;
}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus{
	border-color:#FFC107;
}

.form-group textarea{
	min-height:120px;
	resize:vertical;
}

.button-group{
	display:flex;
	justify-content:space-between;
	margin-top:30px;
}

.update-btn,
.cancel-btn{
	padding:14px 28px;
	border:none;
	border-radius:14px;
	font-size:15px;
	font-weight:600;
	cursor:pointer;
	text-decoration:none;
}

.update-btn{
	background:#FFC107;
	color:#222;
}

.update-btn:hover{
	background:#FFB300;
}

.cancel-btn{
	background:#E0E0E0;
	color:#333;
}

.cancel-btn:hover{
	background:#D5D5D5;
}

</style>

</head>

<body>

<div class="form-container">

	<div class="form-title">
		<h2>Update Menu Item</h2>
		<p>Edit the details below.</p>
	</div>

	<form action="<%=request.getContextPath()%>/updateMenu" method="post">

		<input type="hidden"
			name="menuId"
			value="<%=menu.getMenuId()%>">

		<input type="hidden"
			name="restaurantId"
			value="<%=menu.getRestaurantId()%>">

		<div class="form-group">

			<label>Item Name</label>

			<input
				type="text"
				name="itemName"
				value="<%=menu.getItemName()%>"
				required>

		</div>

		<div class="form-group">

			<label>Description</label>

			<textarea
				name="description"
				required><%=menu.getDescription()%></textarea>

		</div>

		<div class="form-group">

			<label>Price (₹)</label>

			<input
				type="number"
				name="price"
				min="1"
				step="0.5"
				value="<%=menu.getPrice()%>"
				required>

		</div>

		<div class="form-group">

			<label>Image URL / Image Path</label>

			<input
				type="text"
				name="imageUrl"
				value="<%=menu.getImageUrl()%>"
				required>

		</div>

		<div class="form-group">

			<label>Availability</label>

			<select name="isAvailable">

				<option value="true"
				<%=menu.isAvailable() ? "selected" : ""%>>
					Available
				</option>

				<option value="false"
				<%=!menu.isAvailable() ? "selected" : ""%>>
					Unavailable
				</option>

			</select>

		</div>

		<div class="button-group">

			<a class="cancel-btn"
				href="<%=request.getContextPath()%>/restaurantDashboard">
				Cancel
			</a>

			<button class="update-btn" type="submit">
				Update Menu Item
			</button>

		</div>

	</form>

</div>

</body>
</html>

