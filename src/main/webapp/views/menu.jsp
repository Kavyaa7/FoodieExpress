<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.Restaurant" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant Menu | FoodieExpress</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
/* .restaurant-hero{
    width:90%;
    max-width:1200px;
    margin:30px auto;
    background:white;
    border-radius:24px;
    overflow:hidden;
    box-shadow:var(--shadow-md);
}

.restaurant-hero img{
    width:100%;
    height:320px;
    object-fit:cover;
}

.restaurant-info{
    padding:25px;
}

.restaurant-info h1{
    margin-bottom:10px;
}

.meta{
    display:flex;
    gap:20px;
    color:var(--text-light);
    margin-bottom:10px;
}

.search-section{
    width:90%;
    max-width:1200px;
    margin:20px auto;
}

.menu-section{
    width:90%;
    max-width:1200px;
    margin:auto;
    padding-bottom:50px;
}

.menu-section h2{
    margin-bottom:25px;
}

.menu-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
    gap:25px;
}

.food-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:12px;
}

.food-footer{
    margin-top:15px;
    display:flex;
    flex-direction:column;
    gap:15px;
}

.quantity{
    justify-content:center;
}

.cart-btn{
    border:none;
    background:var(--primary);
    color:var(--text);
    padding:14px;
    border-radius:12px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
}

.cart-btn:hover{
    background:var(--primary-dark);
}

.nav-links{
    list-style:none;
}


.menu-grid{

    display:grid;

    grid-template-columns:repeat(auto-fit,minmax(320px,1fr));

    gap:25px;
}

.food-card{

    background:white;

    border-radius:22px;

    overflow:hidden;

    box-shadow:var(--shadow-md);

    transition:var(--transition);
}

.food-card:hover{

    transform:translateY(-6px);
}

.food-card img{

    width:100%;
    height:220px;

    object-fit:cover;
}

.food-content{

    padding:20px;
}

.food-header{

    display:flex;

    justify-content:space-between;

    align-items:center;

    margin-bottom:12px;
}

.food-header h3{

    font-size:20px;
}

.food-content p{

    color:var(--text-light);
}

.food-footer{

    display:flex;

    flex-direction:column;

    gap:15px;

    margin-top:20px;
}

.cart-btn{

    width:100%;

    border:none;

    background:var(--primary);

    color:var(--text);

    padding:14px;

    border-radius:14px;

    font-weight:600;

    transition:var(--transition);
}

.cart-btn:hover{

    background:var(--primary-dark);
}*/


</style>

</head>
<body>
<%
    Restaurant selectedRestaurant = (Restaurant) request.getAttribute("selectedRestaurant");
%>

<!-- NAVBAR -->

<nav class="navbar">

    <div class="logo">
   Foodie<span>Express</span>
</div>

    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/views/orderHistory.jsp">Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/views/profile.jsp">Profile</a></li>
        <li><a href="${pageContext.request.contextPath}/views/cart.jsp">Cart</a></li>
    </ul>

</nav>

<!-- RESTAURANT HERO -->

<section class="restaurant-hero">

    <img
        src="<%= selectedRestaurant != null ? selectedRestaurant.getImagePath() : "" %>"
        alt="<%= selectedRestaurant != null ? selectedRestaurant.getRestaurantName() : "Restaurant" %>">

    <div class="restaurant-info">

        <h1><%= selectedRestaurant != null ? selectedRestaurant.getRestaurantName() : "Restaurant Menu" %></h1>

        <div class="meta">

            <span>
                ⭐ <%= selectedRestaurant != null ? selectedRestaurant.getRating() : "" %>
            </span>

            <span>
                • <%= selectedRestaurant != null ? selectedRestaurant.getCuisineType() : "" %>
            </span>

            <span>
                • <%= selectedRestaurant != null ? selectedRestaurant.getDeliveryTime() : 0 %> minutes
            </span>

        </div>

        <p>
            <%= selectedRestaurant != null ? selectedRestaurant.getAddress() : "" %>
        </p>

    </div>

</section>

<!-- SEARCH -->

<section class="search-section">

    <div class="search-box">

        <i class="fa-solid fa-magnifying-glass"></i>

        <input
            type="text"
            placeholder="Search menu items...">

    </div>

</section>

<!-- MENU -->

<section class="menu-section">

    <h2>Popular Items</h2>

    <div class="menu-grid">

        <!-- CARD -->


<%
	List<Menu> allMenuItems = (List<Menu>)request.getAttribute("allMenuItems");

	for(Menu menu: allMenuItems)	{
%>
        <div class="food-card">

            <img
                src="<%= menu.getImageUrl() %>"
                alt="Burger">

            <div class="food-content">

                <div class="food-header">

                    <h3>
                        <%= menu.getItemName() %>
                    </h3>

                    <span class="price">
                       Rs. <%= menu.getPrice() %>
                    </span>

                </div>

                <p>
                	<%= menu.getDescription() %>
                
                </p>

                <div class="food-footer">
                
                
                    <span class="price">
                        <%= menu.isAvailable()?"Available":"Out of stock" %>
                    </span>

               

                    <form action="cart">
                    	
                    	<input type="hidden" name="menuId" value="<%= menu.getMenuId()%>">
                    	<input type="hidden" name="quantity" value = "1">
                    	<input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId()%>">
                    	<input type="hidden" name="action" value="add">
                    
                    	<button class="cart-btn"> Add to Cart </button>
                    </form>

                </div>

            </div>

        </div>
    
<%
	}
%>
    </div>

</section>

</body>
</html>

