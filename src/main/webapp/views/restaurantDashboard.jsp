<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page import="com.tap.model.Menu"%>

<%
User loggedInUser = (User) session.getAttribute("loggedInUser");

if (loggedInUser == null || !"restaurant_admin".equalsIgnoreCase(loggedInUser.getRole())) {
	response.sendRedirect(request.getContextPath() + "/views/login.jsp");
	return;
}

Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
List<Menu> menu = (List<Menu>) request.getAttribute("menu");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/home.css">

<style>

.dashboard-header{
	display:flex;
	justify-content:space-between;
	align-items:center;
	margin:35px auto 20px;
	flex-wrap:wrap;
	gap:15px;
}

.restaurant-info h1{
	font-size:32px;
	margin-bottom:5px;
	color:#222;
}

.restaurant-info p{
	color:#666;
	font-size:15px;
}

.add-btn{
	background:#FFC107;
	color:#222;
	padding:12px 24px;
	border-radius:14px;
	text-decoration:none;
	font-weight:600;
	box-shadow:0 6px 15px rgba(0,0,0,.1);
	transition:.3s;
}

.add-btn:hover{
	background:#FFB300;
	transform:translateY(-2px);
}

.menu-grid{
	display:grid;
	grid-template-columns:repeat(auto-fill,minmax(320px,1fr));
	gap:25px;
	margin-top:25px;
}

.menu-card{
	background:#fff;
	border-radius:22px;
	overflow:hidden;
	box-shadow:0 8px 20px rgba(0,0,0,.08);
	transition:.3s;
}

.menu-card:hover{
	transform:translateY(-6px);
}

.menu-card img{
	width:100%;
	height:220px;
	object-fit:cover;
}

.menu-content{
	padding:18px;
}

.menu-content h3{
	margin:0;
	color:#222;
}

.description{
	color:#666;
	font-size:14px;
	margin:10px 0;
	height:40px;
}

.price{
	font-size:22px;
	font-weight:700;
	color:#FF9800;
	margin:10px 0;
}

.badges{
	display:flex;
	gap:10px;
	margin:12px 0;
	flex-wrap:wrap;
}

.badge{
	background:#f4f4f4;
	padding:6px 12px;
	border-radius:20px;
	font-size:13px;
	font-weight:500;
}

.actions{
	display:flex;
	justify-content:space-between;
	margin-top:20px;
}

.update-btn,
.delete-btn{

	width:48%;
	padding:10px;
	border-radius:12px;
	text-align:center;
	text-decoration:none;
	font-weight:600;
	color:white;
}

.update-btn{
	background:#2196F3;
}

.update-btn:hover{
	background:#1976D2;
}

.delete-btn{
	background:#F44336;
}

.delete-btn:hover{
	background:#D32F2F;
}

.empty{
	text-align:center;
	padding:80px;
	background:#fff;
	border-radius:20px;
	box-shadow:0 8px 20px rgba(0,0,0,.08);
	color:#666;
	font-size:18px;
}

</style>

</head>

<body>

<div class="container">

	<div class="dashboard-header">

		<div class="restaurant-info">

			<h1><%=restaurant.getRestaurantName()%></h1>

			<p>
				Manage your restaurant menu items.
			</p>

		</div>

		<div>

			<a class="add-btn"
				href="<%= request.getContextPath() %>/addMenu?restaurantId=<%= restaurant.getRestaurantId()%>">
				+ Add Menu Item
			</a>

		</div>

	</div>

	<%
	if(menu!=null && !menu.isEmpty()){
	%>

	<div class="menu-grid">

	<%
	for(Menu menuItem : menu){
	%>

		<div class="menu-card">

			<img src="<%=menuItem.getImageUrl()%>"
				alt="<%=menuItem.getItemName()%>">

			<div class="menu-content">

				<h3><%=menuItem.getItemName()%></h3>

				<p class="description">
					<%=menuItem.getDescription()%>
				</p>

				<div class="price">
					₹ <%=menuItem.getPrice()%>
				</div>

				<div class="badges">

					<span class="badge">
						<%=restaurant.getCuisineType()%>
					</span>

					<span class="badge">
						<%=menuItem.isAvailable() ? "Available" : "Unavailable"%>
					</span>

				</div>

				<div class="actions">

					<a class="update-btn"
						href="<%=request.getContextPath()%>/updateMenu?menuId=<%=menuItem.getMenuId()%>">
						Update
					</a>

					<a class="delete-btn"
						href="<%=request.getContextPath()%>/deleteMenu?menuId=<%=menuItem.getMenuId()%>"
						onclick="return confirm('Delete this menu item?');">
						Delete
					</a>

				</div>

			</div>

		</div>

	<%
	}
	%>

	</div>

	<%
	}
	else{
	%>

	<div class="empty">

		<h2>No Menu Items Found</h2>

		<p>
			Start by adding your first menu item.
		</p>

		<br>

		<a class="add-btn"
			href="<%= request.getContextPath() %>/addMenu?restaurantId=<%= restaurant.getRestaurantId()%>">
			Add Menu Item
		</a>

	</div>

	<%
	}
	%>

</div>

</body>
</html>
