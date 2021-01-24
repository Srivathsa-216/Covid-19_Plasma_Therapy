<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="dao.DAO"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Blood Bank </title>
<link rel="shortcut icon" href="assets/images/fav.png"
	type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" href="assets/images/fav.jpg">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
<link rel="stylesheet"
	href="assets/plugins/grid-gallery/css/grid-gallery.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
<link rel="stylesheet" type="text/css" href="assets/css/style1.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
		$("#Donateit").click(function() {
			$("#Mydiv").css("display", "block");
		});
		$("#Donatenow").click(function() {
			$("#Mydiv").css("display", "none");
		});
	});
</script>

<script>
	$(document).ready(function() {
		$("#Donateit1").click(function() {
			$("#Mydiv1").css("display", "block");
		});
		$("#Donatenow1").click(function() {
			$("#Mydiv1").css("display", "none");
		});
	});
</script>

</head>

<body>

	<%!DAO dao = new DAO();%>

	<%
	if(request.getParameter("submit_btn_After_Donation") != null)
    {
		System.out.println("Entered");
      	String name = request.getParameter("name");
      	String Phone_no = request.getParameter("Phone_no");
        String Blood_Group = request.getParameter("Blood_Group");
        String plasma = request.getParameter("plasma"); 
        String IgM = request.getParameter("IgM");   
        String IgG = request.getParameter("IgG");
        
        String sql = "select Donor_id from donor where Name = '"+name+"' and Phone_no = '"+Phone_no+"' and Blood_Group = '"+Blood_Group+"'";
        ResultSet rs = dao.getData(sql);
        if(rs.next())
        {
        	System.out.println("Entered");
          int Donor_id = rs.getInt("Donor_id");          
          String username = (String)session.getAttribute("adminBB");
          String sql11 = "select Bbank_id from blood_bank where Username= '"+username+"'";
          ResultSet rs1 = dao.getData(sql11);
          if(rs1.next())
          {
              int Bbank_id = rs1.getInt("Bbank_id");
            String sql2 = "update donation set Bbank_id = "+Bbank_id+", Blood_Group = '"+Blood_Group+"', Quantity_of_plasma = "+plasma+", IgM = "+IgM+", IgG = "+IgG+" where Donor_id = "+Donor_id+"";
            if(dao.putData(sql2) > 0)
              {
              String status_update = "update donor set Donation_status = 'completed', Incentive = 'Given' where donor_id = "+Donor_id+"";
                if(dao.putData(status_update) > 0)
                {
                System.out.println("All the values has been added to donation table and the status is updated in donor table");
                  %>
                  <script type="text/JavaScript">
                      alert("Your Data Entered Successfully!!");
                    window.location.href="Home1.jsp";
                  </script>
                  <%
                }
                else
                {
                %>
                    <script type="text/JavaScript">
                        alert("Data is not valid with respect to the Registered Donor...");
                      window.location.href="Home1.jsp";               
                    </script>
                <%
                }
              }
          }
        }
        else{
    		%> <script type="text/JavaScript">
            	alert("Data in the Registration did not match with the entered data");
          	window.location.href="Home1.jsp";               
        	</script> 
    		<%  }
    }
	
	%>


	<%
		if (request.getParameter("submit_btn_Register") != null) {
		String name = request.getParameter("name1");
		String Phone_Number = request.getParameter("Phone_Number");
		String Address = request.getParameter("Address");
		String Age = request.getParameter("Age");
		String Weight = request.getParameter("Weight");
		String Blood_Group = request.getParameter("Blood_Group1");
		String Covid_Pos = request.getParameter("Covid_Pos");
		String Covid_Neg = request.getParameter("Covid_Neg");

		String sql = "call spRegister('"+name+"','"+Phone_Number+"','"+Address+"','"+Age+"','"+Weight+"','"+Blood_Group+"','"+Covid_Pos+"','"+Covid_Neg+"')";
		
		
		if (dao.putData(sql) > 0) {
			System.out.println("The data has been inserted into donor table");
			String sql1 = "select Donor_id from donor where Name = '" + name + "' and Phone_no = '" + Phone_Number + "'";
			ResultSet rs = dao.getData(sql1);
		if (rs.next()) {
		System.out.println("The id has been fetched from the donor table");
		int Donor_id = rs.getInt("donor_id");
		String sql2 = String.format("insert into donation (Donor_id) values(%d)", Donor_id);
		if (dao.putData(sql2) > 0) {
			System.out.println("The id has been added to donation table");
	%>
	<script type="text/JavaScript">
		alert("Your Data Entered Successfully!!");
		window.location.href = "Home1.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/JavaScript">
		alert("There seems to be an issue,Reenter the data... ");
		window.location.href = "Home1.jsp";
	</script>
	<%
		}
	}

	} else {
	%>
	<script type="text/JavaScript">
		alert("There seems to be an issue, Check the data entered or Donor may already exist...");
		window.location.href = "Home1.jsp";
	</script>
	<%
		}
	}
	%>


	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //http1.1
	response.setHeader("Pragma", "no-cache"); //http1.0
	response.setHeader("Expires", "0");//proxy

	if (session.getAttribute("adminBB") == null) {
		response.sendRedirect("../login1/login1.jsp");
	}
	%>

	Welcome ${adminBB}



