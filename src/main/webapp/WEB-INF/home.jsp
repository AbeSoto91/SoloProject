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
<title>Welcome</title>
</head>
<body>
<style>
  .gradient-custom {
    /* fallback for old browsers */
    background: #a18cd1;

    /* Chrome 10-25, Safari 5.1-6 */
    background: -webkit-linear-gradient(
      45deg,
      rgba(29, 236, 197, 0.6),
      rgba(91, 14, 214, 0.6) 100%
    );

    /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    background: linear-gradient(
      45deg,
      rgba(29, 236, 197, 0.6),
      rgba(91, 14, 214, 0.6) 100%
    );
  }
</style>

<!-- Background image -->
<div class="mask gradient-custom">
    <div class="d-flex justify-content-center align-items-center h-100">
      <h1 class="text-white mb-0">Welcome, <c:out value="${user.userName}"/></h1>
      	<div>
		<a href="/logout" class="text-white mb-0">logout</a>
		</div>
    </div>
  </div>
<div
  class="bg-image"
  style="
    background-image: url('https://mdbcdn.b-cdn.net/img/new/fluid/nature/011.webp');
    height: 100vh;
  "
  <div class="container col-5">
	<h3 class="text-white mb-0 text-center" >Your Programming Ideas</h3>
	
			<table class="table table-dark">
				<thead>
					<tr>
						<th>Project Name</th>
						<th>Project Language</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ideas" items="${ideas}">
						<tr>
							<td><a href="/showIdea/${ideas.id}"><c:out value="${ ideas.title }" /></a></td>
							<td><c:out value="${ ideas.language }" /></td>
							<td>
								<form action="/showIdea/delete/${ideas.id }" method="post">
									
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="delete">
								</form>
							</td>
						</tr>	
					</c:forEach>
				</tbody>
		</table>
		<div>
		<button class="btn-primary">
				<a href="/newIdea" class="text-white mb-0">Add an Idea</a>
		</button>
		</div>
/>
</body>
</html>