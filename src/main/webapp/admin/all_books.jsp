<%@page import="Models.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored='false' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin:All Books</title>
<link rel="icon" type="image/png" href="../img/favicon.png">
<%@include file="allcss.jsp"%>
<style>
.btn {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }
  
  .btn:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
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
	<hr><h1 class="text-center">Hello <span class="text-danger">Admin</span></h1><hr>
	<c:if test="${not empty succMsg }">
        <p class="text-center text-success font-weight-bold">${succMsg }</p>
        <c:remove var="succMsg" scope= "session"/>
        </c:if>
        <c:if test="${not empty failedMsg }">
        <p class="text-center text-danger font-weight-bold">${failedMsg }</p>
    	<c:remove var="failedMsg" scope= "session"/>
    </c:if>
    <div class="container-fluid">
				<div class="card bg-white shadow">
					<div class="card-body">
	<table class="table table-striped table-hover table-bordered text-center">
		<thead class="bg-primary text-light">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		<%
		BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
		List<BookDtls> list = dao.getAllBooks();
		for(BookDtls b : list){
		%>
		<tr>
				<td><%=b.getBookId() %></td>
				<td><img class="img-fluid" src="../book/<%=b.getPhotoName()%>" style="width:50px; height:50px"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getBookCategory() %></td>
				<td>
				    <span class="badge badge-<%= b.getStatus().equals("Active") ? "success" : "secondary" %>">
				        <%= b.getStatus() %>
				    </span>
				</td>
				<td>
					<a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-outline-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a> 
					<a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-outline-danger"><i class="fa-solid fa-trash"></i> Delete</a>
				</td>
			</tr>
		<%} %>
			
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