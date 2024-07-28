<%@page import="Models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
<style>
.btn {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.btn:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
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
	<section class="vh-80">

		<div class="container py-5 mt-5">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-9">
					<div class="card border border-dark"
						style="border-radius: 1rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6)">
						<div class="row g-0">
							<div class="col-md-5 d-none d-md-block">
								<img src="img/editimg.jpg" alt="login form" class="img-fluid"
									style="border-radius: 1rem 0 0 1rem; height: 100%;" />
							</div>
							<div class="col-md-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">
									<h4 class="text-center">Edit Profile</h4>
									<c:if test="${not empty failedMsg }">
										<h5 class="text-center text-danger">${failedMsg}</h5>
										<c:remove var="failedMsg" scope="session" />
									</c:if>
									<c:if test="${not empty succMsg }">
										<h5 class="text-center text-success">${succMsg}</h5>
										<c:remove var="succMsg" scope="session" />
									</c:if>
									<form action="update_profile" method="post">
										<input type="hidden" value="${userobj.id}" name="id">
										<div class="form-group">
											<label for="inputName">Enter Full Name</label> <input
												type="text" class="form-control border border-dark"
												id="inputName" placeholder="Enter Name" required="required"
												name="fname" value="${userobj.name}">
										</div>
										<div class="form-group">
											<label for="inputEmail">Email address</label> <input
												type="email" class="form-control border border-dark"
												id="inputEmail" placeholder="Enter email"
												required="required" name="email" value="${userobj.email}">
										</div>
										<div class="form-group">
											<label for="inputPhone">Phone No</label> <input type="number"
												class="form-control border border-dark" id="inputPhone"
												placeholder="Enter Phone Number" required="required"
												name="phno" value="${userobj.phno}">
										</div>
										<div class="form-group">
											<label for="inputPassword">Password</label> <input
												type="password" class="form-control border border-dark"
												id="inputPassword" placeholder="Password"
												required="required" name="password" value="">
										</div>
										<div class="text-center">
											<button type="submit"
												class="btn btn-primary border border-dark mt-1">Update</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>
