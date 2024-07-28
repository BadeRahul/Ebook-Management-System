<%@page import="Models.User"%>
<%@page import="Models.BookDtls"%>
<%@page import="DBConnection.Dbconnection"%>
<%@page import="Dao.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book</title>
<link rel="icon" type="image/png" href="img/favicon.png">
<%@include file="all_component/allcss.jsp"%>
 <style>
        .card {
            box-shadow: 2px 6px 12px rgba(0, 0, 0, 0.5); /* Custom shadow */
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
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
	BookDtls b= dao.getBookById(bid);
	%>
	<div class="container mt-5">
    <div class="card  rounded p-3 shadow-lg border-dark">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6 text-center border  rounded p-5">
                    <img alt="" src="book/<%=b.getPhotoName() %>" height="180px" width="150px"><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname() %></span></h4>
                    <h4>Author Name: <span class="text-success"><%=b.getAuthor() %></span></h4>
                    <h4>Category: <span class="text-success"><%=b.getBookCategory() %></span></h4>
                </div>
                <div class="col-md-6 text-center border rounded p-5">
                <h2><%=b.getBookname() %> Book</h2>
                
                <%
                	if("Old".equals(b.getBookCategory())){
                %>
                	<h5 class="text-primary">Contact To Seller</h5>
                	<h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail() %></h5>
                <%
                	}
                %>
                    <div class="row mt-3">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fa-solid fa-undo-alt fa-2x"></i>
                            <p>Return Available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Delivery</p>
                        </div>
                    </div>
                    <%
                	if("Old".equals(b.getBookCategory())){
                	%>
                	 <div class="row mt-3 text-center">
                            <div class="col-12">
                                <a href="index.jsp" class="btn btn-success btn-md text-white"><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</a>
                                <a href="" class="btn btn-danger btn-md ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
                            </div>
                      </div>
                	<%
                	}else{
                	%>
                     <div class="row mt-3 text-center">
                            <div class="col-12">
                                <a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-primary btn-md text-white"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a>
                                <a href="#" class="btn btn-danger btn-md ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice() %></a>
                            </div>
                      </div>
                      <%
                	}
                      %>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>