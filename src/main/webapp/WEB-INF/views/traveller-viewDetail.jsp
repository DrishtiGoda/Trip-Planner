<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	width: auto;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.card {
	width: 60%;
	margin: auto;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}

.innerDiv {
	width: 100%;
	margin: 10px 10px;
}

textarea {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	width: 100%;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	background-color: black;
}

.fa {
	font-size: 50px;
	cursor: pointer;
	user-select: none;
}

.fa:hover {
	color: darkblue;
}
</style>
<title>Trip Planner</title>
</head>
<body>

	<ul>
		<li style="float: left"><a class="active" href="#about">TRIP
				PLANNER</a></li>
		<li><a href="#">Logout</a></li>
		<li><a href="./traveller/myPosts">My Posts</a></li>
		<li><a href="./createPost">Create new Post</a></li>
		<li><a class="active" href="./otherPosts">Feed</a></li>
	</ul>


	<!-- 
	<img src="../resources/images/santorini.jpg" alt="Avatar"
					style="width: 100%">
			 -->

	<section id="maincontent">
		<c:set var="path" value=" ${pageContext.request.contextPath}" />


		<table id="jobTable" class="table table-bordered">

			<c:forEach var="list" items="${postDetails}">

				<div class="card">
					<img src="../resources/images/santorini.jpg" alt="Avatar"
						style="width: 100%">
					<div class="innerDiv">
						<br />
						<h2>${list.title}</h2>
						<p>Country of Travel : ${list.countryOfTravel}</p>
						<p>Travelled From : ${list.travelledFrom}</p>
						<p>Month of Visit : ${list.monthOfVisit}</p>
						<br />
						<h3>Itenary</h3>
						<p>Day 1 : ${list.firstDay}</p>
						<p>Day 2 : ${list.secondDay}</p>
					</div>
					<i onclick="myFunction(this)" class="fa fa-thumbs-up"></i>
					<h3>Leave a Comment</h3>

					<textarea name="comment" rows="3" cols="25"
						placeholder="Enter comment..." required="required"></textarea>

					<button>Submit</button>

				</div>

			</c:forEach>
		</table>

	</section>
</body>

<script>
	function myFunction(x) {
		x.classList.toggle("fa-thumbs-down");
	}
</script>
</html>