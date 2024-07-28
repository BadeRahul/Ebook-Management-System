<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>
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
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<section class="vh-80">
		<div class="container py-5 mt-1">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-9">
					<div class="card border border-dark"
						style="border-radius: 1rem; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6)">

						<div class="row g-0">
							<div class="col-md-5 d-none d-md-block">
								<img src="img/book.jpg" alt="book" class="img-fluid"
									style="border-radius: 1rem 0 0 1rem; height: 100%;" />
							</div>
							<div class="col-md-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black">
									<h2 class="text-center">Sell Old Book</h2>
									<form action="add_old_book" method="post"
										enctype="multipart/form-data">

										<c:if test="${not empty succMsg }">
											<p class="text-center text-success font-weight-bold">${succMsg }</p>
											<c:remove var="succMsg" scope="session" />
										</c:if>
										<c:if test="${not empty failedMsg }">
											<p class="text-center text-danger font-weight-bold">${failedMsg }</p>
											<c:remove var="failedMsg" scope="session" />
										</c:if>


										<input type="hidden" value="${userobj.email}" name="user">
										<div class="form-group">
											<label for="exampleInputEmail1">Book Name</label> <input
												type="text" class="form-control border border-dark"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Enter Book Name" required="required"
												name="bname">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Author Name</label> <input
												type="text" class="form-control border border-dark"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Enter Author Name" required="required"
												name="author">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">Price</label> <input
												type="number" class="form-control border border-dark"
												id="exampleInputEmail1" aria-describedby="emailHelp"
												placeholder="Enter Price" required="required" name="price">
										</div>
										<div class="form-group">
											<label for="exampleFormControlFile1">Upload Photo</label> <input
												type="file"
												class="form-control-file border border-dark rounded"
												id="exampleFormControlFile1" name="bimg">
										</div>
										<div class="text-center">
											<button type="submit"
												class="btn btn-primary border border-dark mt-1">Sell</button>
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