<?php 
session_start();
include('includes/config.php');
error_reporting(0);
?>

<html>
<head>
<title>Mpesa API</title>
<!--Bootstrap -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="assets/css/style.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
<link href="assets/css/slick.css" rel="stylesheet">
<link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
</head>
<body  class="container">

<?php include('includes/header.php');?>


	<center>

<h2>Pay Booking</h2>

<form  action="" method="post">
 
  Phone Number:<br>
  <input class="form-group" type="text" name="phoneNumber" value="">
  <br>
   Amount:<br>
   <br>
  <input class="form-group" type="text" name="amount" value="">
  <br>

  <br><br>
  <input class="btn btn-primary" type="submit" value="Pay" onclick="callAPI()">
</form> 
<a href="my-booking.php" class="btn btn-secondary">Confirm your Booking</a>
</center>

<script>
function callAPI(){
	// call the API here
    var amount = document.querySelector('input[name="amount"]').value;
	var phoneNumber = document.querySelector('input[name="phoneNumber"]').value;
	var shortCode = document.querySelector('input[name="shortCode"]').value;
	var mpesaSecret = document.querySelector('input[name="mpesaSecret"]').value;

	var timestamp = Date.now();

	var password = btoa(shortCode + mpesaSecret + timestamp);

	var endpoint = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';

	var data = {
		//Fill in the request parameters with valid values
		'BusinessShortCode': shortCode,
		'Password': password,
		'Timestamp': timestamp,
		'TransactionType': 'CustomerPayBillOnline',
		'Amount': amount,
		'PartyA': phoneNumber,
		'PartyB': shortCode,
		'PhoneNumber': phoneNumber,
		'CallBackURL': 'http://example.com/callback.php',
		'AccountReference': '12345678',
		'TransactionDesc': 'Test Payment'
	};

	fetch(endpoint, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'Authorization': 'Bearer ' + access_token
		},
		body: JSON.stringify(data)
	})
	.then(response => {
		// handle response
	})
	.catch(err => {
		// handle error
	});
}
</script>

</body>
</html>