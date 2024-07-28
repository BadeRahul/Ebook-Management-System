<%@page import="Models.User"%>
<%@page import="Models.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Books</title>
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
/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body style="background-color: #f7f7f7">
<%
	User u=(User)session.getAttribute("userobj"); 
	
	%>
	<c:if test="${not empty addCart }">
		<div id="toast">${ addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
		</script>
<c:remove var="addCart" scope="session"/>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container mt-2">
		<div class="row mt-2">
			<%
			BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
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
						<div class="row justify-content-center">
							<%if(u==null){ %>
						<a href="login.jsp" class="btn btn-outline-warning btn-sm "><i class="fa-solid fa-cart-plus"></i> Add Cart</a> 
						
						<%}else{%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-outline-warning btn-sm "><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
						<%} %>
								
								<a
								href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm ml-1"><i
								class="fa-solid fa-eye"></i> View </a> <a href="#"
								class="btn btn-outline-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
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