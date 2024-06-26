<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script type="text/javascript">
		var store_name = 'Digital Art Management System';
		document.title = store_name;
		document.write("<center><h1>" + store_name + "</h1></center>");
	</script>
</head>
<body>
	<?php
		include 'connection.php';
		$conn = OpenCon();
		if (mysqli_connect_errno())	
		{
			echo "Unable to connect to server " . mysqli_connect_error();
		}
		$insert_conn = OpenCon();
		if (mysqli_connect_errno())	
		{
			echo "Unable to connect to server " . mysqli_connect_error();
		}
		session_start();
		$username = $_SESSION["username"];
		if ($_SESSION['admin'] == true)
		{
			echo '<script>window.history.back()</script>';
			exit;
		}
		
		if ($_SESSION['logged_in'] == false)
		{
			echo '<script>alert("You are not logged in. You must be logged in to view this page.")</script>';
			echo '<script>window.history.back()</script>';
			exit;
		}

		if ($_SERVER['REQUEST_METHOD'] == 'POST') {
			$whatsapp_number = $_POST['whatsapp_number'];
			
			$query = 'SELECT order_id from orders ORDER by order_id DESC';
			$result = mysqli_query($conn, $query);
			$row = $result->fetch_assoc();
			$order = $row['order_id'];
			$order = $order + 1;
			$query = 'INSERT INTO orders(user_id, order_id, status, whatsapp_number) VALUES(' . $username . ',' . $order . ',\'pending\', \'' . $whatsapp_number . '\')';
			$result = mysqli_query($conn, $query);
			$query = 'SELECT product_id, quantity, total FROM cart where user_id = ' . $username;
			$result = mysqli_query($conn, $query);
			if ($result->num_rows == 0) {
				echo '<script>alert("No products in cart");</script>';
				echo '<script>window.history.back();</script>';
				exit;
			} else {
				while ($row = $result->fetch_assoc()) {
					$prod_id = $row['product_id'];
					$quan = $row['quantity'];
					$tot = $row['total'];
					$insert_query = 'INSERT INTO buy(user_id, product_id, quantity, total, order_id) VALUES(' . $username . ',' . $prod_id . ',' . $quan . ',' . $tot . ',' . $order . ')';
					$insert_result = mysqli_query($insert_conn, $insert_query);
					if ($insert_result == 0) {
						echo '<script>alert("Error ordering products. Please try later")</script>';
						exit;
					}
				}
				$query = 'DELETE FROM cart where user_id=' . $username;
				$result = mysqli_query($conn, $query);
				echo '<script>alert("Your products have been ordered. Your ORDERID = ' . $order . '. You will soon have your order at your doorstep");</script>';
				echo '<p>Transaction successful. Please wait for the artist to contact you via WhatsApp.</p>';
			}
		} else {
			echo '<form method="POST" action="">
					<label for="whatsapp_number">Enter your WhatsApp number:</label>
					<input type="text" id="whatsapp_number" name="whatsapp_number" required>
					<input type="submit" value="Submit">
				  </form>';
		}
	?>
</body>
</html>
