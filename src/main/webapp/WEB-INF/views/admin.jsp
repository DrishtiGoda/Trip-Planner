<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
* {
	font-family: Poppins;
}

.card {
	margin: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 40%;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.container {
	padding: 2px 2px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

h3 {
	display: flex;
	align-items: center;
	justify-content: center;
	padding-top: 5px;
}

button {
	background-color: red;
	border: none;
	width: 100%;
	color: white;
	padding : 5px 5px;
	border-radius:10px;
}

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
	background-color: transparent;
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

#maincontent {
	width: 100%;
	display: flex;
	align-items: center;
	flex-direction: row;
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
</style>
<title>Trip Planner</title>
</head>
<body>

	<div class="header">
		<ul>
			<li style="float: left"><a class="active" href="#about">TRIP
					PLANNER</a></li>
			<li><a href="#">Logout</a></li>
			<li><a href="#">Dashboard</a></li>

		</ul>
	</div>


	<section id="maincontent">

		<c:set var="path" value=" ${pageContext.request.contextPath}" />

		<table id="jobTable" class="table table-bordered">

			<tr class="header">
				<th>Post ID</th>
				<th>Title</th>
				<th>Country of Travel</th>
				<th>Source Country</th>
				<th>Month of Visit</th>
			
				<th>Delete</th>

			</tr>
			<c:forEach var="list" items="${allJobs}">
				<tr>
					<td>${list.postId}</td>
					<td>${list.title}</td>
					<td>${list.countryOfTravel}</td>
					<td>${list.travelledFrom}</td>
					<td>${list.monthOfVisit}</td>
				


					<!-- 
					<td><button>
							<a href="./updateApplication?jobId=${list.postId}" role="button">Update</a>
						</button></td>
					
					 -->


					<td><a href="./admin/deletePost?jobId=${list.postId}"
						role="button"><button>Delete</button></a></td>
				</tr>
			</c:forEach>
		</table>

	</section>


</body>
</html>