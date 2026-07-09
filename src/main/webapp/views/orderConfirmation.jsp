<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmed | FoodieExpress</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderConfirmation.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

/* *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#F8F9FA;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.confirmation-card{

    background:#fff;

    width:90%;
    max-width:550px;

    padding:50px 40px;

    border-radius:24px;

    text-align:center;

    box-shadow:0 10px 30px rgba(0,0,0,.08);
}

.success-icon{

    width:100px;
    height:100px;

    margin:auto;

    border-radius:50%;

    background:#FFF8E1;

    display:flex;
    justify-content:center;
    align-items:center;

    margin-bottom:25px;
}

.success-icon i{

    font-size:50px;

    color:#FFC107;
}

h1{

    color:#212529;

    margin-bottom:15px;
}

p{

    color:#6C757D;

    line-height:1.6;

    margin-bottom:35px;
}

.order-info{

    background:#FFFDF5;

    border:1px solid #FFE082;

    border-radius:16px;

    padding:18px;

    margin-bottom:35px;
}

.order-info h3{

    color:#FFB300;

    margin-bottom:10px;
}

.home-btn{

    display:inline-block;

    text-decoration:none;

    background:#FFC107;

    color:#212529;

    padding:15px 35px;

    border-radius:12px;

    font-weight:600;

    transition:.3s;
}

.home-btn:hover{

    background:#E0A800;

    transform:translateY(-2px);
}*/



.confirmation-card {
    width: 90%;
    max-width: 550px;
    margin: 60px auto;
    background: #fff;
    border-radius: 24px;
    padding: 45px;
    text-align: center;
    box-shadow: var(--shadow-lg);
}

.success-icon {
    width: 100px;
    height: 100px;
    margin: auto;
    margin-bottom: 25px;
    border-radius: 50%;
    background: #FFF8E1;
    display: flex;
    justify-content: center;
    align-items: center;
}

.success-icon i {
    font-size: 50px;
    color: var(--primary);
}

.order-info {
    background: #FFFDF5;
    border: 1px solid #FFE082;
    border-radius: 16px;
    padding: 18px;
    margin: 30px 0;
}

</style>

</head>
<body>

<div class="confirmation-card">

    <div class="success-icon">
        <i class="fa-solid fa-circle-check"></i>
    </div>

    <h1>Order Placed Successfully!</h1>

    <p>
        Thank you for ordering with <strong>FoodieExpress</strong>.
        Your delicious meal is being prepared and will be delivered soon.
    </p>

    <div class="order-info">

        <h3>Estimated Delivery</h3>

        <p>30 - 40 Minutes</p>

    </div>

    <a href="<%=request.getContextPath()%>/home" class="home-btn">
        See more restaurants
    </a>

</div>

</body>
</html>

