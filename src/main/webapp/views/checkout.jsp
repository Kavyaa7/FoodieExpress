<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="java.util.Map"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Checkout | FoodieExpress</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/checkout.css">


<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
/* * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f8f9fa;
	color: #333;
}

.navbar {
	height: 75px;
	background: #FFC107;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 70px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .1);
}

.logo {
	font-size: 28px;
	font-weight: 700;
	color: #fff;
}

.nav-links {
	display: flex;
	gap: 35px;
	list-style: none;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-weight: 500;
	transition: .3s;
}

.nav-links a:hover {
	color: #212529;
}

.checkout-header {
	width: 90%;
	max-width: 1200px;
	margin: 40px auto 20px;
}

.checkout-header h1 {
	font-size: 38px;
	font-weight: 700;
	color: #212529;
}

.checkout-header p {
	color: #666;
	margin-top: 10px;
}

.checkout-container {
	width: 90%;
	max-width: 1200px;
	margin: 20px auto 60px;
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 30px;
}

.checkout-card, .summary-card {
	background: #fff;
	border-radius: 24px;
	padding: 35px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .08);
}

.checkout-card h2, .summary-card h2 {
	margin-bottom: 30px;
	font-size: 24px;
	color: #212529;
}

.form-group {
	margin-bottom: 22px;
}

.form-group label {
	display: block;
	margin-bottom: 10px;
	font-weight: 600;
	color: #444;
}

.form-group input, .form-group textarea, .form-group select {
	width: 100%;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 14px;
	font-size: 15px;
	transition: .3s;
	background: #fafafa;
}

.form-group input:focus, .form-group textarea:focus, .form-group select:focus
	{
	outline: none;
	border-color: #FFC107;
	background: white;
	box-shadow: 0 0 0 3px rgba(255, 193, 7, .2);
}

.place-btn {
	width: 100%;
	padding: 16px;
	border: none;
	border-radius: 14px;
	background: #FFC107;
	color: #212529;
	font-size: 17px;
	font-weight: 700;
	cursor: pointer;
	transition: .3s;
	margin-top: 10px;
}

.place-btn:hover {
	background: #FFB300;
	transform: translateY(-2px);
}

.back-btn {
	display: block;
	text-align: center;
	margin-top: 18px;
	text-decoration: none;
	color: #555;
	font-weight: 600;
}

.back-btn:hover {
	color: #FFC107;
}

.summary-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 16px 0;
	border-bottom: 1px solid #eee;
}

.summary-item strong {
	color: #212529;
}

.price-details {
	margin-top: 25px;
}

.price-row {
	display: flex;
	justify-content: space-between;
	margin: 15px 0;
	color: #555;
}

.total-row {
	display: flex;
	justify-content: space-between;
	margin-top: 25px;
	padding-top: 20px;
	border-top: 2px dashed #ddd;
	font-size: 22px;
	font-weight: 700;
	color: #212529;
}

.total-row span:last-child {
	color: #FFC107;
}

.nav-links{

    gap:20px;
}

.checkout-header h1{

    font-size:30px;
}

} 
@media(max-width:900px){

.checkout-container{

    grid-template-columns:1fr;
}

.navbar{

    flex-direction:column;
    height:auto;
    padding:20px;
    gap:15px;
}*/
</style>

</head>

<%
Cart cart = (Cart) session.getAttribute("cart");
Map<Integer, CartItem> items = cart.getCartItems();

float grandTotal = 0;
float platformFees = 20f;
float deliveryFees = 40f;
float finalAmount = 0f;

if (cart != null && !cart.getCartItems().isEmpty()) {
	for (CartItem item : items.values()) {
		grandTotal += item.getPrice() * item.getQuantity();
	}

	finalAmount = grandTotal + platformFees + deliveryFees;
	session.setAttribute("finalAmount", finalAmount);
}
%>

<body>

	<!-- NAVBAR -->

	<nav class="navbar">

		<div class="logo">FoodieExpress</div>

		<ul class="nav-links">
			<li><a href="home.jsp">Home</a></li>
			<li><a href="cart.jsp">Cart</a></li>
			<li><a href="#">Profile</a></li>
		</ul>

	</nav>

	<!-- HEADER -->

	<section class="checkout-header container">

		<h1>Checkout</h1>

		<p>Confirm your delivery details and payment method.</p>

	</section>

	<div class="checkout-container">

		<!-- LEFT -->

		<div class="checkout-card">

			<h2>Delivery Details</h2>

			<form action="<%=request.getContextPath()%>/placeOrder" method="post">

				<div class="form-group">
					<label>Full Name</label> <input type="text" name="name" required>
				</div>

				<div class="form-group">
					<label>Phone Number</label> <input type="text" name="phone"
						required>
				</div>

				<div class="form-group">
					<label>Delivery Address</label>
					<textarea name="address" rows="4" required></textarea>
				</div>

				<div class="form-group">
					<label>Payment Method</label> <select name="paymentMethod">
						<option value="Cash on Delivery">Cash on Delivery</option>
						<option value="UPI">UPI</option>
						<option value="Credit Card">Credit Card</option>
						<option value="Debit Card">Debit Card</option>
					</select>
				</div>


				<button class="place-btn" type="submit">Place Order</button>
				<a href="cart.jsp" class="back-btn">Back to cart</a>

			</form>

		</div>

		<!-- RIGHT -->

		<div class="summary-card">

			<h2>Order Summary</h2>

			<%
			for (CartItem item : items.values()) {
			%>

			<div class="summary-item">

				<div>
					<strong><%=item.getName()%></strong><br> Qty :
					<%=item.getQuantity()%>
				</div>

				<span> ₹<%=item.getPrice() * item.getQuantity()%>
				</span>

			</div>

			<%
			}
			%>

			<hr>

			<div class="price-details">

				<div class="price-row">
					<span>Cart Total</span> <span>₹<%=grandTotal%></span>
				</div>

				<div class="price-row">
					<span>Platform Fee</span> <span>₹<%=platformFees%></span>
				</div>

				<div class="price-row">
					<span>Delivery Fee</span> <span>₹<%=deliveryFees%></span>
				</div>

				<div class="total-row">
					<span>Grand Total</span> <span>₹<%=finalAmount%></span>
				</div>

			</div>

		</div>

	</div>


</body>
</html>