<header class="continer-fluid ">
		<div class="header-top">
			<div class="container">
				<div class="row col-det">

					<div class="col-lg-6 d-none d-lg-block"></div>
					<div class="col-lg-6 col-md-12">

						<ul class="ulright">
							<li>
								<form action="../../LogoutControlBB" method="post">
									<a href="../login1/login1.jsp">

										<button
											class="btn btn-primary" type="submit">
											<i class="fas fa-user"></i>Logout
										</button>
									</a>

								</form>
							</li>
						</ul>

					</div>

				</div>
			</div>
		</div>
		<div id="menu-jk" class="header-bottom">
			<div class="container">
				<div class="row nav-row">
					<div class="col-md-3 logo">
						<img src="assets/images/logo.jpg" alt="">
					</div>
					<div class="col-md-9 nav-col">
						<nav class="navbar navbar-expand-lg navbar-light">

							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarNav"
								aria-controls="navbarNav" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarNav">
								<ul class="navbar-nav">
									<li class="nav-item"><a class="nav-link" href="#Donateit">Donation
											Details</a></li>

									<li class="nav-item"><a class="nav-link"
										href="../Home2/Home2.jsp">Hospital</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>


	<!-- ################# Slider Starts Here#######################--->

	<div class="slider-detail">

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>

			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="assets/images/slider/slide-02.jpg"
						alt="First slide">
					<div class="carousel-caption d-none d-md-block">
						<h5 class=" bounceInDown">Donate Plasma & Save a Life</h5>
						<p class=" bounceInLeft">
							Karnataka govt announces incentives of Rs 5,000 for COVID-19
							recovered plasma donors.<br> Plasma therapy is a medical
							procedure that uses the blood of a recovered patient to create
							antibodies on those infected individuals.<br> Medically
							known as convalescent plasma therapy, this treatment uses
							antibodies found in the blood taken from a recovered Covid-19
							patient.<br> It is then used to treat those with severe
							SARS-CoV-2 infection to aid recovery.<br>
						</p>

						<div class=" vbh"></div>
					</div>
				</div>

				<div class="carousel-item">
					<img class="d-block w-100" src="assets/images/slider/slide-03.jpg"
						alt="Third slide">
					<div class="carousel-caption vdg-cur d-none d-md-block">
						<h5 class=" bounceInDown">Donate Blood & Save a Life</h5>
						<p class=" bounceInLeft">
							Don't hesitate in donating blood.<br> Your donation helps in
							saving life of people. <br> If you start donating blood at
							the age of 18 and donated blood in every 90 days until you
							reached the age of 60,<br> you would have donated 192 units
							of blood, potentially helping save more than 400 lives.<br>
						</p>

						<div class=" vbh"></div>
					</div>
				</div>

			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a> <br> <br>
		</div>
		<br>
