<%@page import="Models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
<style>
.back-img {
	background: url("img/book (2).jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.btn {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.btn:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	transition: transform 0.5s ease-in-out;
	border-radius: 0.5rem;
	border: 1px solid black;
}

.card:hover {
	transform: scale(1.06);
}
</style>
</head>
<body style="background-color: #f7f7f7">

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<hr>
	<h1 class="text-center">
		Hello <span class="text-danger"><%=u.getName()%></span>
	</h1>
	<hr>
	<div class="container">
		<div class="row p-5 mt-3">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card bg-white">
						<div class="card-body text-center">
							<div class="p-1">
								<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							</div>

							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card bg-white">
						<div class="card-body text-center">
							<div class="p-1">
								<i class="fa-solid fa-book-open fa-3x text-primary"></i>
							</div>

							<h4>Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card bg-white">
						<div class="card-body text-center">
							<div class="p-1">
								<i class="fa-solid fa-user-pen fa-3x text-primary"></i>
							</div>

							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			<!-- <div class="col-md-4 mt-4">
				<a href="user_address.jsp">
					<div class="card bg-white">
						<div class="card-body text-center">
							<div class="p-1">
								<i class="fa-solid fa-location-dot fa-3x text-warning"></i>
							</div>

							<h4>Address</h4>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div> -->
			<div class="col-md-6 mt-4">
				<a href="order.jsp">
					<div class="card bg-white">
						<div class="card-body text-center">
							<div class="p-1">
								<i class="fa-solid fa-box-open fa-3x text-danger"></i>
							</div>

							<h4>My Orders</h4>
							<p>Track Your Orders</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mt-4">
				<a href="helpline.jsp">
					<div class="card bg-white">
						<div class="card-body text-center">
							<div class="p-1">
								<i class="fa-solid fa-circle-user fa-3x text-secondary"></i>
							</div>

							<h4>Helpline</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>