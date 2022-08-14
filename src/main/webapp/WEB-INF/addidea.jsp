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
<title>Add an Idea</title>
</head>
<body>
<style>
  .mask-custom {
    backdrop-filter: contrast(140%) brightness(100%) saturate(100%) sepia(50%) hue-rotate(0deg) grayscale(0%) invert(0%) blur(0px);
    mix-blend-mode: lighten;
    background: rgba(161, 44, 199, 0.31);
    opacity: 1;
  }
</style>

<!-- Background image -->
<div
  class="bg-image"
  style="
    background-image: url('https://mdbcdn.b-cdn.net/img/new/fluid/nature/018.webp');
    height: 100vh;
  "
  
>
<h1 class="text-white mb-0 text-center" >Enter a new Idea </h1>
	<div class="container col-5">
		<form:form action="/showIdea" modelAttribute="ideas" class="form"
				method="post">

				<div class="form-row">
					<form:errors path="title" class="error" />
					<form:label for="title" path="title" class="text-white mb-0">Project Name:</form:label>
					<form:input type="text" path="title" class="form-control" />
				</div>

				<div class="form-row">
					<form:errors path="language" class="error" />
					<form:label for="language" path="language" class="text-white mb-0">Project Language:</form:label>
					<form:input type="text" path="language" class="form-control" />
				</div>

				<div class="form-row">
					<form:errors path="description" class="error" />
					<form:label for="description" path="description" class="text-white mb-0">Description:</form:label>
					<form:textarea path="description" class="form-control" />
				</div>


				<div class="form-row">
					<input type="submit" value="Submit" class="btn-primary" />
				</div>
				<div>
					<button class="btn-btn light">
						<a href="/home">Cancel</a>
					</button>
				</div>
				<div>
					<form:hidden path= "user" value="${user.id}" />
				</div>

			</form:form>
	</div>

  <div class="mask mask-custom"></div>
</div>
</body>
</html>