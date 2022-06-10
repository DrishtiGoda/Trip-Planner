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

/*a {
	text-decoration: none;
	color: white;
}


button {
	background-color: black;
	border: none;

	color: yellow;
	height: 50px;

}

*/


</style>
<title>Trip Planner</title>
</head>
<body>

	<div class="header">
		<ul>
			<li style="float: left"><a class="active" href="#about">TRIP
					PLANNER</a></li>
			<li><a href="#">Logout</a></li>
			<li><a href="./myPosts">My Posts</a></li>
			<li><a href="./createPost">Create new Post</a></li>
			<li><a class="active" href="./traveller/otherPosts">Feed</a></li>
		</ul>
	</div>


	<section id="maincontent">
		<c:set var="path" value=" ${pageContext.request.contextPath}" />
		<c:forEach var="list" items="${allJobs}">
			<div class="card">
				<h3>${list.countryOfTravel}</h3>
				<img src="../resources/images/santorini.jpg" alt="Avatar"
					style="width: 100%">
				<div class="container">
					<span>${list.title}</span> <span>Month Of Travel :
						${list.monthOfVisit}</span> </br> 
						<a href="./viewDetails?postId=${list.postId}" >
						<button>View Details</button>
						</a>

					<!-- <button type="submit">View details</button> -->
				</div>
			</div>
		</c:forEach>
	</section>
</body>
</html>