</div>
		<div class="sub-main">
			<form method="post">
				<div class="container main-agileits w-50 text-success text-center"><br><br><br><br><br>
				<input class="w-75" placeholder="Donor Name" name="name11" type="text" required=""> 
				<br>
				<input class="w-75" placeholder="Phone Number" name="Phone_no11" type="text" required="">
				<button type="submit" name="submit_btn_Reg_Verification">Submit</button>
				</div>
			</form>
		</div>


		<%
			if (request.getParameter("submit_btn_Reg_Verification") != null) {
		%>
		<div>
			<table id="mytable" class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Sl.no</th>
						<th scope="col">Name</th>
						<th scope="col">Ph.no</th>
						<th scope="col">address</th>
						<th scope="col">age</th>
						<th scope="col">Weight</th>
						<th scope="col">Blood Group</th>
						<th scope="col">Covid +ve Date</th>
						<th scope="col">Covid -ve Date</th>
						<th scope="col">Donation Status</th>
						<th scope="col">Incentives</th>
					</tr>
				</thead>
				<%
					String name11 = request.getParameter("name11");
				String Phone_no11 = request.getParameter("Phone_no11");
				String sql111 = "select * from donor where Name = '" + name11 + "' and Phone_no = '" + Phone_no11 + "'";
				ResultSet rs = dao.getData(sql111);
				%><tbody>
					<%
						if (rs.next()) {
					%>
					<tr>
						<th scope="row">1</th>
						<td><%=rs.getString("Name")%></td>
						<td><%=rs.getString("Phone_no")%></td>
						<td><%=rs.getString("Address")%></td>
						<td><%=rs.getString("Age")%></td>
						<td><%=rs.getString("Weight")%></td>
						<td><%=rs.getString("Blood_Group")%></td>
						<td><%=rs.getString("Covid_pos_date")%></td>
						<td><%=rs.getString("Covid_neg_date")%></td>
						<td><%=rs.getString("Donation_status")%></td>
						<td><%=rs.getString("Incentive")%></td>
					</tr>
					<%
						}
						else
						{
							%>
							<script type="text/JavaScript">
								alert("Donor is not Registered yet or Recheck the data entered...");
								window.location.href = "Home1.jsp";
							</script>
							<%
						}
					%>
				</tbody>
			</table>
		</div>
		<%
			}
		%>
		
		<br> <br> <br> <br> 
		
		<a href="#Mydiv"><button id="Donateit" type="button" class="btn btn-outline-danger">Donate</button></a>

		<div id="Mydiv" class="main-agileits"
			style="display: none; border-style: solid;">

			<h2 class="sub-head">Donation Details</h2>
			<div class="sub-main">
				
				<form method="post">
					
					<input placeholder="Donor Name" name="name" type="text" id="name2">

					<input placeholder="Phone Number" name="Phone_no" type="text" id="Phone_no2"> 
					
					<input placeholder="Blood Group" name="Blood_Group" type="text" id="Blood_Group3"> 
					
					<input placeholder="Quantity of Plasma 1 unit = 200ml" name="plasma" type="text" id="plasma"> 
					<br>
					<input placeholder="IgM level (OD ratio)a" name="IgM" type="number" step="0.01" min="0" max="8.36" id="IgM"> 
					<br><br>
					<input placeholder="IgG level (OD ratio)a,b" name="IgG" type="number" step="0.01" min="0" max="8.36" id="IgG">
					<br>
					<button type="submit" name="submit_btn_After_Donation" onclick="return validation();">Submit</button>
				
				</form>
				
				<a href="#mytable"><button id="Donatenow" type="button" class="btn btn-success btn-sm float-right">X</button></a>
			
			</div>
			
			<div class="clear"></div>

		</div>
		<br> 
		
		
		<script type="text/javascript">

  function validation() {
    
    var name2 = document.getElementById("name2").value;
    var Phone_no2 = document.getElementById("Phone_no2").value;
   	var Blood_Group3 = document.getElementById("Blood_Group3").value;
   	var plasma = document.getElementById("plasma").value;
    var IgM = document.getElementById("IgM").value;
    var IgG = document.getElementById("IgG").value;
    
    
    
    
  if(name2 == "") {
    alert("Please fill the Name");
        return false;
  }

  if(!isNaN(name2)) {
	    alert("Digits are not allowed for Name");
	        return false;
	 }
  
  if((name2.length <= 2) || (name2.length > 40)) {
    alert("Name length must be between 2 to 40");
        return false;
  }
  
  

  if (Phone_no2 == "") {
    alert("Please fill the Phone number");
        return false;
  }

  if (isNaN(Phone_no2)) {
    alert("Phone Number should be only digits, not Characters");
        return false;
  }

  if (Phone_no2.length != 10) {
    alert("User must enter 10 digit number");
        return false;
  }

  
  if (Blood_Group3 == "") {	
	    alert("Please fill your Blood Group");
	        return false;
  }
  
  if (!isNaN(Blood_Group3)) {
	    alert("Digits are not accepted to Blood Group");
	        return false;
	        
  }
  
   if (!(Blood_Group3 == "A+" || Blood_Group3 == "A-" || Blood_Group3 == "B+" || Blood_Group3 == "B-" || Blood_Group3 == "O+" || Blood_Group3 == "O-" || Blood_Group3 == "AB+" || Blood_Group3== "AB-")) {	
	    alert("Please Enter the blood group in the format Eg:A+");
	        return false;
  }
  
   if (plasma == "") {	
	    alert("Please fill your Plasma");
	        return false;
 }
  
   if (plasma != 1 ) {	
	    alert("You can Enter only 1 unit per Donor");
	        return false;
}
   
   if (IgM =="") {	
	    alert("Please Enter IgM level ");
	        return false;
}
   if (IgG =="") {	
	    alert("Please Enter IgG level ");
	        return false;
}
   
   
 

 }
