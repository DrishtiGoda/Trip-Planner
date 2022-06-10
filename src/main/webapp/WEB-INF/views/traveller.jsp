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
	background-image: linear-gradient(96deg, #fc6076 0%, #ff9a44 100%);
	
}

li {
	float: right;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover {
	background-color: #111;
}

img {
	width: 100%;
	height: calc(100vh - 60px);
}
</style>

<title>Trip Planner</title>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/sample.js"></script>
</head>
<body>
	<div class="header">
		<ul>
			<li style="float: left"><a class="active" href="#about">TRIP
					PLANNER</a></li>
			<li><a href="#">Logout</a></li>
			<li><a href="./traveller/myPosts">My Posts</a></li>
			<li><a href="./traveller/createPost">Create new Post</a></li>
			<li><a class="active" href="./traveller/otherPosts">Feed</a></li>
		</ul>
		<img src="${pageContext.request.contextPath}/resources/images/beach.jpg" />
	</div>
</body>
</html>