<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="dao.DAO"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>

<head>

 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home Page</title>
    <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/fav.jpg">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/fontawsom-all.min.css">
    <link rel="stylesheet" href="assets/plugins/grid-gallery/css/grid-gallery.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/style1.css" />
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
    	$(document).ready(function(){
    		$("#Donatenow").click(function(){
    			$("#Mydiv").css("display","block");
    		});
    		$("#Closenow").click(function(){
    			$("#Mydiv").css("display","none");
    		});
    	});
    
    </script>
	


</head>

<body>

<%!
DAO dao = new DAO();
%>

<%

if (request.getParameter("submit_btn") != null) {
	String name = request.getParameter("name");
	String Phone_Number = request.getParameter("Phone_Number");
	String Address = request.getParameter("Address");
	String Age = request.getParameter("Age");
	String Weight = request.getParameter("Weight");
	String Blood_Group = request.getParameter("Blood_Group");
	String Covid_Pos = request.getParameter("Covid_Pos");
	String Covid_Neg = request.getParameter("Covid_Neg");
	

	
	String sql= "call spRegister('"+name+"','"+Phone_Number+"','"+Address+"','"+Age+"','"+Weight+"','"+Blood_Group+"','"+Covid_Pos+"','"+Covid_Neg+"')";
	
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
	window.location.href = "Donor.jsp";
</script>
<%
	} else {
%>
<script type="text/JavaScript">
	alert("There seems to be an issue, Re-Enter the Data...");
	window.location.href = "Donor.jsp";
</script>
<%
	}
}

} else {
%>
<script type="text/JavaScript">
	alert("There seems to be an issue, Check the data entered or Donor may already exist...");
	window.location.href = "Donor.jsp";
</script>
<%
	}
}
%>


<header id="myheader" class="continer-fluid ">
        <div class="header-top">
            <div class="container">
                <div class="row col-det">
                    <div class="col-lg-6 d-none d-lg-block">

                    </div>
                    <div class="col-lg-6 col-md-12">
                        <ul class="ulright">
                            <li>
                                <i class="fas fa"></i>
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
                        <br><img src="assets/images/Covid_19_logo.jpg" alt="">
                        
                       
                    </div>
                   
      					
                    <div class="col-md-9 nav-col">
                        <nav class="navbar navbar-expand-lg navbar-light">

                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNav">
                                <ul class="navbar-nav">
                               <!--  <div class="container"> -->
  								
                               	     
                               	     <div class="dropdown">
                                        <br>
                                        
                                        
    										
                                        	<div class="row align-items-start">
                         					<div class="col">
                         					
                         					<button class="btn btn-primary dropdown-toggle" type="button"
                                            id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Home
                                        	</button>
                                       		 
                                       		 
                                       		 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="../BloodBank/Home1/Home1.jsp">Blood Bank</a>
                                            <a class="dropdown-item" href="../Hospital/Home3/Home3.jsp">Hospital</a>
                                       		</div>
                                     		
                                     		</div>
                                     		
                                     		
                                     		 <div class="col"> 
                                    		<div class="row nav-row"> 
                                   			 <li class="nav-item"> 
                                       		<a class="nav-link" href="#about">About Us</a>
                                   			  </li> 
                                    		</div>
                                    		</div>
                                     		
                                 			</div>
                                 	     		
                                   
                            		</div>
                            		
                            		
                                    
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

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>

            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="assets/images/slider/slide-02.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5 class=" bounceInDown">Donate Plasma & Save a Life</h5>
                        <p class=" bounceInLeft">Karnataka govt announces incentives of Rs 5,000 for COVID-19 recovered
                            plasma donors.<br>
                            Plasma therapy is a medical procedure that uses the blood of a recovered patient to create
                            antibodies on those infected individuals.<br>
                            Medically known as convalescent plasma therapy, this treatment uses antibodies found in the
                            blood taken from a recovered Covid-19 patient.<br>
                            It is then used to treat those with severe SARS-CoV-2 infection to aid recovery.<br></p>

                        <div class=" vbh">


                        </div>
                    </div>
                </div>

                <div class="carousel-item">
                    <img class="d-block w-100" src="assets/images/slider/slide-03.jpg" alt="Third slide">
                    <div class="carousel-caption vdg-cur d-none d-md-block">
                        <h5 class=" bounceInDown">Donate Blood & Save a Life</h5>
                        <p class=" bounceInLeft">Don't hesitate in donating blood.<br>
                            Your donation helps in saving life of people. <br>
                            If you start donating blood at the age of 18 and donated blood in every 90 days until you
                            reached the age of 60,<br>
                            you would have donated 192 units of blood, potentially helping save more than 400 lives.<br>
                        </p>

                        <div class=" vbh">
                        </div>
                    </div>
                </div>

            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <br>
            <br>
        </div>

	

	<a href="#Mydiv"><button id="Donatenow" type="button" class="btn btn-outline-danger">Register</button></a>	
		
