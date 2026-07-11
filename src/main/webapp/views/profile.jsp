<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.User"%>

<%
User user = (User) session.getAttribute("loggedInUser");

if (user == null) {
	response.sendRedirect(request.getContextPath() + "/views/login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile | FoodieExpress</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/profile.css">

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
	background: #f7f7f7;
}


.navbar {
	background: #FFC107;
	padding: 18px 70px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 15px rgba(0, 0, 0, .1);
}

.logo {
	color: white;
	font-size: 28px;
	font-weight: 700;
}

.nav-links {
	display: flex;
	list-style: none;
	gap: 35px;
}

.nav-links a {
	color: white;
	text-decoration: none;
	font-weight: 500;
}

.nav-links a:hover {
	color: #212529;
}


.profile-container {
	width: 90%;
	max-width: 700px;
	margin: 50px auto;
}

.profile-card {
	background: white;
	border-radius: 24px;
	padding: 40px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, .08);
}

.profile-header {
	text-align: center;
	margin-bottom: 35px;
}

.profile-avatar {
	width: 90px;
	height: 90px;
	background: #FFC107;
	color: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 36px;
	font-weight: 700;
	margin: auto;
}

.profile-header h2 {
	margin-top: 15px;
	color: #333;
}

.form-group {
	margin-bottom: 22px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #555;
}

.form-group input, .form-group textarea {
	width: 100%;
	padding: 14px;
	border: 1px solid #ddd;
	border-radius: 14px;
	font-size: 15px;
	outline: none;
	transition: .3s;
}

.form-group input:focus, .form-group textarea:focus {
	border-color: #FFC107;
	box-shadow: 0 0 0 3px rgba(255, 193, 7, .2);
}

.readonly {
	background: #f3f3f3;
}

.btn-container {
	display: flex;
	gap: 15px;
	margin-top: 30px;
}

.update-btn {
	flex: 1;
	background: #FFC107;
	color: #212529;
	border: none;
	padding: 15px;
	border-radius: 14px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	transition: .3s;
}

.update-btn:hover {
	background: #FFB300;
}

.cancel-btn {
	flex: 1;
	text-decoration: none;
	text-align: center;
	padding: 15px;
	border-radius: 14px;
	background: #ececec;
	color: #333;
	font-weight: 600;
}

.cancel-btn:hover {
	background: #ddd;
} 


@media ( max-width :768px) {
	.navbar {
		flex-direction: column;
		gap: 15px;
		padding: 20px;
	}
	.nav-links {
		gap: 20px;
	}
	.profile-card {
		padding: 30px;
	}
	.btn-container {
		flex-direction: column;
	}
}*/

</style>

</head>

<body>

	<nav class="navbar">

		<div class="logo">🍔 FoodieExpress</div>

		<ul class="nav-links">
			<li><a href="<%=request.getContextPath()%>/home.jsp">Home</a></li>
			<li><a href="orderHistory.jsp">Orders</a></li>
			<li><a href="cart.jsp">Cart</a></li>
		</ul>

	</nav>

	<div class="profile-container">

		<div class="profile-card">

			<div class="profile-header">

				<div class="profile-avatar">
					<%=user.getName().substring(0, 1).toUpperCase()%>
				</div>

				<h2>My Profile</h2>

			</div>

			<form action="<%=request.getContextPath()%>/updateProfile"
				method="post">

				<div class="form-group">

					<label>Username</label> <input type="text" name="name"
						value="<%=user.getName()%>" required>

				</div>

				<div class="form-group">

					<label>Email</label> <input class="readonly" type="email"
						value="<%=user.getEmail()%>" readonly>

				</div>

				<div class="form-group">

					<label>Phone Number</label> <input type="text" name="phone"
						value="<%=user.getPhoneNumber()%>">

				</div>

				<div class="form-group">

					<label>Address</label>

					<textarea name="address" rows="4"><%=user.getAddress()%></textarea>

				</div>

				<div class="form-group">

					<label>Role</label> <input class="readonly" type="text"
						value="<%=user.getRole()%>" readonly>

				</div>

				<div class="btn-container">

					<button class="update-btn" type="submit">Update Profile</button>

					<a href="home.jsp" class="cancel-btn"> Cancel </a>

				</div>

			</form>

		</div>

	</div>

</body>
</html>