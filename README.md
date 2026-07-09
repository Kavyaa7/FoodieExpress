# FoodieExpress

A full-stack **Food Delivery Web Application** developed using **Java, JSP, Servlets, JDBC, and MySQL** following the **MVC Architecture**. The application provides separate dashboards and functionalities for Customers, Restaurant Admins, Delivery Agents, and a Super Admin, offering an end-to-end food ordering and management experience.

---

## 🚀 Features

### 👤 Customer

* User Registration & Login
* Browse Restaurants
* View Restaurant Menus
* Add/Remove Items from Cart
* Checkout & Place Orders
* Order Confirmation
* Order History
* View & Update Profile

### 🏪 Restaurant Admin

* Secure Login
* Restaurant-specific Dashboard
* View Menu Items
* Add Menu Items
* Update Menu Items
* Delete Menu Items

### 🚚 Delivery Agent

* Secure Login
* View Available Orders
* Accept/Reject Orders
* Update Order Status to **Out for Delivery**
* View Earnings for Each Order

### 🛡️ Super Admin

* Separate Admin Login
* Manage Users (View, Update, Delete)
* Manage Restaurants (View, Update, Delete)
* View All Orders

---

## 🛠️ Tech Stack

### Backend

* Java
* JSP
* Servlets
* JDBC

### Frontend

* HTML5
* CSS3

### Database

* MySQL

### Server & IDE

* Apache Tomcat
* Eclipse IDE

---

## 🏗️ Architecture

The project follows the **MVC (Model–View–Controller)** architecture.

```text
Client
   │
   ▼
JSP (View)
   │
   ▼
Servlets (Controller)
   │
   ▼
DAO Layer
   │
   ▼
MySQL Database
```

### Project Structure

```text
Food_Delivery
│
├── model
├── dao
├── daoimpl
├── servlets
├── util
│
└── src/main/webapp
    ├── css
    ├── images
    ├── views
    └── WEB-INF
```

---

## ✨ Highlights

* Role-based authentication and authorization
* Session-based cart management
* Complete CRUD operations for Users, Restaurants, and Menu Items
* Responsive Swiggy/Zomato-inspired UI
* Modular DAO layer using JDBC
* Clean MVC-based project structure

---


## 🎯 Future Enhancements

* Online payment integration
* Live order tracking
* Restaurant approval workflow
* Delivery assignment automation
* Search, filters, and sorting
* Ratings and reviews
* Email/SMS notifications

---

## 👨‍💻 Author

**Kavya S**

Built as a Java Enterprise project to demonstrate full-stack web development using JSP, Servlets, JDBC, MySQL, and the MVC architecture.

