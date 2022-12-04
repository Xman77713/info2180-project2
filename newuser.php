<?php
session_start();

$regex_password = "/(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$/";

if (isset($_SESSION['userrole'])) {
	echo "id of {$_SESSION['useremail']} is: {$_SESSION['userid']}<br>";
}
else {
	echo "You are not logged in!";
}
echo '
<!-- Add User -->
	<section>
		<div id="db-newuser-header" class="dbdiv-header">
			<h2>New User</h2>
		</div>

		<form id="newuserform"
			action="http://localhost/phpmyadmin/index.php?route=/table/structure&db=dolphin_crm&table=users">

			<div class="splittwo">
				<div class="inline-flex">
					<label for="fname">First Name</label>
					<input type="text" id="fname" name="fname" placeholder="Jane">
				</div>

				<div class="inline-flex">
					<label for="lname">Last Name</label>
					<input type="text" id="lname" name="lname" placeholder="Doe">
				</div>
			</div>

			<div class="splittwo">
				<div class="inline-flex">
					<label for="email">Email</label>
					<input type="text" id="email" name="email" placeholder="something@example.com">
				</div>

				<div class="inline-flex">
					<label for="password">Password</label>
					<input type="text" id="password" name="password">
				</div>
			</div>


			<form id="role"
				action="http://localhost/phpmyadmin/index.php?route=/table/structure&db=dolphin_crm&table=users">
				<select name="role">
					<option value="member">Member</option>
				</select>


				<input type="button" id="newusersave" value="Save">


			</form>
		</form>
	</section>
'
/*
$host = 'localhost';
$dbusername = 'project2_user';
$dbpassword = 'password123';
$dbname = 'dolphin_crm';

$conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $dbusername, $dbpassword);
$regex_password = "/(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*$/";

if(isset($_POST[""])){
	$password = filter_var($_POST[''], FILTER_SANITIZE_STRING);
	$email = filter_var($_POST[''], FILTER_SANITIZE_EMAIL);
	if(preg_match($regex_password, $password)) {
		$query = "SELECT * FROM Users WHERE Users.email = '{$email}'";
		$stmt = $conn->query($query);
		$results = $stmt->fetchALL(PDO::FETCH_ASSOC);
		
		if (sizeof($results) == 1) {
			echo "hello 6<br>";
			if ($results[0]["role"] == "Admin") {
				echo "hello 7<br>";
				if ($results[0]["password"] ==  $password) {
					$_SESSION['logged-in'] = true;
					$_SESSION['userid'] = $results[0]['id'];
					?><p>admin log in</p><?php
					exit;
				}
			}
			elseif (password_verify($password, $results[0]['password'])) {
				$_SESSION['logged-in'] = true;
				$_SESSION['userid'] = $results[0]['id'];
				?><p>user log in</p><?php
			}
		}
	}
	else {
		echo "hello 4<br>";
	}
}
else {
	echo "hello 3<br>";
}

$conn = null;
*/
?>