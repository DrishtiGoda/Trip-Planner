<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
* {
	margin: 0px;
	pading: 0px;
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

input[type=text], textarea {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit], button {
	width: 100%;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	background-color: black;
}

.container {
	width: auto;
	margin: 10px 0px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
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

	<div class="container">

		<h2>Update Post</h2>

		<form name="contact-form" method="post" action="./updateApplication">

			<input type="hidden" name="id" value="${postDetails.postId}">

			<input type="text" name="title" placeholder="Title"
				required="required" value="${postDetails.title}" /> <input
				type="text" placeholder="Company Name" name="countryOfTravel"
				required="required" value="${postDetails.countryOfTravel}" /> <input
				type="text" placeholder="Type of Job" name="travelledFrom"
				required="required" value="${postDetails.travelledFrom}" /> <input
				type="text" placeholder="Country" name="monthOfVisit"
				required="required" value="${postDetails.monthOfVisit}" /> <input
				type="text" placeholder="Industry" name="firstDay"
				required="required" value="${postDetails.firstDay}" /> <input
				type="text" placeholder="Major" name="secondDay" required="required"
				value="${postDetails.secondDay}" />

			<button type="submit">Update Post</button>

		</form>
	</div>
</body>
</html>