<?php 
session_start();
	if(empty($_SESSION['user_info'])){
		echo "<script type='text/javascript'>alert('Please login before proceeding further!');</script>";
	}
$conn = mysqli_connect("localhost","root","","railway");
if(!$conn){  
	echo "<script type='text/javascript'>alert('Database failed');</script>";
  	die('Could not connect: '.mysqli_connect_error());  
}

if (isset($_POST['submit']))
{
$trains=$_POST['trains'];
$sql = "SELECT t_no FROM trains WHERE t_name = '$trains'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$email=$_SESSION['user_info'];
$query="UPDATE passengers SET t_no='$row[t_no]' WHERE email='$email';";
	if(mysqli_query($conn, $query))
{  
	// echo "<script type = 'text/javascript'>alert(`{$trains}`)></script>";
	$message = $trains;
	// $message = $sql;
	// $message = "Ticket booked successfully";
}
	else {
		$message="Transaction failed";
	}
	echo "<script type='text/javascript'>alert('$message');</script>";
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Book a ticket</title>
	<LINK REL="STYLESHEET" HREF="css/style.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&display=swap" rel="stylesheet">
	<style type="text/css">
		#booktkt	{
			margin:auto;
			margin-top: 50px;
			width: 40%;
			height: 60%;
			padding: auto;
			padding-top: 50px;
			padding-left: 50px;
			background-color: rgba(0,0,0,0.3);
			border-radius: 25px;
		}
		html { 
		  background: url(img/bg7.jpg) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		}
		#journeytext	{
			color: white;
			font-size: 28px;
			font-family: 'Baloo Bhai 2', cursive;
		}
		
		#trains	{
			/* margin-left: 90px; */
			text-align: center;
			font-size: 15px;
			border: 2px solid black;
			border-right: 5px solid black;
			border-bottom: 5px solid black;
			border-radius: 10px;
		}
		.submit	{
			width: 50px;	
		}
		.custom{
			background-color: white;
			color: red;
		}
	</style>
	<script type="text/javascript">
		function validate()	{
			var trains=document.getElementById("trains");
			if(trains.selectedIndex==0)
			{
				alert("Please select your train");
				trains.focus();
				return false;		
			}
		}
	</script>
</head>
<body>
	<?php
		include ('header.php');
	?>
	<div id="booktkt">
	<h1 align="center" id="journeytext">Choose your journey</h1><br/><br/>
	<form method="post" name="journeyform" onsubmit="return validate()">
		<select id="trains" name="trains" required>
			<option class="custom" selected disabled>-------------------Select trains here----------------------</option>
			<option class="custom" value="rajdhani" >Rajdhani Express - Mumbai Central to Delhi</option>
			<option class="custom" value="duronto" >Duronto Express - Mumbai Central to Ernakulum</option>
			<option class="custom" value="geetanjali">Geetanjali Express - CST to Kolkata</option>
			<option class="custom" value="garibrath" >Garib Rath - Udaipur to Jammu Tawi</option>
			<option class="custom" value="mysoreexp" >Mysore Express - Talguppa to Mysore Jn</option>
			<option class="custom" value="godanexp" >Godan Express - Lokmanya Tilak to Gorakhpur</option>
			<option class="custom" value="chennaiexp" >Chennai Express - Dadar to Chennai Central</option>
		</select>
		<br/><br/>
		<input type="submit" name="submit" id="submit" class="button" />
	</form>
	</div>
	</body>
	</html>