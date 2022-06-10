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

.container {
	width: auto;
	margin: 10px 0px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
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
			<li><a class="active" href="./otherPosts">Feed</a></li>
		</ul>
	</div>

	<div class="container">
		<h2>Create New Post</h2>
		<form method="post" name="contact-form" action="./createPost"
			modelAttribute="user">


			<div style="color: red">${error}</div>

			<input type="text" name="title" placeholder="Enter title"
				required="required" /> <input type="text" name="travelledFrom"
				placeholder="Enter source country" required="required" /> <input
				type="text" name="countryOfTravel" placeholder="Enter destination"
				required="required" /> <input type="text" name="monthOfVisit"
				placeholder="Enter month of visit" required="required" />

			<h3>Itenary</h3>

			<textarea name="firstDay" rows="3" cols="25"
				placeholder="Enter itenary for day 1" required="required"></textarea>

			<textarea name="secondDay" rows="3" cols="25"
				placeholder="Enter itenary for day 2" required="required"></textarea>


			Select File: <input type="file" name="file" /> <input type="submit"
				value="Upload File" />


			<button type="submit">Add Post</button>

		</form>
</body>
</html>