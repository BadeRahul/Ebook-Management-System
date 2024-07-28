<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@page isELIgnored='false' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebooks:User Home</title>
<link rel="icon" type="image/png" href="img/favicon.png">
</head>
<body>
<h1>User</h1>
<c:if test="${not empty userobj }">
<h1>Name:${userobj.name }</h1>
<h1>Email:${userobj.email }</h1>
</c:if>
</body>
</html>