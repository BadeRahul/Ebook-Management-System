<%@page import="Models.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:Orders</title>
<link rel="icon" type="image/png" href="../img/favicon.png">
<%@include file="allcss.jsp"%>
<style>
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
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<hr>
	<h1 class="text-center">
		Hello <span class="text-danger">Admin</span>
	</h1>
	<hr>
	<div class="container-fluid">
		<div class="card bg-white shadow">
			<div class="card-body">
				<table class="table table-striped table-hover text-center">
					<thead class="bg-primary text-light">
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Address</th>
							<th scope="col">Phone no</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Payment Type</th>
						</tr>
					</thead>
					<tbody >
						<%
						BookOrderImpl dao = new BookOrderImpl(Dbconnection.getConn());
						List<Book_Order> blist = dao.getAllOrder();
						for (Book_Order b : blist) {
						%>
						<tr>
							<th scope="row"><%=b.getOrderId() %></th>
							<td><%=b.getUsername()%></td>
							<td><%=b.getEmail() %></td>
							<td><%=b.getFulladd() %></td>
							<td><%=b.getPhno() %></td>
							<td><%=b.getBookName() %></td>
							<td><%=b.getAuthor() %></td>
							<td><%=b.getPrice() %></td>
							<td><%=b.getPaymentType() %></td>

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
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>