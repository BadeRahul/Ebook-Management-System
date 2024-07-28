<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="img/favicon.png">
<title>Ebook:Register</title>
<%@include file="all_component/allcss.jsp"%>
<style>
.custom-shadow {
	box-shadow: 0 5px 9px rgba(0, 0, 0, 0.2); /* Custom shadow */
}
.btn {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .btn:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
  }
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<section class="vh-80">
		<div class="container py-5 mt-5">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-10">
					<div class="card border border-dark"
						style="border-radius: 1rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6)">
						<div class="row g-0">
							<div class="col-md-5 d-none d-md-block">
								<img src="img/register.jpg" alt="login form" class="img-fluid"
									style="border-radius: 1rem 0 0 1rem; height: 100%;" />
							</div>
							<div class="col-md-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">

									<h4 class="text-center">Registration Page</h4>
									<c:if test="${not empty succMsg }">
										<p class="text-center text-success">${succMsg}</p>
										<c:remove var="succMsg" scope="session" />
									</c:if>
									<c:if test="${not empty failedMsg }">
										<p class="text-center text-danger">${failedMsg}</p>
										<c:remove var="failedMsg" scope="session" />
									</c:if>
									<form action="register" method="post">
										<div class="form-group">
											<label for="exampleInputEmail1">Enter Full Name</label> <input
												type="text" class="form-control border border-dark"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Enter Name" required="required" name="fname">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Email address</label> <input
												type="email" class="form-control border border-dark"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Enter email" required="required" name="email">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Phone No</label> <input
												type="number" class="form-control border border-dark"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Enter Phno" required="required" name="phno">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">Password</label> <input
												type="password" class="form-control border border-dark"
												id="exampleInputPassword1" placeholder="Password"
												required="required" name="password">
										</div>
										<div class="form-check">
											<input type="checkbox"
												class="form-check-input border border-dark"
												id="exampleCheck1" name="check"> <label
												class="form-check-label" for="exampleCheck1">Agree
												terms & Conditions</label>
										</div>
										<div class="text-center">
											<button type="submit"
												class="btn btn-primary border border-dark mt-1">Register</button>

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