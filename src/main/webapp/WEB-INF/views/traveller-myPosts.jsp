<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>
* {
	padding: 0px;
	margin: 0px;
	font-family: Poppins
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color:transparent;
}

li {
	float: right;
}

li a {
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: grey;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: black;
	color: white;
}

.update , .delete{
	background-color: green;
	border:none;
	color:white;
	padding: 5px 10px;
	border-radius: 10px;
}

.delete {
	background-color: red;
}
</style>


<title>Trip Planner</title>
</head>
<body>


	<div class="header">
		<ul>
			<li style="float: left"><a class="active" href="#about">TRIP
					PLANNER</a></li>
			<li><a href="#">Logout</a></li>
			<li><a href="#">My Posts</a></li>
			<li><a href="./createPost">Create new Post</a></li>
			<li><a class="active" href="./otherPosts">Feed</a></li>
		</ul>
	</div>


	<section id="maincontent">

		<table id="jobTable" class="table table-bordered">

			<tr class="header">
				<th>Post ID</th>
				<th>Title</th>
				<th>Country of Travel</th>
				<th>Source Country</th>
				<th>Month of Visit</th>
			
				<th>Update</th>
				<th>Delete</th>

			</tr>
			<c:forEach var="list" items="${jobs}">
				<tr>
					<td>${list.postId}</td>
					<td>${list.title}</td>
					<td>${list.countryOfTravel}</td>
					<td>${list.travelledFrom}</td>
					<td>${list.monthOfVisit}</td>
					

					<td><a href="./updateApplication?jobId=${list.postId}"
						role="button"><button class="update">Update</button></a></td>

					<td><a href="./deleteApplication?jobId=${list.postId}"
						role="button"><button class="delete">Delete</button></a></td>
				</tr>
			</c:forEach>
		</table>


	</section>
</body>
</html>