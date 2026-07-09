<%@page import="com.tap.DAOImpl.UserDAOImpl, com.tap.DAOImpl.OrderDAOImpl, com.tap.DAOImpl.RestaurantDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.tap.model.User"%>
<%@ page import="com.tap.model.Order"%>
<%@ page import="com.tap.model.Restaurant"%>

<%
    if(session.getAttribute("admin")==null){
        response.sendRedirect(request.getContextPath()+"/views/admin/adminLogin.jsp");
        return;
    }

    List<User> users = (List<User>)request.getAttribute("users");
    List<Order> orders = (List<Order>)request.getAttribute("orders");
    List<Restaurant> restaurants = (List<Restaurant>)request.getAttribute("restaurants");

    UserDAOImpl userDao = new UserDAOImpl();
    List<User> allUsers = users != null ? users : userDao.getAllUsers();

    OrderDAOImpl orderDao = new OrderDAOImpl();
    List<Order> allOrders = orders != null ? orders : orderDao.getAllOrders();

    RestaurantDAOImpl restaurantDao = new RestaurantDAOImpl();
    List<Restaurant> allRestaurants = restaurants != null ? restaurants : restaurantDao.getAllRestaurants();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/home.css">

<style>

.header{
    background:#FFC107;
    padding:20px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    box-shadow:0 3px 10px rgba(0,0,0,.1);
}

.header h2{
    margin:0;
    color:#222;
}

.logout-btn{
    text-decoration:none;
    color:#222;
    font-weight:600;
    background:#fff;
    padding:10px 20px;
    border-radius:12px;
    transition:.3s;
}

.logout-btn:hover{
    background:#f5f5f5;
}

.container{
    width:95%;
    margin:30px auto;
}

.dashboard-cards{
    display:flex;
    gap:20px;
    margin-bottom:30px;
    flex-wrap:wrap;
}

.card{
    flex:1;
    min-width:220px;
    background:#fff;
    padding:25px;
    border-radius:20px;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
    text-align:center;
}

.card h3{
    margin:0;
    color:#666;
    font-weight:500;
}

.card h1{
    margin-top:15px;
    color:#FFC107;
    font-size:42px;
}

.section{
    background:#fff;
    border-radius:20px;
    box-shadow:0 8px 20px rgba(0,0,0,.08);
    padding:25px;
    margin-bottom:35px;
}

.section-header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    gap:15px;
    margin-bottom:20px;
    flex-wrap:wrap;
}

.section h2{
    margin:0;
    color:#333;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#FFC107;
    color:#222;
    padding:14px;
    text-align:left;
}

td{
    padding:14px;
    border-bottom:1px solid #eee;
}

tr:hover{
    background:#fafafa;
}

.action-btn{
    text-decoration:none;
    color:#fff;
    padding:8px 16px;
    border-radius:10px;
    font-size:14px;
    margin-right:8px;
    display:inline-block;
}

.add-btn{
    background:#4CAF50;
}

.edit-btn{
    background:#2196F3;
}

.delete-btn{
    background:#F44336;
}

.add-btn:hover{
    background:#388E3C;
}

.edit-btn:hover{
    background:#1976D2;
}

.delete-btn:hover{
    background:#D32F2F;
}

.no-data{
    text-align:center;
    color:#777;
    padding:20px;
}

@media(max-width:768px){

.dashboard-cards{
    flex-direction:column;
}

table{
    display:block;
    overflow-x:auto;
}

}

</style>

</head>
<body>

<div class="header">

    <h2>FoodieExpress - Admin Dashboard</h2>

    <a href="<%=request.getContextPath()%>/logout" class="logout-btn">
        Logout
    </a>

</div>

