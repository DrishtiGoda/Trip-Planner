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

input[type=email], input[type=password], input[type=text] {
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
	background-color: #4CAF50;
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
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.signIn{
text-align:center;
}
</style>


<title>Trip Planner</title>
</head>
<body>



	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div>
		<form name="contact-form" method="post" action="./register"
			modelAttribute="user">
			
			<h2>Register</h2>

			<input type="text" name="username" placeholder="Enter username" /> <br />

			<input type="text" name="firstName" placeholder="Enter firstname" /> 	<br /> 
		
			<input type="text" name="lastName" placeholder="Enter lastname" /> <br /> 
			
			<input type="text" name="address" placeholder="Enter address" /> <br /> 
			
			<input type="text" name="phone" placeholder="Enter phone number" /> <br />

			<input type="email" name="email" placeholder="Enter email" /> <br />

			<input type="password" id="password" name="password"
				placeholder="Enter password" /><br /> <input type="password"
				id="c_password" name="confirmPassword"
				placeholder="Re-enter Password" />

			<label>Who are you?</label>
			<input type="radio" name="role" value="ROLE_TRAVELLER" /> Traveller
			<input type="radio" name="role" value="ROLE_ADMIN" /> Admin

		<button type="submit">Register Now</button>
		</form>
		<div class="signIn">
			Already have an account? <a href="./login">Sign in</a>
		</div>
	</div>

</body>
</html>