
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>




<div class="container-fluid" style="height:5px; background-color: #007bff;"></div>

<div class="container-fluid p-3">
    <div class="row align-items-center">
        <div class="col-md-4 text-success">
            <h3><i class="fa-solid fa-book-open-reader"></i> Ebooks</h3>
        </div>

        <div class="col-md-4">
            <form class="form-inline my-2 my-lg-0 d-flex justify-content-center" action="search.jsp" method="post">
                <input class="form-control mr-sm-2 border border-primary" type="search" placeholder="Search" aria-label="Search" name="ch">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>

        <div class="col-md-4 text-right">
            <c:if test="${not empty userobj}">
                <a href="checkout.jsp" class="btn text-dark">
                    <i class="fa-solid fa-cart-shopping fa-2x"></i>
                </a>
                <a href="#" class="btn btn-success">
                    <i class="fa-solid fa-circle-user"></i> ${userobj.name}
                </a>
                <a href="logout" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
                    <i class="fa-solid fa-right-to-bracket"></i> Logout
                </a>
            </c:if>

            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn btn-success">
                    <i class="fa-solid fa-right-to-bracket"></i> Login
                </a>
                <a href="register.jsp" class="btn btn-primary">
                    <i class="fa-solid fa-user-plus"></i> Register
                </a>
            </c:if>
        </div>
    </div>
</div>






<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"> Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="all_recent_books.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link disabled" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
			</li>
			<li class="nav-item active"><a class="nav-link disabled" href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 " type="submit"><i class="fa-solid fa-wrench"></i>
			Settings</a>
			<a href="#" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-phone"></i> Contact Us</a>
		</form>
	</div>
</nav>




	<!-- Logout modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Conformation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<i><h5>Do You Want to Logout</h5></i>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">Cancel</button>
        <a  href="logout" type="button" class="btn btn-danger text-white">Logout</a>
      </div>
    </div>
  </div>
</div>