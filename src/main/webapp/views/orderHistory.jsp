<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@page import="com.tap.DAOImpl.OrderDAOImpl"%>
<%@ page
	import="com.tap.model.Order, com.tap.model.User, com.tap.model.Restaurant, com.tap.DAOImpl.RestaurantDAOImpl"%>

<%
User user = (User) session.getAttribute("loggedInUser");
int userId = user.getId();
OrderDAOImpl orderDao = new OrderDAOImpl();
List<Order> orders = orderDao.getOrderByUser(userId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders | FoodieExpress</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/orderHistory.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: #F8F9FA;
	color: #212529;
}


.navbar {
	background: #fff;
	padding: 18px 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .08);
}

.logo {
	font-size: 28px;
	font-weight: 700;
}

.logo span {
	color: #FFC107;
}

.nav-links {
	list-style: none;
	display: flex;
	gap: 30px;
}

.nav-links a {
	text-decoration: none;
	color: #212529;
	font-weight: 600;
}

.nav-links a:hover {
	color: #FFC107;
}


.container {
	width: 90%;
	max-width: 1200px;
	margin: 40px auto;
}

.page-title {
	margin-bottom: 30px;
}

.page-title h1 {
	font-size: 2rem;
}

.page-title p {
	color: #6C757D;
}


.empty-orders {
	background: #fff;
	border-radius: 22px;
	padding: 60px;
	text-align: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .08);
}

.empty-orders i {
	font-size: 60px;
	color: #FFC107;
	margin-bottom: 20px;
}


.order-card {
	background: #fff;
	border-radius: 20px;
	padding: 25px;
	margin-bottom: 25px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .08);
	transition: .3s;
}

.order-card:hover {
	transform: translateY(-3px);
}

.order-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.order-id {
	font-size: 22px;
	font-weight: 700;
}

.status {
	padding: 8px 18px;
	border-radius: 30px;
	font-size: 14px;
	font-weight: 600;
}

.delivered {
	background: #DCFCE7;
	color: #166534;
}

.pending {
	background: #FEF3C7;
	color: #92400E;
}

.cancelled {
	background: #FEE2E2;
	color: #991B1B;
}

.order-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px;
}

.order-item {
	background: #FFFDF5;
	border: 1px solid #FFE082;
	border-radius: 15px;
	padding: 15px;
}

.order-item label {
	display: block;
	color: #6C757D;
	margin-bottom: 6px;
	font-size: 14px;
}

.order-item span {
	font-weight: 600;
}*/
</style>

</head>
<body>

	<nav class="navbar">

		<div class="logo">
			Foodie<span>Express</span>
		</div>

		<ul class="nav-links">
			<li><a href="home">Home</a></li>
			<li><a href="cart">Cart</a></li>
			<li><a href="profile">Profile</a></li>
		</ul>

	</nav>

	<div class="container">

		<div class="page-title">

			<h1>My Orders</h1>

			<p>Track all your previous orders.</p>

		</div>

		<%
		if (orders == null || orders.isEmpty()) {
		%>

		<div class="empty-orders">

			<i class="fa-solid fa-box-open"></i>

			<h2>No Orders Yet</h2>

			<p>You haven't placed any orders.</p>

		</div>

		<%
		} else {

		for (Order order : orders) {
		%>

		<div class="order-card">

			<div class="order-header">

				<div class="order-id">

					Order #<%=order.getOrderId()%>

				</div>

				<div class="status delivered">

					<%=order.getStatus()%>

				</div>

			</div>

			<div class="order-grid">

				<div class="order-item">

					<%
					RestaurantDAOImpl restaurantDao = new RestaurantDAOImpl();
					Restaurant restaurant = restaurantDao.getRestaurant(order.getRestaurantId());
					%>
					<label>Restaurant</label> <span><%=restaurant.getRestaurantName()%></span>

				</div>

				<div class="order-item">

					<label>Order Date</label> <span><%=order.getOrderDate()%></span>

				</div>

				<div class="order-item">

					<label>Total Amount</label> <span>₹<%=order.getTotalAmount()%></span>

				</div>

				<div class="order-item">

					<label>Payment Method</label> <span><%=order.getPaymentMethod()%></span>

				</div>

			</div>

		</div>

		<%
		}
		}
		%>

	</div>

</body>
</html>