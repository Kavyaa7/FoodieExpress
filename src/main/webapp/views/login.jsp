<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login — FoodieExpress</title>
<meta name="description"
	content="Sign in to your FoodieExpress account to order food, manage your restaurant, or deliver orders." />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">



</head>
<body>

	<div class="container">

		<div class="left-side">
			<h1>
				Foodie<span>Express</span>
			</h1>
			<p>Log in to access your orders, track your delivery agent, and
				explore new tastes around the city.</p>
		</div>

		<div class="right-side">
			<h2>Sign In</h2>
			<p>
				New to FoodieExpress? <a href="${pageContext.request.contextPath}/views/register.jsp">Create an
					account</a>
			</p>

			<form id="loginForm"
				action="<%=request.getContextPath()%>/loginServlet" method="post">

				<div class="form-group">
					<label for="email">Email Address</label> <input type="email"
						id="email" name="email" placeholder="example@email.com"> <span
						class="error-msg" id="emailError">Please enter a valid
						email address.</span>
				</div>

				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						id="password" name="password" placeholder="Enter your password">
					<span class="error-msg" id="passwordError">Please enter your
						password.</span>
				</div>

				<button type="submit" class="btn-submit">Login</button>
			</form>
		</div>

	</div>

</body>
</html>


