<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Idea Details</title>
</head>
<body>
<body>

<div
  class="bg-image d-flex justify-content-center align-items-center"
  style="
    background-image: url('https://mdbcdn.b-cdn.net/img/new/fluid/nature/015.webp');
    height: 100vh;
  "
>
 <div>
    	<h1 class="text-white mb-0 text-center">${ideas.title}</h1>
    
  <div class="d-flex justify-content-center align-items-center">
		<h3 class="text-white mb-0">Posted by: <c:out value="${user.userName}"></c:out></h3>
	</div>
	<div class="d-flex justify-content-center align-items-center">
		<h3 class="text-white mb-0">Language: <c:out value= "${ideas.language}" ></c:out></h3>
	</div>
	<div class="d-flex justify-content-center align-items-center">
		<h3 class="text-white mb-0">Description: <c:out value="${ideas.description}"></c:out></h3>
	</div>
		<div class="d-flex justify-content-center align-items-center">
		<button class="btn-btn-light">
				<a href="/showIdea/${ideas.id}/edit">edit</a>
		</button>
	</div>
</div>	
  
</div>

</body>
</html>