<%@page import="Models.BookDtls"%>
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
<title>Admin:Edit Book</title>
<link rel="icon" type="image/png" href="../img/favicon.png">
<%@include file="allcss.jsp"%>
<style>
.custom-shadow {
      box-shadow: 0 5px 9px rgba(0, 0, 0, 0.2); /* Custom shadow */
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
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj }">	
		<c:redirect url="../login.jsp" />
	
	</c:if>
<section class="vh-80">
            <div class="container py-5 mt-1">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-8">
                  <div class="card border border-dark" style="border-radius: 1rem; box-shadow: 0 4px 8px rgba(0,0,0, 0.6)">
                    <div class="row g-0">
                      <div class="col-md-5 d-none d-md-block">
                        <img src="../img/book1.jpg"
                          alt="book" class="img-fluid" style="border-radius: 1rem 0 0 1rem; height: 100%;" />
                      </div>
                      <div class="col-md-7 d-flex align-items-center">
                        <div class="card-body p-4 p-lg-5 text-black">
          					<h2 class="text-center">Edit Books</h2>
          					
          					
          					
          					<%
          					int id = Integer.parseInt(request.getParameter("id"));
          					BookDAOImpl dao = new BookDAOImpl(Dbconnection.getConn());
          					BookDtls b =dao.getBookById(id);
          					%>
                         <form action="../editbooks" method="post">
                         <input type="hidden" name="id" value="<%=b.getBookId()%> ">
						  <div class="form-group">
						    <label for="exampleInputEmail1">Book Name</label>
						    <input type="text" class="form-control border border-dark" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Book Name" required="required" name="bname" value=<%=b.getBookname()%>>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputEmail1">Author Name</label>
						    <input type="text" class="form-control border border-dark" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Author Name" required="required" name="author" value=<%=b.getAuthor()%>>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputEmail1">Price</label>
						    <input type="number" class="form-control border border-dark" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Price" required="required" name="price" value=<%=b.getPrice()%>>
						  </div>
						  <div class="form-group">
						     <label for="inputState">Book Status</label>
							    <select class="form-control border border-dark" id="inputState" name="status">
							      <%
							      if("Active".equals(b.getStatus())){
							      %>
							      <option value="Active">Active</option>
							      <option value="Inactive">Inactive</option>
							      <% }else{ %>
							      <option value="Inactive">Inactive</option>
							      <option value="Active">Active</option>
							      <%}%>
							    </select>
						  </div>
						  <div class="text-center">
								<button type="submit" class="btn btn-primary border border-dark mt-1">Update</button>
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

<%@include file="footer.jsp" %>
</body>
</html>