<div class="container">

    <div class="dashboard-cards">

        <div class="card">
            <h3>Total Users</h3>
            <h1><%=allUsers!=null ? allUsers.size() : 0%></h1>
        </div>

        <div class="card">
            <h3>Total Restaurants</h3>
            <h1><%=allRestaurants!=null ? allRestaurants.size() : 0%></h1>
        </div>

        <div class="card">
            <h3>Total Orders</h3>
            <h1><%=allOrders!=null ? allOrders.size() : 0%></h1>
        </div>

    </div>

    <div class="section">

        <div class="section-header">
            <h2>All Users</h2>
        </div>

        <table>

            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>

            <%
            if(allUsers!=null && !allUsers.isEmpty()){
                for(User u:allUsers){
            %>

            <tr>
                <td><%=u.getId()%></td>
                <td><%=u.getName()%></td>
                <td><%=u.getEmail()%></td>
                <td><%=u.getRole()%></td>
                <td>
                    <a class="action-btn edit-btn"
                       href="<%=request.getContextPath()%>/editUser?userId=<%=u.getId()%>">
                        Update
                    </a>

                    <a class="action-btn delete-btn"
                       href="<%=request.getContextPath()%>/deleteUser?userId=<%=u.getId()%>"
                       onclick="return confirm('Are you sure you want to delete this user?');">
                        Delete
                    </a>
                </td>
            </tr>

            <%
                }
            }else{
            %>

            <tr>
                <td colspan="5" class="no-data">
                    No users available.
                </td>
            </tr>

            <%
            }
            %>

        </table>

    </div>

    <div class="section">

        <div class="section-header">
            <h2>All Restaurants</h2>
            <a class="action-btn add-btn" href="<%=request.getContextPath()%>/addRestaurant">
                Add Restaurant
            </a>
        </div>

        <table>

            <tr>
                <th>Restaurant ID</th>
                <th>Name</th>
                <th>Address</th>
                <th>Cuisine</th>
                <th>Rating</th>
                <th>Delivery Time</th>
                <th>Status</th>
                <th>Owner User ID</th>
                <th>Actions</th>
            </tr>

            <%
            if(allRestaurants!=null && !allRestaurants.isEmpty()){
                for(Restaurant r:allRestaurants){
            %>

            <tr>
                <td><%=r.getRestaurantId()%></td>
                <td><%=r.getRestaurantName()%></td>
                <td><%=r.getAddress()%></td>
                <td><%=r.getCuisineType()%></td>
                <td><%=r.getRating()%></td>
                <td><%=r.getDeliveryTime()%> mins</td>
                <td><%=r.isActive() ? "Active" : "Inactive"%></td>
                <td><%=r.getUserId()%></td>
                <td>
                    <a class="action-btn edit-btn"
                       href="<%=request.getContextPath()%>/editRestaurant?restaurantId=<%=r.getRestaurantId()%>">
                        Update
                    </a>

                    <a class="action-btn delete-btn"
                       href="<%=request.getContextPath()%>/deleteRestaurant?restaurantId=<%=r.getRestaurantId()%>"
                       onclick="return confirm('Are you sure you want to delete this restaurant?');">
                        Delete
                    </a>
                </td>
            </tr>

            <%
                }
            }else{
            %>

            <tr>
                <td colspan="9" class="no-data">
                    No restaurants available.
                </td>
            </tr>

            <%
            }
            %>

        </table>

    </div>

    <div class="section">

        <div class="section-header">
            <h2>All Orders</h2>
        </div>

        <table>

            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Restaurant ID</th>
                <th>Total Amount</th>
                <th>Status</th>
                <th>Payment Method</th>
            </tr>

            <%
            if(allOrders!=null && !allOrders.isEmpty()){
                for(Order o:allOrders){
            %>

            <tr>
                <td><%=o.getOrderId()%></td>
                <td><%=o.getUserId()%></td>
                <td><%=o.getRestaurantId()%></td>
                <td>Rs. <%=o.getTotalAmount()%></td>
                <td><%=o.getStatus()%></td>
                <td><%=o.getPaymentMethod()%></td>
            </tr>

            <%
                }
            }else{
            %>

            <tr>
                <td colspan="6" class="no-data">
                    No orders available.
                </td>
            </tr>

            <%
            }
            %>

        </table>

    </div>

</div>

</body>
</html>