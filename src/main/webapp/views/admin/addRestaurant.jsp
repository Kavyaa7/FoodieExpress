<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if(session.getAttribute("admin")==null){
        response.sendRedirect(request.getContextPath()+"/views/admin/adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant | FoodieExpress</title>

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

.form-container{
    width:100%;
    max-width:520px;
    background:#fff;
    padding:40px;
    border-radius:24px;
    box-shadow:0 15px 35px rgba(0,0,0,0.15);
}

h2{
    text-align:center;
    color:#222;
    margin:0 0 30px;
}

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    margin-bottom:8px;
    font-weight:500;
    color:#333;
}

.form-group input,
.form-group select,
.form-group textarea{
    width:100%;
    padding:14px 16px;
    border:1px solid #ddd;
    border-radius:12px;
    font-size:15px;
    font-family:inherit;
    box-sizing:border-box;
}

.form-group textarea{
    min-height:90px;
    resize:vertical;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus{
    outline:none;
    border-color:#FFC107;
    box-shadow:0 0 0 3px rgba(255,193,7,.2);
}

.button-row{
    display:flex;
    gap:12px;
    margin-top:24px;
}

.submit-btn,
.cancel-btn{
    flex:1;
    text-align:center;
    padding:14px;
    border:none;
    border-radius:12px;
    font-size:16px;
    font-weight:600;
    text-decoration:none;
    cursor:pointer;
}

.submit-btn{
    background:#FFC107;
    color:#222;
}

.cancel-btn{
    background:#E0E0E0;
    color:#333;
}

.submit-btn:hover{
    background:#FFB300;
}

.cancel-btn:hover{
    background:#D5D5D5;
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

<div class="form-container">

    <h2>Add Restaurant</h2>

    <form action="<%=request.getContextPath()%>/addRestaurant" method="post">

        <div class="form-group">
            <label>Restaurant Name</label>
            <input type="text" name="restaurantName" required>
        </div>

        <div class="form-group">
            <label>Address</label>
            <textarea name="address" required></textarea>
        </div>

        <div class="form-group">
            <label>Cuisine Type</label>
            <input type="text" name="cuisineType" required>
        </div>

        <div class="form-group">
            <label>Rating</label>
            <input type="number" name="rating" min="0" max="5" step="0.1" required>
        </div>

        <div class="form-group">
            <label>Delivery Time (minutes)</label>
            <input type="number" name="deliveryTime" min="1" required>
        </div>

        <div class="form-group">
            <label>Image Path</label>
            <input type="text" name="imagePath" placeholder="images/restaurant.jpg" required>
        </div>

        <div class="form-group">
            <label>Owner User ID</label>
            <input type="number" name="userId" min="1" required>
        </div>
        <div class="form-group">
            <label>Status</label>
            <select name="isActive">
                <option value="true">Active</option>
                <option value="false">Inactive</option>
            </select>
        </div>

        <div class="button-row">
            <a class="cancel-btn" href="<%=request.getContextPath()%>/adminDashboard">Cancel</a>
            <button type="submit" class="submit-btn">Add</button>
        </div>

    </form>

    <div class="footer-text">FoodieExpress Admin Portal</div>

</div>

</body>
</html>