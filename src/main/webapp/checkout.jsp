<%@page import="java.util.List"%>
<%@page import="Models.Cart"%>
<%@page import="Models.User"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
<style>
  .card {
    border: 1px solid black; /* Added border color */
    box-shadow: 0 0 20px rgba(0,0,0,0.2);
  }
  
  .form-control {
    border-radius: 8px;
    border: 1px solid #ced4da;
    transition: box-shadow 0.3s ease;
  }
  
  .form-control:focus {
    box-shadow: 0 0 5px rgba(81, 203, 238, 0.8);
  }
  .btn {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .btn:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
  }
  
  .table-hover tbody tr:hover {
    transform: scale(1.02);
    transition: transform 0.2s ease-in-out;
    z-index: 1;
    position: relative;
  }
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">
		  ${succMsg}
		</div>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">
		  ${failedMsg}
		</div>
		<c:remove var="failedMsg" scope="session"/>
	</c:if>
	
	<div class="container">
		<div class="row p-2 mt-3">
			<div class="col-md-6">
				<div class="card bg-white shadow">
					<div class="card-body">
						<h3 class="text-center text-success mb-4">Your Cart Items</h3>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							<%
							User u = (User) session.getAttribute("userobj");
							CartDAOImpl dao = new CartDAOImpl(Dbconnection.getConn());
							List<Cart> cart = dao.getBookByUser(u.getId());
							Double totalPrice = 0.00;
							for (Cart c : cart) {
								totalPrice += c.getPrice();
							%>
								<tr>
									<th scope="row"><%= c.getBookName() %></th>
									<td><%= c.getAuthor() %></td>
									<td><%= c.getPrice() %></td>
									<td>
										<a href="remove_book?cid=<%= c.getCid()%>&&uid=<%= c.getUserId() %>" class="btn btn-sm btn-danger">Remove</a>
									</td>
								</tr>
							<%
							}
							%>
							<tr>
								<th>Total Price</th>
								<td></td>
								<td></td>
								<th><%= totalPrice %></th>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card shadow">
					<div class="card-body">
						<h3 class="text-center text-success mb-4">Your Details</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="font-weight-bold">Name</label>
									<input type="text" class="form-control" id="inputEmail4" placeholder="Name" name="username" value="${userobj.name} " required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4" class="font-weight-bold">Email</label>
									<input type="email" class="form-control" id="inputPassword4" placeholder="Email" name="email" value="${userobj.email }" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPhoneNumber" class="font-weight-bold">Phone Number</label>
									<input type="number" class="form-control" id="inputPhoneNumber" placeholder="Phone Number" name="phno" value="${userobj.phno }" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputAddress" class="font-weight-bold">Address</label>
									<input type="text" class="form-control" id="inputAddress" placeholder="Address" name="address" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputLandmark" class="font-weight-bold">Landmark</label>
									<input type="text" class="form-control" id="inputLandmark" placeholder="Landmark" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputCity" class="font-weight-bold">City</label>
									<input type="text" class="form-control" id="inputCity" placeholder="City" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputState" class="font-weight-bold">State</label>
									<input type="text" class="form-control" id="inputState" placeholder="State" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPincode" class="font-weight-bold">Pincode</label>
									<input type="number" class="form-control" id="inputPincode" placeholder="Pincode" name="pincode" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputPaymentMode" class="font-weight-bold">Payment Mode</label>
									<select class="form-control" id="inputPaymentMode" name="paymentType">
										<option selected value="noselect">---Select---</option>
										<option value="COD">Cash On Delivery</option>
										<option value="Online">Online Mode</option>
									</select>
								</div>
							</div>
							<div class="form-row">
							    <div class="form-group col-md-12 d-flex justify-content-center">
							        <button class="btn btn-warning mx-2">Order Now</button>
							        <a href="index.jsp" class="btn btn-success mx-2">Continue Shopping</a>
							    </div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
