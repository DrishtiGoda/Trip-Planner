<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	margin: 0px;
	padding: 0px;
}

body, h1, h2, h3, h4, h5, h6 {
	font-family: Poppins
}

.myLink {
	display: none
}

.active{
font-size:20px;
font-weight: bolder;
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

.about {
	background-color: black;
	color: white;
	padding: 50px;
}

footer {
	background-color: black;
	color: white;
	padding: 15px;
	margin-top: 20px;
	display: flex; align-items : center;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<div class="header">
		<ul>
			<li style="float: left"><a class="active" href="#about">TRIP
					PLANNER</a></li>
			<li><a href="#">Logout</a></li>
			<li><a href="./login">Login</a></li>
			<li><a href="./traveller/myPosts">My Posts</a></li>
			<li><a href="./traveller/createPost">Create new Post</a></li>
			<li><a href="./traveller/otherPosts">Feed</a></li>
		</ul>
	</div>
	
	<img src="	https://www.w3schools.com/w3images/london2.jpg" />

	<div class="w3-content" style="max-width: 1100px;">
		<!-- Good offers -->
		<div class="w3-container w3-margin-top">
			<h3>Explore the world!</h3>
		</div>
		<div class="w3-row-padding w3-text-white w3-large">
			<div class="w3-half w3-margin-bottom">
				<div class="w3-display-container">
					<img src="https://www.w3schools.com/w3images/cinqueterre.jpg"
						alt="Cinque Terre" style="width: 100%"> <span
						class="w3-display-bottomleft w3-padding">Cinque Terre</span>
				</div>
			</div>
			<div class="w3-half">
				<div class="w3-row-padding" style="margin: 0 -16px">
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="	https://www.w3schools.com/w3images/newyork2.jpg"
								alt="New York" style="width: 100%"> <span
								class="w3-display-bottomleft w3-padding">New York</span>
						</div>
					</div>
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="https://www.w3schools.com/w3images/sanfran.jpg"
								alt="San Francisco" style="width: 100%"> <span
								class="w3-display-bottomleft w3-padding">San Francisco</span>
						</div>
					</div>
				</div>
				<div class="w3-row-padding" style="margin: 0 -16px">
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="	https://www.w3schools.com/w3images/pisa.jpg"
								alt="Pisa" style="width: 100%"> <span
								class="w3-display-bottomleft w3-padding">Pisa</span>
						</div>
					</div>
					<div class="w3-half w3-margin-bottom">
						<div class="w3-display-container">
							<img src="	https://www.w3schools.com/w3images/paris.jpg"
								alt="Paris" style="width: 100%"> <span
								class="w3-display-bottomleft w3-padding">Paris</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Explore Nature -->
		<div class="w3-container">
			<h3>About Us</h3>
		</div>

		<div class="w3-row-padding about">
			<div class="w3-half w3-margin-bottom">
				<h4>Trip Planner is a website for travellers who love to share
					their trip experience and help people to design their own vacation
					from these experiences</h4>
			</div>
			<div class="w3-half w3-margin-bottom">
				<h4>You can add your travel post with details like itenary and
					images which can be viewed by all users all over the world to
					enhance their Holidays!</h4>
			</div>
		</div>



		<!-- Contact -->
		<div class="w3-container">
			<h2>Contact</h2>
			<i class="fa fa-map-marker" style="width: 30px"></i> Boston, US<br>
			<i class="fa fa-phone" style="width: 30px"></i> Phone: +1 8577019182<br>
			<i class="fa fa-envelope" style="width: 30px"> </i> Email:
			goda.d@northeastern.edu<br>
			<br />
			<form action="/action_page.php" target="_blank">
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="text"
						placeholder="Name" required name="Name">
				</p>
				<br />
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="text"
						placeholder="Email" required name="Email">
				</p>
				<br />
				<p>
					<input class="w3-input w3-padding-16 w3-border" type="text"
						placeholder="Message" required name="Message">
				</p>
				<br />
				<p>
					<button class="w3-button w3-black w3-padding-large" type="submit">SEND
						MESSAGE</button>
				</p>
			</form>
		</div>

		<!-- End page content -->
	</div>

	<!-- Footer -->
	<!-- 
<footer class="w3-container w3-center w3-opacity w3-margin-bottom">
		<h5>Find Us On</h5>
		<div class="w3-xlarge w3-padding-16">
			<i class="fa fa-facebook-official w3-hover-opacity"></i> <i
				class="fa fa-instagram w3-hover-opacity"></i> <i
				class="fa fa-snapchat w3-hover-opacity"></i> <i
				class="fa fa-pinterest-p w3-hover-opacity"></i> <i
				class="fa fa-twitter w3-hover-opacity"></i> <i
				class="fa fa-linkedin w3-hover-opacity"></i>
		</div>
		<p class="footer">
			Copyright Trip Planner 2022</a>
		</p>
	</footer>

 -->


	<footer>
		<p class="footer">
			Copyright &copy Trip Planner 2022</a>
		</p>
	</footer>

	<script>
		// Tabs
		function openLink(evt, linkName) {
			var i, x, tablinks;
			x = document.getElementsByClassName("myLink");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink");
			for (i = 0; i < x.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" w3-red", "");
			}
			document.getElementById(linkName).style.display = "block";
			evt.currentTarget.className += " w3-red";
		}

		// Click on the first tablink on load
		document.getElementsByClassName("tablink")[0].click();
	</script>

</body>
</html>