<%@page import="Models.User"%>
<%@page import="Models.BookDtls"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BookDAOImpl"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
<style>
/* Loading screen styles */
#loading {
    position: fixed;
    width: 100%;
    height: 100%;
    background: white;
    z-index: 9999;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

#loading h1 {
    font-size: 2.5rem;
    margin-bottom: 20px;
}

#book-animation {
    width: 200px;
    height: 200px;
    animation: flip 2s infinite;
}

@keyframes flip {
    0% {
        transform: perspective(600px) rotateY(0deg);
    }
    50% {
        transform: perspective(600px) rotateY(180deg);
    }
    100% {
        transform: perspective(600px) rotateY(360deg);
    }
}
.back-img {
	background: url("img/book (2).jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.card-ho {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease;
}

.crd-ho:hover {
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3); /* Shadow on hover */
}

.carousel-inner {
	height: 30rem; /* Set your desired height */
}

.carousel-inner img {
	height: 100%;
	object-fit: cover; /* Ensure images cover the height */
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
	<div id="loading" class="text-center">
    
    <svg id="book-animation" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 96.16" style="enable-background:new 0 0 122.88 96.16" xml:space="preserve">
        <style type="text/css">
            <![CDATA[
                .st0 { fill: #2E2E2E; }
                .st1 { fill: #DA5652; animation: bookAnimation 2s infinite ease-in-out; }
                
                @keyframes bookAnimation {
                    0% { transform: rotate(0); }
                    50% { transform: rotate(180deg); }
                    100% { transform: rotate(360deg); }
                }
            ]]>
        </style>
        <g>
            <path class="st1" d="M108.82,14.33c-0.02-0.18-0.05-0.37-0.05-0.57c0-0.19,0.01-0.38,0.05-0.57V0.7c-8.76-0.83-17.79,0.13-25.68,3.12c-7.37,2.8-13.73,7.39-17.86,13.98v71.15c6.43-4.29,13-7.82,19.75-10.22c7.69-2.74,15.6-4.04,23.79-3.39V14.33L108.82,14.33L108.82,14.33z M57.71,88.21V17.68C53.74,10.68,47.32,6,40.08,3.22C31.87,0.08,22.64-0.63,14.6,0.51l-0.43,75.05c8.77-0.32,17.36,0.8,25.43,3.44C46.03,81.09,52.12,84.16,57.71,88.21L57.71,88.21L57.71,88.21z"/>
            <path class="st0" d="M6.62,79.25l0.35-61.69H0v78.5c9.57-2.47,19.17-4.04,28.85-4.11c8.93-0.05,17.86,1.19,26.81,4.22c-5.56-4.5-11.76-7.82-18.38-9.97c-8.33-2.72-17.34-3.62-26.58-2.83c-2.09,0.17-3.91-1.38-4.09-3.46C6.59,79.68,6.59,79.46,6.62,79.25L6.62,79.25L6.62,79.25z M68.95,95.59c8.37-2.63,16.72-3.71,25.08-3.66c9.67,0.05,19.28,1.64,28.85,4.11V17.56h-6.48v62.03c0,2.09-1.7,3.79-3.79,3.79c-0.3,0-0.59-0.03-0.87-0.1c-8.29-1.3-16.32-0.22-24.16,2.57C81.26,88.1,75.06,91.47,68.95,95.59L68.95,95.59L68.95,95.59z"/>
        </g>
    </svg>
</div>


	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<!--<div class="container-fluid back-img"></div>  -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="img/caurosel1.jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/caurosel2.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="img/caurosel3.jpg" alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<hr>
	<!-- Recent book division starts-->
	<div class="container mt-3">
		<h3 class="text-center">Recent Book</h3>
		<div class="row mt-3">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(Dbconnection.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho border border-primary mt-3">
					<div class="card-body text-center">
						<img class="img-fluid" alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
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
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm ml-1"><i
								class="fa-solid fa-eye"></i> View </a> <a href=""
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



							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm ml-1"><i
								class="fa-solid fa-eye"></i> View </a> <a href=""
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
		<div class="text-center mt-3">
			<a href="all_recent_books.jsp" class="btn btn-primary btn-sm "><i
				class="fa-solid fa-eye"></i> ViewAll</a>
		</div>
	</div>
	<!-- end recent book -->
	<hr>
	<!-- new book division starts-->
	<div class="container mt-2">
		<h3 class="text-center">New Book</h3>
		<div class="row mt-3">

			<%
			BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho border border-primary mt-3">
					<div class="card-body text-center">
						<img class="img-fluid" alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
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

							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm ml-1"><i
								class="fa-solid fa-eye"></i> View </a> <a href=""
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
		<div class="text-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-primary btn-sm "><i
				class="fa-solid fa-eye"></i> ViewAll</a>
		</div>
	</div>
	<!-- end new book -->
	<hr>
	<!-- old book division starts-->
	<div class="container mt-2">
		<h3 class="text-center">Old Book</h3>
		<div class="row mt-3">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(Dbconnection.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho border border-primary mt-3">
					<div class="card-body text-center">
						<img class="img-fluid" alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row justify-content-center">
							<a href="view_book.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-primary btn-sm ml-1"><i
								class="fa-solid fa-eye"></i> View </a> <a href=""
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
		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-primary btn-sm "><i
				class="fa-solid fa-eye"></i> ViewAll</a>
		</div>
	</div>
	<!-- end old book -->
	<%@include file="all_component/footer.jsp"%>
	<script>
		// JavaScript to hide the loading screen after 5 seconds
		window.addEventListener('load', function() {
		    setTimeout(function() {
		        document.getElementById('loading').style.display = 'none';
		    }, 4000);
		});
	</script>
</body>
</html>