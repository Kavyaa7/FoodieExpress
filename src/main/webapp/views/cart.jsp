<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="com.tap.model.Cart"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your Cart | FoodieExpress</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cart.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


<style>
/* {
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
	position: sticky;
	top: 0;
	z-index: 100;
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
	margin: 35px auto;
}

.page-title {
	margin-bottom: 25px;
}

.page-title h1 {
	font-size: 2rem;
	margin-bottom: 8px;
}

.page-title p {
	color: #6c757d;
}


.cart-item {
	background: #fff;
	border-radius: 22px;
	padding: 22px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 22px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .06);
	transition: .25s;
}

.cart-item:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, .08);
}

.item-details h3 {
	font-size: 20px;
	margin-bottom: 6px;
}

.price {
	color: #FFC107;
	font-weight: 700;
	font-size: 18px;
}


#remove-btn {
	width: 100px;
	border-radius: 12px;
}

.quantity {
	display: flex;
	align-items: center;
	gap: 15px;
}

.quantity button {
	width: 36px;
	height: 36px;
	border: none;
	border-radius: 50%;
	background: #FFC107;
	cursor: pointer;
	font-size: 18px;
	font-weight: bold;
	transition: .2s;
}

.quantity button:hover {
	background: #E0A800;
}

.quantity span {
	font-size: 18px;
	font-weight: 600;
}

.item-total {
	font-size: 20px;
	font-weight: 700;
	color: #212529;
}


.empty-cart {
	background: #fff;
	border-radius: 24px;
	padding: 70px 30px;
	text-align: center;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .06);
}

.empty-cart i {
	font-size: 70px;
	color: #FFC107;
	margin-bottom: 20px;
}

.empty-cart h2 {
	margin-bottom: 10px;
}

.empty-cart p {
	color: #6c757d;
	margin-bottom: 30px;
}


.btn {
	background: #FFC107;
	color: #212529;
	border: none;
	padding: 14px 28px;
	border-radius: 12px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: .25s;
}

.btn:hover {
	background: #E0A800;
}

.cart-actions {
	margin-top: 35px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	gap: 15px;
}


.summary {
	margin-top: 30px;
	background: #fff;
	border-radius: 22px;
	padding: 25px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, .06);
}

.summary-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 15px;
	font-size: 17px;
}

.summary-row.total {
	border-top: 1px solid #eee;
	padding-top: 18px;
	margin-top: 18px;
	font-size: 22px;
	font-weight: 700;
}

@media ( max-width :768px) {
	.cart-item {
		flex-direction: column;
		align-items: flex-start;
		gap: 20px;
	}
	.cart-actions {
		flex-direction: column;
	}
	.btn {
		width: 100%;
	}
} */
</style>

</head>
<body>

	<%
	Cart cart = (Cart) session.getAttribute("cart");
	Integer restaurantId = (Integer) session.getAttribute("restaurantId");
	%>

	<nav class="navbar">

		<div class="logo">Foodie<span>Express</span></div>

		<ul class="nav-links">
			<li><a href="<%=request.getContextPath()%>/home.jsp">Home</a></li>
			<li><a href="orderHistory.jsp">Orders</a></li>
			<li><a href="#">Profile</a></li>
		</ul>

	</nav>


	<section class="cart-header container">

		<h1>Your Cart</h1>

		<p>Review your selected items before checkout.</p>

	</section>


	<section class="cart-layout container">

		<div class="cart-items">

			<%
			if (cart == null || cart.getCartItems().isEmpty()) {
			%>

			<div class="empty-cart">

				<i class="fa-solid fa-cart-shopping"></i>

				<h2>Your Cart is Empty</h2>

				<p>Add some delicious food to get started.</p>

				<a href="<%=request.getContextPath()%>/home" class="btn"> Browse
					Restaurants </a>

			</div>

			<%
			} else {

			float grandTotal = 0;

			for (CartItem item : cart.getCartItems().values()) {

				float itemTotal = item.getPrice() * item.getQuantity();

				grandTotal += itemTotal;
			%>

			<div class="cart-item">

				<div class="item-details">

					<h3><%=item.getName()%></h3>

					<span class="price"> ₹<%=item.getPrice()%>
					</span>

				</div>

				<div class="quantity">

					<form action="<%=request.getContextPath()%>/cart">

						<input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
						<input type="hidden" name="restaurantId"
							value="<%=item.getRestaurantId()%>">

						<%
						if (item.getQuantity() - 1 <= 0) {
						%>
						<input type="hidden" name="action" value="delete">

						<%
						} else {
						%>
						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="quantity" value="<%=item.getQuantity() - 1%>">

						<%
						}
						%>

						<button>-</button>
					</form>


					<span><%=item.getQuantity()%></span>

					<form action="<%=request.getContextPath()%>/cart">

						<input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
						<input type="hidden" name="quantity"
							value="<%=item.getQuantity() + 1%>"> <input type="hidden"
							name="restaurantId" value="<%=item.getRestaurantId()%>">
						<input type="hidden" name="action" value="update">

						<button>+</button>
					</form>

					<form action="<%=request.getContextPath()%>/cart">

						<input type="hidden" name="menuId" value="<%=item.getMenuId()%>">
						<input type="hidden" name="restaurantId"
							value="<%=item.getRestaurantId()%>"> <input type="hidden"
							name="action" value="delete">

						<button id="remove-btn">Remove</button>
					</form>

				</div>

				<div class="item-total">
					₹<%=itemTotal%>
				</div>

			</div>

			<%
			}
			%>

			<!-- CART SUMMARY -->

			<div class="summary">

				<h2>Order Summary</h2>

				<div class="summary-row">
					<span>Items Total</span> <span>₹<%=grandTotal%></span>
				</div>

			</div>

			<div class="cart-actions">

				<a
					href="<%=request.getContextPath()%>/menu?restaurantId=<%=restaurantId%>">
					<button class="btn">Add More Items</button>
				</a> <a href="checkout.jsp">
					<button class="btn">Proceed to Checkout</button>
				</a>

			</div>

			<%
			}
			%>

		</div>

	</section>

</body>
</html>