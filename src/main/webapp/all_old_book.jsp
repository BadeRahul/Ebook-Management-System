<%@page import="Models.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Books</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
<style>
.card-ho {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease;
}

.crd-ho:hover {
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3); /* Shadow on hover */
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
	<div class="container mt-2">
		<div class="row mt-2">
			<%
		BookDAOImpl dao3 = new BookDAOImpl(Dbconnection.getConn());
		List<BookDtls> list3 = dao3.getAllOldBooks();
		for(BookDtls b :list3){
		%>
		<div class="col-md-3">
		<div class="card mt-4 crd-ho border border-primary">
			<div class="card-body text-center">
				<img class="img-fluid" alt="" src="book/<%=b.getPhotoName() %>"
					style="width: 100px; height: 150px;" class="img-thumblin">
				<p><%=b.getBookname() %></p>
				<p><%=b.getAuthor()%></p>
				<p>Category:<%=b.getBookCategory()%></p>
				<div class="row justify-content-center">
							<a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-outline-primary btn-sm ml-1"><i class="fa-solid fa-eye"></i> View </a> 
							<a href="#" class="btn btn-outline-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
				</div>
				
			</div>
		</div>
	</div>
		<%
		}
		%>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>