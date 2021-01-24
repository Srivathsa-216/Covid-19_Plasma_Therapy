<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="dao.DAO"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<!-- Mirrored from p.w3layouts.com/demos/aug-2016/29-08-2016/flat_sign_up_form/web/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 07 Nov 2020 12:13:45 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
<title>Sign Up Form Hospital</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Flat Sign Up Form Responsive Widget Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Meta tag Keywords -->
<!-- css files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<!-- //css files -->
<!-- online-fonts -->
<link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'><link href='http://fonts.googleapis.com/css?family=Raleway+Dots' rel='stylesheet' type='text/css'>
</head>
<body>
<script src='js/jquery.min.js'></script><script src="js/monetization.js" type="text/javascript"></script>
<script>
(function(){
	if(typeof _bsa !== 'undefined' && _bsa) {
  		// format, zoneKey, segment:value, options
  		_bsa.init('flexbar', 'CKYI627U', 'placement:w3layoutscom');
  	}
})();
</script>
<script>
(function(){
if(typeof _bsa !== 'undefined' && _bsa) {
	// format, zoneKey, segment:value, options
	_bsa.init('fancybar', 'CKYDL2JN', 'placement:demo');
}
})();
</script>
<script>
(function(){
	if(typeof _bsa !== 'undefined' && _bsa) {
  		// format, zoneKey, segment:value, options
  		_bsa.init('stickybox', 'CKYI653J', 'placement:w3layoutscom');
  	}
})();
</script>
<!--<script>(function(v,d,o,ai){ai=d.createElement("script");ai.defer=true;ai.async=true;ai.src=v.location.protocol+o;d.head.appendChild(ai);})(window, document, "//a.vdo.ai/core/w3layouts_V2/vdo.ai.js?vdo=34");</script>-->
<div id="codefund"><!-- fallback content --></div>
<script src="https://ethicalads.io/?ref=codefund" async="async"></script>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src='https://www.googletagmanager.com/gtag/js?id=UA-149859901-1'></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-149859901-1');
</script>

<script>
     window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
     ga('create', 'UA-149859901-1', 'demo.w3layouts.com');
     ga('require', 'eventTracker');
     ga('require', 'outboundLinkTracker');
     ga('require', 'urlChangeTracker');
     ga('send', 'pageview');
   </script>
<script async src='js/autotrack.js'></script>

<meta name="robots" content="noindex">
<body><link rel="stylesheet" href="css/demobar_w3_4thDec2019.css">

<!--header-->
	<div class="header-w3l">
		<h1>HOSPITAL SIGN UP FORM</h1>
	</div>
<!--//header-->
<!---728x90--->
<%!
DAO dao = new DAO();
%>

<%

if (request.getParameter("submit_btn") != null) {
	String Name = request.getParameter("Name");
	String Number = request.getParameter("Number");
	String Address = request.getParameter("Address");
	String mail = request.getParameter("mail");
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	String sql = String.format(
			"insert into hospital (Name, Phone_no, Address, Email, Username, Password) values('%s', '%s','%s', '%s', '%s', '%s')",
			Name, Number, Address, mail, username, password);

	if(dao.putData(sql) > 0){
        %>
            <script type="text/JavaScript">
                alert("Signup successful!! You can login now...");
                window.location.href="../login2/login2.jsp";
                //response.sendRedirect("../login1/index.jsp");
            </script>
        <%
        }
        else{
            %>
            <script type="text/JavaScript">
                alert("There seems to be an issue, try again! Student ID may already exist..");
                window.location.href="../signup2/signup2.jsp";
                
            </script>
        <%
        }
        
    }


%>



<!--main-->
<div class="main-agileits">
	<h2 class="sub-head">Sign Up</h2>
		<div class="sub-main">	
			<form  method="post">
				<input placeholder="Name" name="Name" type="text" required="" id="Name">
				<span class="icon1"><i class="fa fa-user" aria-hidden="true"></i></span><br>

				<input placeholder="Phone Number" name="Number" type="text"
					required="" id="Number"> <span class="icon2"><i
					class="fa fa-phone" aria-hidden="true"></i></span><br> 
					
				<input
					placeholder="Address" name="Address" type="text" required="" id="Address">
				<span class="icon3"><i class="fa fa-home" aria-hidden="true"></i></span><br>


				<input placeholder="Mail" name="mail" type="text" required="" id="mail">
				<span class="icon4"><i class="fa fa-user" aria-hidden="true"></i></span><br>


				<input placeholder="Username" name="username" type="text" required="" id="username">
				<span class="icon5"><i class="fa fa-user" aria-hidden="true"></i></span><br>


				<input placeholder="Password" name="password" type="password"
					required="" id="password"> <span class="icon6"><i
					class="fa fa-unlock" aria-hidden="true"></i></span><br> 
					
					<input
					placeholder="Confirm Password" name="cpassword" type="password"
					required="" id="cpassword"> <span class="icon6"><i
					class="fa fa-unlock" aria-hidden="true"></i></span><br> 
					<button type="submit" name="submit_btn" onclick="return validate()" >Sign UP</button>
					
					
			</form>
		</div>
		<div class="clear"></div>
</div>

<script type="text/javascript">

  function validate() {
    
    var Name = document.getElementById("Name").value;
    var Number = document.getElementById("Number").value;
    var Address = document.getElementById("Address").value;
    var mail = document.getElementById("mail").value;
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var cpassword = document.getElementById("cpassword").value;

  if (Name == "") {
    alert("Please fill the Name");
        return false;
  }

  if ((Name.length <= 2) || (Name.length > 40)) {
    alert("Name length must be between 2 to 40");
        return false;
  }
  
  if (!isNaN(Name)) {
    alert("Only characters are allowed for Name");
        return false;
  }

  if (Number == "") {
    alert("Please fill the Phone number");
        return false;
  }

  if (isNaN(Number)) {
    alert("Phone Number should be only digits, not Characters");
        return false;
  }

  if (Number.length != 10) {
    alert("User must enter 10 digit number");
        return false;
  }

  if (Address == "") {
    alert("Plaese fill the Address");
        return false;
  }

  if ((Address.length <= 30) || (Address.length > 100)) {
    alert("length must be between 30 to 100 in address field");
        return false;
  }

  if (mail == "") {
    alert("Please fill your email");
        return false;
  }

  if (mail.indexOf('@') <= 0) {
    alert("@ Invalid Position in email field");
        return false;
  }

  if ((mail.charAt(mail.length - 4) != '.' && mail.charAt(mail.length - 3) != '.')) {
    alert(". Invalid Position in email field");
        return false;
  }

  if ((username == "")) {
    alert("Please fil the Username");
        return false;
  }

  if ((username.length <= 2) || (username.length > 20)) {
    alert("username length must be between 2 to 20");
        return false;
  }

  if (!isNaN(username)) {
    alert("only charactors are allowed in username");
        return false;
  }

  if (password == "") {
    alert("Please fill the Password");
        return false;
  }

  if (cpassword == "") {
    alert("Please fill the Confirm Password");
        return false;
  }

  if (password != cpassword) {
    alert("Password do not match");
        return false;
  }
  }
</script>





<!--//main-->
<!---728x90--->

<!--footer-->
<div class="footer-w3">
</div>
<!--//footer-->
<!---728x90--->

</body>

<!-- Mirrored from p.w3layouts.com/demos/aug-2016/29-08-2016/flat_sign_up_form/web/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 07 Nov 2020 12:14:40 GMT -->
</html>