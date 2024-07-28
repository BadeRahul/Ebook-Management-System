<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="img/favicon.png">
<title>Helpline</title>
<%@include file="all_component/allcss.jsp"%>
<style>
.card {
	border: 1px solid black; /* Added border color */
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
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
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container pt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4 text-center">
				<div class=" text-success">
					<i class="fa-solid fa-square-phone fa-5x"></i>
				</div>
				<div class="mt-3">
					<h3>24*7 Service</h3>
					<h4>Help LIne Number</h4>
					<h5>+91 1040223243</h5>
					<a href="index.jsp" class="btn btn-primary mt-2">Home</a>
				</div>
			</div>
		</div>

	</div>
</body>
</html>