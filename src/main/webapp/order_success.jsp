<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order:success</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Placed Successfully</h2>
		<h5>With in 7-10 days your product will be delivered to your
			address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a> 
		<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>

</body>
</html>