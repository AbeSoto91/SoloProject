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
	<link rel="stylesheet" href="/css/login.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<title>Solo Project</title>
</head>
<body>
<!-- Section: Design Block -->
<section class=" text-center text-lg-start">
  <style>
    .rounded-t-5 {
      border-top-left-radius: 0.5rem;
      border-top-right-radius: 0.5rem;
    }

    @media (min-width: 992px) {
      .rounded-tr-lg-0 {
        border-top-right-radius: 0;
      }

      .rounded-bl-lg-5 {
        border-bottom-left-radius: 0.5rem;
      }
    }
  </style>
  <div class="card mb-3">
    <div class="row g-0 d-flex align-items-center">
      <div class="col-lg-4 d-none d-lg-flex">
        <img src="https://mdbootstrap.com/img/new/ecommerce/vertical/004.jpg" alt="Trendy Pants and Shoes"
          class="w-100 rounded-t-5 rounded-tr-lg-0 rounded-bl-lg-5" />
      </div>
      <div class="col-lg-8">
        <div class="card-body py-5 px-md-5">
        <h1>Log in</h1>
			<form:form action="/login" modelAttribute="newLogin" class="form">
			<div>
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="password"/>
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="text" path="password" class="form-control"/>
			</div>
			
			<div>
				<input type="submit" value="Log-in" class="btn-primary"/>
			</div>
		</form:form>
		
		<h2>Register </h2>
		<form:form action="/register" modelAttribute="newUser" class="form">
		
			<div>
			 	<form:errors path="userName"/>
				<form:label for="userName" path="userName">User Name:</form:label>
				<form:input type="text" path="userName" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="password"/>
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="text" path="password" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="confirm"/>
				<form:label for="" path="confirm">Confirm:</form:label>
				<form:input type="text" path="confirm" class="form-control"/>
			</div>
			
			<div>
				<input type="submit" value="Create" class="btn-primary"/>
			</div>
			
		</form:form>
          

        </div>
      </div>
    </div>
  </div>
</section>
<!-- Section: Design Block -->
</body>
</html>