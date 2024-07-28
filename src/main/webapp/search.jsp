<%@page import="Models.User"%>
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
<title>All Search Books</title>
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
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<div class="container mt-2">
		<div class="row mt-2">
			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(Dbconnection.getConn());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card mt-4 crd-ho border border-primary">
					<div class="card-body text-center">
						<img class="img-fluid" alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<div class="row justify-content-center">
							<!-- <a href="" class="btn btn-outline-warning btn-sm"><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a> -->
							<a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-outline-primary btn-sm ml-1"><i
								class="fa-solid fa-eye"></i> View </a> <a href="#"
								class="btn btn-outline-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<div class="row justify-content-center">
														<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-outline-warning btn-sm "><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>

							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-outline-warning btn-sm "><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>
							<a href="view_book.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-outline-primary btn-sm ml-1"><i
								class="fa-solid fa-eye"></i> View </a> <a href="#"
								class="btn btn-outline-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						}
						%>


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