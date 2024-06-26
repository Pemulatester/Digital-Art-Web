<!DOCTYPE html>
<html>
<head>
	<title>Digital Art Management System</title>
	<script type="text/javascript">
		var store_name = 'Digital Art Management System';
		document.title = store_name;
		document.write("<center><h1>" + store_name + "</h1></center>");

		function showlogin() {
			document.getElementById('disp_login').style.display = "block";
			document.getElementById('disp_welcome').style.display = "none";
		}

		function hidelogin() {
			document.getElementById('disp_login').style.display = "none";
			document.getElementById('disp_welcome').style.display = "block";
		}
	</script>
</head>
<body>
	<div id="disp_welcome">
		<form method="POST" action="">
			<label for="first_name">First Name:</label>
			<input type="text" id="first_name" name="first_name" required><br>

			<label for="last_name">Last Name:</label>
			<input type="text" id="last_name" name="last_name" required><br>

			<label for="username">Username:</label>
			<input type="text" id="username" name="username" required><br>

			<label for="password">Password:</label>
			<input type="password" id="password" name="password" required><br>

			<label for="c_password">Confirm Password:</label>
			<input type="password" id="c_password" name="c_password" required><br>

			<label for="address">Address:</label>
			<input type="text" id="address" name="address" required><br>

			<input type="submit" value="Sign Up">
		</form>
	</div>

	<div id="disp_login" style="display:none;">
		<p>Welcome back! Please log in.</p>
		<!-- Add your login form here -->
	</div>

	<?php 
		ini_set('error_reporting', 'E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR');
		session_start();

		include 'connection.php';
		$conn = OpenCon();

		if (mysqli_connect_errno()) {
			echo "Unable to connect to server " . mysqli_connect_error();
			exit;
		}

		if ($_SESSION['logged_in'] == true) {
			echo '<script>alert("You must be logged out to sign up.");</script>';
			exit;
		}

		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$u_fn = $_POST["first_name"];
			$u_ln = $_POST["last_name"];
			$u_username = $_POST["username"];
			$u_p = $_POST["password"];
			$u_cp = $_POST["c_password"];
			$u_addr = $_POST["address"];

			if (empty($u_fn) || empty($u_ln) || empty($u_username) || empty($u_p) || empty($u_cp) || empty($u_addr)) {
				echo '<script>alert("Error in data. Please re-sign-up.");</script>';
				echo '<script>window.history.back();</script>';
				exit;
			}

			if ($u_cp !== $u_p) {
				echo '<script>alert("Password and Confirm Password fields mismatch.");</script>';
				exit;
			}

			$check = "SELECT * FROM userss WHERE username = '$u_username'";
			$result = mysqli_query($conn, $check);

			if ($result->num_rows > 0) {
				echo '<script>alert("Account already exists with this username.");</script>';
				echo '<script>showlogin();</script>';
				exit;
			} else {
				$insert_query = "INSERT INTO userss (first_name, last_name, password, wallet, address, username) VALUES ('$u_fn', '$u_ln', '$u_p', 0, '$u_addr', '$u_username')";
				$add = mysqli_query($conn, $insert_query);

				if ($add) {
					$user_id = mysqli_insert_id($conn);
					echo '<script>alert("'.$u_fn.' '.$u_ln.', your account has been created. Now you can buy products. Your USERNAME/USERID is \''.$user_id.'\'");</script>';
					$_SESSION["admin"] = false;
					$_SESSION["logged_in"] = true;
					$_SESSION["username"] = $u_username;
					$_SESSION["fullname"] = $u_fn . ' ' . $u_ln;
					$_SESSION["wallet"] = 0;
					echo '<script>hidelogin();</script>';
					echo '<meta http-equiv="refresh" content="0;url=login.php">';
				} else {
					echo '<script>alert("Error creating account. Please try again later.");</script>';
					echo '<script>showlogin();</script>';
				}
			}
		}
	?>
</body>
</html>
