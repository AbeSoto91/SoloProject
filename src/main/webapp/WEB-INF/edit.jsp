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
<title>Update your Idea</title>
</head>
<body>
<body>
	<!-- Background image -->
<div
  class="bg-image d-flex justify-content-center align-items-center"
  style="
    background-image: url('https://mdbcdn.b-cdn.net/img/new/fluid/nature/015.webp');
    height: 100vh;
  "
>
  <h1 class="text-white">Update Idea: ${ ideas.title }</h1>
  
	<div class="container col-5">
	
			<form:form action="/showIdea/${ideas.id}" modelAttribute="ideas" method="post">
			<input type="hidden" name="_method" value="put" />
			<form:hidden path= "user" value="${userId}" />

				<div class="form-row">
					<form:errors path="title" class="error" />
					<form:label for="title" path="title" class="text-white">Title:</form:label>
					<form:input type="text" path="title" class="form-control" />
				</div>

				<div class="form-row">
					<form:errors path="language" class="error" />
					<form:label for="language" path="language" class="text-white">Language:</form:label>
					<form:input type="text" path="language" class="form-control" />
				</div>

				<div class="form-row">
					<form:errors path="description" class="error" />
					<form:label for="description" path="description" class="text-white">Description:</form:label>
					<form:textarea path="description" class="form-control" />
				</div>

				<div>
					<input type="submit" value="Submit" class="btn-primary" />
				</div>
				<button class="btn-btn light">
					<a href="/home">Cancel</a>
				</button>
				

			</form:form>
		</div>
</div>
</body>
</html>