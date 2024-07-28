<%@page import="Models.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.BookDAOImpl"%>
<%@page import="Models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Old Book</title>
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

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	border-radius: 0.5rem;
	border: 1px solid black;
}
</style>
</head>
<body style="background-color: #f7f7f7">

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<hr>
	<h1 class="text-center">
		Hello <span class="text-danger"><%=u.getName()%></span>
	</h1>
	<hr>
	<div class="container-fluid md-6">
		<c:if test="${not empty succMsg }">
			<p class="text-center text-success">${succMsg}</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>
		<c:if test="${not empty failedMsg }">
			<p class="text-center text-danger">${failedMsg}</p>
			<c:remove var="failedMsg" scope="session" />
		</c:if>
		<div class="card bg-white shadow">
			<div class="card-body">
				<h3 class="text-center text-success mb-4">Your Books</h3>
				<table
					class="table table-striped table-hover table-bordered text-center">
					<thead class="bg-primary text-white font-weight-bold">
						<tr>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Category</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						String email = u.getEmail();
						BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
						List<BookDtls> list = dao.getBookByOld(email, "Old");
						for (BookDtls b : list) {
						%>
						<tr>

							<td><%=b.getBookname()%></td>
							<td><%=b.getAuthor()%></td>
							<td><%=b.getPrice()%></td>
							<td><%=b.getBookCategory()%></td>
							<td>
								<a href="delete_old_book?id=<%=b.getBookId()%>&&em=<%=email%>"
								class="btn btn-outline-danger btn-sm"><i
									class="fa-solid fa-trash"></i> Remove</a>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="mt-5">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>