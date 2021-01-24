<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<!-- Mirrored from colorlib.com/etc/lf/Login_v5/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 07 Nov 2020 13:32:47 GMT -->
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<!-- /Added by HTTrack -->
<head>
<title>Login Blood Bank</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">

<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">

<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">

<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">

<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">

<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">
			
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				
				<form action="../../LoginControlBB" method = "post" class="login100-form validate-form flex-sb flex-w">
					
					<span class="login100-form-title p-b-53"> Blood Bank Login </span>

					<div class="p-t-31 p-b-9">
						<span class="txt1"> Username </span>
					</div>
					
					
					<div class="wrap-input100 validate-input"
						data-validate="Username is required">
						<input class="input100" type="text" name="username"> <span
							class="focus-input100"></span>
					</div>
					
					
					<div class="p-t-13 p-b-9">
						<span class="txt1"> Password </span> 
					</div>
					
					
					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="pass"> <span
							class="focus-input100"></span>
					</div>
					
					
					<div class="container-login100-form-btn m-t-17">
						<a href="../BloodBank/Home1/index.jsp"><button type="submit"
								class="login100-form-btn">Login</button></a>
					</div>
					
					
					<div class="w-full text-center p-t-55">
						<span class="txt2"> Not a member? </span> <a
							href="../signup1/signup1.jsp" class="txt2 bo1"> Sign up now </a>
					</div>
				
				
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>

	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>

	<script src="vendor/animsition/js/animsition.min.js"></script>

	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="vendor/select2/select2.min.js"></script>

	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>

	<script src="vendor/countdowntime/countdowntime.js"></script>

	<script src="js/main.js"></script>

	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>
</body>

<!-- Mirrored from colorlib.com/etc/lf/Login_v5/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 07 Nov 2020 13:32:53 GMT -->
</html>
