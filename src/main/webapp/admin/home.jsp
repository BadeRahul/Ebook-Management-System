<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Home</title>
<link rel="icon" type="image/png" href="../img/favicon.png">
<%@include file="allcss.jsp"%>
<style type="text/css">
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
}

.card:hover {
	transform: scale(1.09);
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
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">	
		<c:redirect url="../login.jsp" />
	
	</c:if>
	<div class="container mt-5">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card border border-dark float-effect-1">
						<div class="card-body text-center ">
							<i class="fas fa-plus-square fa-3x fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card border border-dark float-effect-2">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>All Books</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card border border-dark float-effect-3">
						<div class="card-body text-center">
							<i class="fas fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card border border-dark float-effect-4">
						<div class="card-body text-center">
							<i class="fas fa-sign-out-alt fa-3x text-primary"></i><br>
							<h4>LogOut</h4>
							------------------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- Logout modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Conformation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<i><h5>Do You Want to Logout</h5></i>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
        <a  href="../logout" type="button" class="btn btn-danger text-white">Logout</a>
      </div>
    </div>
  </div>
</div>
	<div style="margin-top: 12rem;">
		<%@include file="footer.jsp"%>
	</div>


</body>
</html>