<div id="Mydiv" class="main-agileits" style="display:none; border-style:solid;">
	
	<h2 class="sub-head">Donor Details</h2>
    <div class="sub-main">  
      <form method="post">
        <input placeholder="Donor Name" name="name" type="text"  id="name">

        <input placeholder="Phone Number" name="Phone_Number" type="text"  id="Phone_Number">
      
        <input placeholder="Address" name="Address" type="text"  id="Address">

        <input placeholder="Age" name="Age" type="text"  id="Age">

        <input placeholder="Weight" name="Weight"type="text"  id="Weight">
        
      
        
        <input placeholder="Blood Group" name="Blood_Group"type="text"  id="Blood_Group">
         
        <div class="bg-light" > 
        <label>Covid Positive Date &nbsp;&nbsp;&nbsp;&nbsp;</label>
        <input placeholder="Covid Positive Date" name="Covid_Pos"type="date"  id="Covid_Pos">
        </div>
        
        <br>
        
        
        <div class="bg-light">
        <label>Covid Negative Date &nbsp;&nbsp;</label>
        <input placeholder="Covid Negative Date" name="Covid_Neg"type="date"  id="Covid_Neg">
        </div>
        
        <button type="submit" name= "submit_btn" onclick="return validate();" >DONATE</button>
			</form>
		<a href="#myheader">
		
		<button id="Closenow" type="button" class="btn btn-success btn-sm float-right">X</button></a>
	</div>
		<div class="clear"></div>
		
		
		
</div>
<br>



<div class="p-3 mb-2 bg-danger text-white">Available Blood Bank Details</div>
	<div>
	<table  class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Sl no</th>
				<th scope="col">BBank Name</th>
				<th scope="col">Phone No</th>
				<th scope="col">Address</th>
				<th scope="col">Email</th>
			</tr>
		</thead>
		<tbody>
			<%
				String getDataQuery = "SELECT * FROM blood_bank";
			ResultSet resultSet = dao.getData(getDataQuery);

			while (resultSet.next()) {
			%>
			<tr>
				<th scope="row"><%=resultSet.getRow()%></th>
				<td><%=resultSet.getString("Name")%></td>
				<td><%=resultSet.getString("Phone_no")%></td>
				<td><%=resultSet.getString("Address")%></td>
				<td><%=resultSet.getString("Email")%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	</div>



 



<script type="text/javascript">

  function validate() {
    
    var name = document.getElementById("name").value;
    var Phone_Number = document.getElementById("Phone_Number").value;
    var Address = document.getElementById("Address").value;
    var Age = document.getElementById("Age").value;
    var Weight = document.getElementById("Weight").value;
    var Blood_Group = document.getElementById("Blood_Group").value;
    var Covid_Pos = document.getElementById("Covid_Pos").value;
    var Covid_Neg = document.getElementById("Covid_Neg").value;
    
    
    
    
  if(name == "") {
    alert("Please fill the Name");
        return false;
  }

  if(!isNaN(name)) {
	    alert("Digits are not allowed for Name");
	        return false;
	 }
  
  if((name.length <= 2) || (name.length > 40)) {
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
  
  if (Blood_Group == "") {	
	    alert("Please fill your Blood Group");
	        return false;
  }
  
  if (!isNaN(Blood_Group)) {
	    alert("Digits are not accepted to Blood Group");
	        return false;
	        
  }
  
   if (!(Blood_Group == "A+" || Blood_Group == "A-" || Blood_Group == "B+" || Blood_Group == "B-" || Blood_Group == "O+" || Blood_Group == "O-" || Blood_Group == "AB+" || Blood_Group == "AB-")) {	
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














 </div>
<br>





    <!--*************** About Us Starts Here ***************-->
    <section id="about" class="contianer-fluid about-us">
        <div class="container">
            <div class="row session-title">
                <h2>Motivation</h2>
                <p>Remember that the happiest people are not those getting more, but those giving more. <br>
                    H. Jackson Brown Jr.
                </p>
            </div>
            <div class="row">
                <div class="col-md-6 text">
                    <h2>About Blood Doners</h2>
                    <p>
                    
                    <h3>
                        A blood donation occurs when a person voluntarily has blood drawn and used for transfusions
                        and/or made into biopharmaceutical medications by a process called fractionation (separation of
                        whole-blood components).<br><br><br><br><br><br><br><br><br>
                        Donation may be of whole blood, or of specific components directly (the latter called
                        apheresis).<br><br><br><br><br><br><br><br><br>
                        Blood banks often participate in the collection process as well as the procedures that follow
                        it.<br>
                    </h3>
                    </p>
                </div>
                <div class="col-md-6 image">
                    <img src="assets/images/about.jpg" alt="">
                </div>
            </div>
        </div>
    </section>




    <!--*************** Footer  Starts Here *************** -->






</body>

<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/grid-gallery/js/grid-gallery.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/js/script.js"></script>





</html>