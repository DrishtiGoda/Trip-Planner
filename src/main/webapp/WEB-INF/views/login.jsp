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

input[type=email], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: black;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size:16px;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

button {
	width: 100%;
	background-color: black;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>




<title>Trip Planner</title>
</head>
<body>
	<div>
		<form method="post" name="contact-form" action="./login" modelAttribute="user">
			<h2>Login</h2>

			<div style="color: red">${error}</div>

			 <label for="fname">Email</label> 
			 <input type="email" name="email" placeholder="Email" required="required" "/> 
				
				<label for="fname">Password</label>
				<input type="password" name="password" placeholder="Password" required="required" />
		
				<button type="submit">Sign in</button>
		</form>
	</div>
</body>
</html>