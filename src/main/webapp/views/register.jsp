<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Register — FoodieExpress</title>
<meta name="description"
	content="Create your FoodieExpress account to order food, manage your restaurant, or start delivering." />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/register.css">

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />

</head>
<body>

	<div class="page-wrapper">

		<!-- ===== LEFT — BRAND PANEL ===== -->
		<aside class="brand-panel">
			<div class="brand-logo">
				<div class="brand-logo-icon">
					<!-- Delivery Truck SVG -->
					<svg viewBox="0 0 24 24" fill="none" stroke="#111827"
						stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"
						style="width: 20px; height: 20px;">
            <rect x="1" y="3" width="15" height="13"></rect>
            <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon>
            <circle cx="5.5" cy="18.5" r="2.5"></circle>
            <circle cx="18.5" cy="18.5" r="2.5"></circle>
          </svg>
				</div>
				<div class="brand-logo-text">
					Foodie<span>Express</span>
				</div>
			</div>

			<div class="brand-hero">
				<h1>
					Delicious food,<br /> <span>delivered fast.</span>
				</h1>
				<p>Order from your favorite local restaurants, track your food
					in real-time, and experience lightning-fast delivery right to your
					doorstep.</p>
			</div>
		</aside>

		<!-- ===== RIGHT — FORM PANEL ===== -->
		<main class="form-panel">

			<div id="formContent">
				<div class="form-header">
					<h2>Create your account</h2>
					<p>
						Already registered? <a href="login.jsp" id="loginLink">Sign in
							here</a>
					</p>
				</div>

				<!-- FORM -->
				<form id="registerForm" novalidate autocomplete="off"
					action="<%=request.getContextPath()%>/registerServlet"
					method="post">


					<!-- ROLE SELECTOR -->
					<p class="section-label">I am joining as</p>
					<div class="role-selector" role="group"
						aria-label="Select your role">
						<div class="role-option">
							<input type="radio" name="role" id="role-customer"
								value="customer" checked /> <label class="role-label"
								for="role-customer"> <!-- Shopping Bag SVG --> <svg
									class="role-icon-svg" viewBox="0 0 24 24">
                  <path
										d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                  <line x1="3" y1="6" x2="21" y2="6"></line>
                  <path d="M16 10a4 4 0 0 1-8 0"></path>
                </svg> <span>Customer</span>
							</label>
						</div>
						<div class="role-option">
							<input type="radio" name="role" id="role-restaurant"
								value="restaurant_admin" /> <label class="role-label"
								for="role-restaurant"> <!-- Cooking Pot SVG --> <svg
									class="role-icon-svg" viewBox="0 0 24 24">
                  <path d="M18 8h1a4 4 0 0 1 0 8h-1"></path>
                  <path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"></path>
                  <line x1="6" y1="2" x2="6" y2="5"></line>
                  <line x1="10" y1="2" x2="10" y2="5"></line>
                  <line x1="14" y1="2" x2="14" y2="5"></line>
                </svg> <span>Owner</span>
							</label>
						</div>
						<div class="role-option">
							<input type="radio" name="role" id="role-delivery"
								value="delivery_agent" /> <label class="role-label"
								for="role-delivery"> <!-- Scooter SVG --> <svg
									class="role-icon-svg" viewBox="0 0 24 24">
                  <circle cx="5" cy="18" r="3"></circle>
                  <circle cx="19" cy="18" r="3"></circle>
                  <path d="M10 18h5M12 6h5l3 5v7H9v-3"></path>
                  <polyline points="12 6 8 11 3 11"></polyline>
                </svg> <span>Agent</span>
							</label>
						</div>
					</div>

					<p class="section-label">Personal information</p>
					<div class="form-grid">

						<!-- Full Name -->
						<div class="form-group full-width">
							<label class="form-label" for="fullName">Full Name</label>
							<div class="input-wrapper">
								<!-- User SVG -->
								<svg class="input-icon-svg" viewBox="0 0 24 24">
                  <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                  <circle cx="12" cy="7" r="4"></circle>
                </svg>
								<input class="form-input" type="text" id="fullName"
									name="fullName" placeholder="e.g. Aryan Sharma" required />
							</div>
							<span class="field-error" id="nameError">⚠ Please enter
								your full name.</span>
						</div>

						<!-- Email -->
						<div class="form-group">
							<label class="form-label" for="email">Email Address</label>
							<div class="input-wrapper">
								<!-- Mail SVG -->
								<svg class="input-icon-svg" viewBox="0 0 24 24">
                  <path
										d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                  <polyline points="22,6 12,13 2,6"></polyline>
                </svg>
								<input class="form-input" type="email" id="email" name="email"
									placeholder="you@example.com" required />
							</div>
							<span class="field-error" id="emailError">⚠ Enter a valid
								email address.</span>
						</div>

						<!-- Phone -->
						<div class="form-group">
							<label class="form-label" for="phone">Phone Number</label>
							<div class="input-wrapper">
								<!-- Phone SVG -->
								<svg class="input-icon-svg" viewBox="0 0 24 24">
                  <rect x="5" y="2" width="14" height="20" rx="2" ry="2"></rect>
                  <line x1="12" y1="18" x2="12.01" y2="18"></line>
                </svg>
								<input class="form-input" type="tel" id="phone" name="phone"
									placeholder="+91 98765 43210" required />
							</div>
							<span class="field-error" id="phoneError">⚠ Enter a valid
								phone number.</span>
						</div>

						<!-- Password -->
						<div class="form-group">
							<label class="form-label" for="password">Password</label>
							<div class="input-wrapper">
								<!-- Lock SVG -->
								<svg class="input-icon-svg" viewBox="0 0 24 24">
                  <rect x="3" y="11" width="18" height="11" rx="2"
										ry="2"></rect>
                  <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                </svg>
								<input class="form-input" type="password" id="password"
									name="password" placeholder="Min. 8 characters" required />
								<button type="button" class="password-toggle"
									id="togglePassword" aria-label="Toggle password visibility">
									<span id="toggleIcon"> <!-- Eye SVG --> <svg
											viewBox="0 0 24 24">
                      <path
												d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                      <circle cx="12" cy="12" r="3"></circle>
                    </svg>
									</span>
								</button>
							</div>

							<span class="field-error" id="passwordError">⚠ Password
								must be at least 8 characters.</span>
						</div>

						<!-- Address -->
						<div class="form-group full-width">
							<label class="form-label" for="address">Address</label>
							<div class="input-wrapper">
								<!-- Map Pin SVG -->
								<svg class="input-icon-svg" viewBox="0 0 24 24"
									style="top: 12px; align-self: flex-start;">
                  <path
										d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                  <circle cx="12" cy="10" r="3"></circle>
                </svg>
								<textarea class="form-input" id="address" name="address"
									placeholder="House/Flat no., Street, City, State, Pincode"
									required></textarea>
							</div>
							<span class="field-error" id="addressError">⚠ Please enter
								your address.</span>
						</div>

					</div>
					<!-- /form-grid -->

					<!-- Terms -->
					<div class="terms-row">
						<input type="checkbox" class="terms-checkbox" id="termsCheck" />
						<label class="terms-text" for="termsCheck"> I agree to
							FoodieExpress's <a href="#">Terms</a> and <a href="#">Privacy
								Policy</a>
						</label>
					</div>
					<span class="field-error" id="termsError"
						style="margin-top: -8px; margin-bottom: 12px;">⚠ You must
						accept the terms.</span>

					<!-- Submit -->
					<button type="submit" class="btn-submit" id="submitBtn">Create
						Account →</button>
				</form>
			</div>
			<!-- /formContent -->

			<!-- SUCCESS STATE -->
			<div class="success-overlay" id="successOverlay">
				<div class="success-icon">
					<!-- Checkmark SVG -->
					<svg viewBox="0 0 24 24">
            <polyline points="20 6 9 17 4 12"></polyline>
          </svg>
				</div>
				<h3>Welcome to FoodieExpress!</h3>
				<p>Your account has been created successfully. Redirecting you
					to login…</p>
				<button class="btn-submit"
					style="max-width: 180px; margin-top: 8px;" id="goToLogin">Go
					to Login</button>
			</div>

		</main>
	</div>
	<!-- /page-wrapper -->


<script>
const togglePassword = document.getElementById('togglePassword');
const passwordInput = document.getElementById('password');

if (togglePassword && passwordInput) {
    togglePassword.addEventListener('click', function () {
        const isPassword = passwordInput.type === 'password';
        passwordInput.type = isPassword ? 'text' : 'password';
        togglePassword.setAttribute('aria-label', isPassword ? 'Hide password' : 'Show password');
    });
}
</script>
</body>
</html>


