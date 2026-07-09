<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.tap.model.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User | FoodieExpress </title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home.css">

<style>

body{
    margin:0;
    font-family:'Poppins',sans-serif;
    background:linear-gradient(135deg,#FFC107,#FFB300);
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.login-container{
    width:100%;
    max-width:420px;
    background:#fff;
    padding:40px;
    border-radius:24px;
    box-shadow:0 15px 35px rgba(0,0,0,0.15);
}

.logo{
    text-align:center;
    font-size:50px;
    margin-bottom:10px;
}

h2{
    text-align:center;
    color:#222;
    margin-bottom:5px;
}

.subtitle{
    text-align:center;
    color:#777;
    font-size:14px;
    margin-bottom:30px;
}

.form-group{
    margin-bottom:20px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:500;
    color:#333;
}

.form-group input{
    width:100%;
    padding:14px 16px;
    border:1px solid #ddd;
    border-radius:12px;
    font-size:15px;
    transition:.3s;
}

.form-group input:focus{
    outline:none;
    border-color:#FFC107;
    box-shadow:0 0 0 3px rgba(255,193,7,.2);
}

.login-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:12px;
    background:#FFC107;
    color:#222;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.login-btn:hover{
    background:#FFB300;
}

.error{
    background:#ffebee;
    color:#d32f2f;
    padding:12px;
    border-radius:10px;
    text-align:center;
    margin-bottom:20px;
}

.footer-text{
    text-align:center;
    margin-top:20px;
    color:#777;
    font-size:13px;
}

</style>

</head>
<body>

<div class="login-container">

    <div class="logo">🛡️</div>

    <h2>Edit User Details</h2>

    <%
	User user = (User)request.getAttribute("user");
	%>

    <form action="<%=request.getContextPath()%>/editUser" method="post">

		<input hidden type="number" name="userId" value="<%=user.getId()%>">
		
        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" placeholder="<%=user.getName()%>">
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" placeholder="<%=user.getEmail()%>">
        </div>
        
        <div class="form-group">
        	<select name="role">
   				<option value="customer">Customer</option>
   				<option value="delivery_agent">Delivery Agent</option>
   				<option value="restaurant_admin">Restaurant Admin</option>
			</select>
        </div>

        <button type="submit" class="login-btn">
            Update
        </button>

    </form>

    <div class="footer-text">
        FoodieExpress Admin Portal
    </div>

</div>

</body>
</html>