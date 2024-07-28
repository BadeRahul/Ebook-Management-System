<%@page import="Models.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.BookOrderImpl"%>
<%@page import="Models.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders Page</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
<style>
.card {
	border: 1px solid black; /* Added border color */
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
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
	
	<div class="container-fluid p-5">
		<div class="card bg-white shadow">
			<div class="card-body">
				<h3 class="text-center text-success mb-4">Your Ordered Items</h3>
				<table
					class="table table-striped table-hover table-bordered text-center">
					<thead class="bg-primary text-white font-weight-bold">
						<tr>
							<th scope="col">Order Id</th>
							<th scope="col">Name</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Price</th>
							<th scope="col">Payment Type</th>
						</tr>
					</thead>
					<tbody >
						<%
						/* User u = (User) session.getAttribute("userobj"); */
						BookOrderImpl dao = new BookOrderImpl(Dbconnection.getConn());
						List<Book_Order> blist = dao.getBook(u.getEmail());

						for (Book_Order b : blist) {
						%>

						<tr>
							<th scope="row"><%=b.getOrderId() %></th>
							<td><%=b.getUsername() %></td>
							<td><%=b.getBookName()%></td>
							<td><%=b.getAuthor()%></td>
							<td><%=b.getPrice() %></td>
							<td><%=b.getPaymentType()%></td>
						</tr>

						<%
						}
						%>



					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>