<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
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
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success">Add Address</h3><hr>
						<form action="">
							<div class="form-row">
								
								<div class="form-group col-md-6">
									<label for="inputAddress" class="font-weight-bold">Address</label>
									<input type="text" class="form-control" id="inputAddress"
										placeholder="Address">
								</div>
								<div class="form-group col-md-6">
									<label for="inputLandmark" class="font-weight-bold">Landmark</label>
									<input type="text" class="form-control" id="inputLandmark"
										placeholder="Landmark">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputCity" class="font-weight-bold">City</label> <input
										type="text" class="form-control" id="inputCity"
										placeholder="City">
								</div>
								<div class="form-group col-md-4">
									<label for="inputState" class="font-weight-bold">State</label>
									<input type="text" class="form-control" id="inputState"
										placeholder="State">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPincode" class="font-weight-bold">Pincode</label>
									<input type="number" class="form-control" id="inputPincode"
										placeholder="Pincode">
								</div>
							</div>
							<div class="form-row mt-4">
							    <div class="form-group col-md-12 d-flex justify-content-center">
							        <a href="#" class="btn btn-warning mx-2">Add Address</a>
							        
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