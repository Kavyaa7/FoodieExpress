<%@page import="com.tap.DAOImpl.RestaurantDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.User, com.tap.DAOImpl.RestaurantDAOImpl, com.tap.DAOImpl.UserDAOImpl"%>
<%@ page import="com.tap.model.Order, com.tap.model.Restaurant, com.tap.model.User"%>

<%
User loggedInUser = (User) session.getAttribute("loggedInUser");

if (loggedInUser == null || !"delivery_agent".equalsIgnoreCase(loggedInUser.getRole())) {
	response.sendRedirect(request.getContextPath() + "/views/login.jsp");
	return;
}

List<Order> orderList = (List<Order>) request.getAttribute("confirmedOrders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delivery Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home.css">

<style>

.container{
	width:95%;
	max-width:1300px;
	margin:40px auto;
}

.page-title{
	display:flex;
	justify-content:space-between;
	align-items:center;
	margin-bottom:30px;
	flex-wrap:wrap;
}

.page-title h1{
	margin:0;
	color:#222;
}

.order-grid{
	display:grid;
	grid-template-columns:repeat(auto-fill,minmax(380px,1fr));
	gap:25px;
}

.order-card{
	background:#fff;
	border-radius:22px;
	padding:25px;
	box-shadow:0 8px 20px rgba(0,0,0,.08);
	transition:.3s;
}

.order-card:hover{
	transform:translateY(-5px);
}

.order-header{
	display:flex;
	justify-content:space-between;
	align-items:center;
	margin-bottom:20px;
}

.order-number{
	font-size:22px;
	font-weight:700;
	color:#222;
}

.status{
	background:#FFF3CD;
	color:#856404;
	padding:6px 14px;
	border-radius:30px;
	font-size:13px;
	font-weight:600;
}

.detail{
	margin:12px 0;
	color:#555;
	line-height:1.6;
}

.detail strong{
	color:#222;
}

.amount{
	margin-top:20px;
	font-size:18px;
	font-weight:700;
	color:#2E7D32;
}

.earning{
	margin-top:8px;
	font-size:17px;
	font-weight:600;
	color:#FF9800;
}

.actions{
	display:flex;
	gap:15px;
	margin-top:25px;
}

.accept-btn,
.reject-btn,
.delivery-btn{

	flex:1;
	padding:12px;
	border:none;
	border-radius:14px;
	text-decoration:none;
	text-align:center;
	font-weight:600;
	cursor:pointer;
	transition:.3s;
}

.accept-btn{
	background:#4CAF50;
	color:white;
}

.accept-btn:hover{
	background:#43A047;
}

.reject-btn{
	background:#F44336;
	color:white;
}

.reject-btn:hover{
	background:#D32F2F;
}

.delivery-btn{
	background:#2196F3;
	color:white;
	cursor:default;
}

.empty{
	background:#fff;
	padding:60px;
	border-radius:20px;
	text-align:center;
	color:#666;
	box-shadow:0 8px 20px rgba(0,0,0,.08);
}

</style>

</head>

<body>

<div class="container">

	<div class="page-title">

		<h1>Delivery Dashboard</h1>

		<h3>
			Welcome,
			<%=loggedInUser.getName()%>
		</h3>

	</div>

	<%
	if(orderList!=null && !orderList.isEmpty()){
	%>

	<div class="order-grid">

	<%
	for(Order order : orderList){
		
		int restaurantId = order.getRestaurantId();
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		Restaurant restaurant = restaurantDAOImpl.getRestaurant(restaurantId);
		
		int userId  = order.getUserId();
		UserDAOImpl UserDAOImpl = new UserDAOImpl();
		User user = UserDAOImpl.getUser(userId);

		double earning;

		if(order.getTotalAmount()<300)
			earning=30;
		else if(order.getTotalAmount()<600)
			earning=40;
		else
			earning=60;
	%>

	<div class="order-card">

		<div class="order-header">

			<div class="order-number">
				Order #<%=order.getOrderId()%>
			</div>

			<div class="status">
				<%=order.getStatus()%>
			</div>

		</div>

		<div class="detail">
			<strong>Restaurant :</strong>
			<%=restaurant.getRestaurantName()%>
		</div>

		<div class="detail">
			<strong>Restaurant Address :</strong><br>
			<%=restaurant.getAddress()%>
		</div>

		<div class="detail">
			<strong>Customer Address :</strong><br>
			<%=user.getAddress()%>
		</div>

		<div class="amount">
			Order Amount : ₹ <%=order.getTotalAmount()%>
		</div>

		<div class="earning">
			Your Earnings : ₹ <%=earning%>
		</div>

		<div class="actions">

		<%
		if("OUT_FOR_DELIVERY".equalsIgnoreCase(order.getStatus())){
		%>

			<button class="delivery-btn">
				Out For Delivery
			</button>

		<%
		}else{
		%>

			<a class="accept-btn"
				href="<%=request.getContextPath()%>/acceptOrder?orderId=<%=order.getOrderId()%>">
				Accept
			</a>

			<a class="reject-btn"
				href="<%=request.getContextPath()%>/rejectOrder?orderId=<%=order.getOrderId()%>">
				Reject
			</a>

		<%
		}
		%>

		</div>

	</div>

	<%
	}
	%>

	</div>

	<%
	}else{
	%>

	<div class="empty">

		<h2>No Orders Available</h2>

		<p>
			There are currently no confirmed orders waiting to be accepted.
		</p>

	</div>

	<%
	}
	%>

</div>

</body>
</html>