</script>
		
		
		
		
		
		
		
		
		
		
		
		<a href="#Mydiv1"><button id="Donateit1" type="button" class="btn btn-outline-danger">Register</button></a>

		<div id="Mydiv1" class="main-agileits" style="display: none; border-style: solid;">

			<h2 class="sub-head">Donor Details</h2>
			<div class="sub-main">
				<form method="post">
					<input placeholder="Donor Name" name="name1" type="text" id="name1" > 
					
					<input placeholder="Phone Number Enter 10 digit" name="Phone_Number" type="text" id="Phone_Number" > 
					
					<input placeholder="Address" name="Address" type="text" id="Address" >

					<input placeholder="Age" name="Age" type="text" id="Age">

					<input placeholder="Weight" name="Weight" type="text" id="Weight" >
					
					<input placeholder="Blood Group" name="Blood_Group1" type="text" id="Blood_Group1"> 
					
					<div class="bg-light" > 
        			<label>Covid Positive Date &nbsp;&nbsp;&nbsp;&nbsp;</label>
        			<input placeholder="Covid Positive Date " name="Covid_Pos"type="date"  id="Covid_Pos">
       				</div>
        
        			<br>
        
        
       				<div class="bg-light	">
       				<label>Covid Negative Date &nbsp;&nbsp;</label>
        			<input placeholder="Covid Negative Date " name="Covid_Neg"type="date"  id="Covid_Neg">
        			</div>

					<button type="submit" name="submit_btn_Register" onclick="return validate();">Donate</button>
				</form>
					
					<a href="#myheader"><button id="Donatenow1" type="button" class="btn btn-success btn-sm float-right">X</button></a>
			</div>
			
			<div class="clear"></div>

		</div>
		
		<br> <br> <br> <br> <br> <br> <br>
		
		
		<script type="text/javascript">

  function validate() {
    
    var name1 = document.getElementById("name1").value;
    var Phone_Number = document.getElementById("Phone_Number").value;
    var Address = document.getElementById("Address").value;
    var Age = document.getElementById("Age").value;
    var Weight = document.getElementById("Weight").value;
    var Blood_Group1 = document.getElementById("Blood_Group1").value;
    var Covid_Pos = document.getElementById("Covid_Pos").value;
    var Covid_Neg = document.getElementById("Covid_Neg").value;
    
    
    
    
  if(name1 == "") {
    alert("Please fill the Name");
        return false;
  }

  if(!isNaN(name1)) {
	    alert("Digits are not allowed for Name");
	        return false;
	 }
  
  if((name1.length <= 2) || (name1.length > 40)) {
    alert("Name length must be between 2 to 40");
        return false;
  }
  
  

  if (Phone_Number == "") {
    alert("Please fill the Phone number");
        return false;
  }

  if (isNaN(Phone_Number)) {
    alert("Phone Number should be only digits, not Characters");
        return false;
  }

  if (Phone_Number.length != 10) {
    alert("User must enter 10 digit number");
        return false;
  }

  if (Address == "") {
    alert("Please fill the Address");
        return false;
  }
  
  if (!isNaN(Address)) {
	    alert("only digits are not accepted to Address");
	        return false;
	  }

  if ((Address.length <= 30) || (Address.length > 100)) {
    alert("length must be between 30 to 100 in address field");
        return false;
  }

  if (Age == "") {	
	    alert("Please fill your Age");
	        return false;
  }
  
  if (isNaN(Age)) {	
	    alert("Enter only digits for Age ");
	        return false;
  }
  
  if (Age <=18 || Age > 65) {	
	    alert("Enter the valid age between 18 to 65");
	        return false;
  }
  
  if (Weight == "") {	
	    alert("Please fill your Weight");
	        return false;
  }
  
  if (isNaN(Weight)) {
	    alert("Weight should be only digits, not Characters");
	        return false;
	        
  }
  
  if (Weight <= 50 || Weight > 120 ) {	
	    alert("Weight show be between the range 60 to 120 ");
	        return false;
  }
  
  if (Blood_Group1 == "") {	
	    alert("Please fill your Blood Group");
	        return false;
  }
  
  if (!isNaN(Blood_Group1)) {
	    alert("Digits are not accepted to Blood Group");
	        return false;
	        
  }
  
   if (!(Blood_Group1 == "A+" || Blood_Group1 == "A-" || Blood_Group1 == "B+" || Blood_Group1 == "B-" || Blood_Group1 == "O+" || Blood_Group1 == "O-" || Blood_Group1 == "AB+" || Blood_Group1 == "AB-")) {	
	    alert("Please Enter the blood group in the format Eg:A+");
	        return false;
  }
  
   if (Covid_Pos == "") {	
	    alert("Please fill your Covid_Positive date ");
	        return false;
   }
   
   if (!isNaN(Covid_Pos)) {
	    alert("Only Digits are not accepted for Covid_Positive date");
	        return false;
	        
   }
   
   
  
   
   if (Covid_Neg == "") {	
	    alert("Please fill your Covid_Negative date ");
	        return false;
  }
  
  if (!isNaN(Covid_Neg)) {
	    alert(" Only Digits are not accepted for Covid_Negative date");
	        return false;
	        
  }
  
  
  
   
  if (Covid_Pos > Covid_Neg) {
	    alert("Covid_Positive date cannot be Greater than Covid_Negative date, Enter correct Dates");
	        return false;
  }
   
  
  

 }
</script>
		

</body>


<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/grid-gallery/js/grid-gallery.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/js/script.js"></script>





</html>