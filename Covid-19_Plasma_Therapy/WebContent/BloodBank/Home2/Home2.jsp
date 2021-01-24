<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="dao.DAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.AdminBB"%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>

</head>





<body>

	<%!
	DAO dao = new DAO();
	int loggedInBbankId = -1;%>

	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //http1.1
	response.setHeader("Pragma", "no-cache"); //http1.0
	response.setHeader("Expires", "0");//proxy

	if (session.getAttribute("adminBB") == null) {
		response.sendRedirect("../login1/login1.jsp");
	} else {
		loggedInBbankId = (int) session.getAttribute("bloodbankId");
	}
	%>

Welcome ${adminBB}

<%
  if(request.getParameter("request") != null && request.getParameter("donation") != null)
  {
    int request_id = Integer.parseInt(request.getParameter("request"));
    int donation_id = Integer.parseInt(request.getParameter("donation"));
    
    String updateDeliver="update request set request_status='delivered' where request_id='"+request_id+"' and  donation_id ='"+donation_id+"'";
    if (dao.putData(updateDeliver) > 0)
    {
      String updateDeliver1 = "update donation set Hospital_request_status ='delivered' where donation_id ='"+donation_id+"'";
      if(dao.putData(updateDeliver1) > 0)
      {
        %>
        <script type="text/javascript">
        alert("Delivery of the order is done successfully!!");
        window.location.href = "Home2.jsp";
        </script>
        <% 
      }
      else 
      {
        %>
        <script type="text/javascript">
        alert("There seems to be an issue in updating the delivered status.. Try again");
        window.location.href = "Home2.jsp";
        </script>
        <%
        
      }
      
    }
  
  }  
  %>







	<header class="continer-fluid ">
		<div class="header-top">
			<div class="container">
				<div class="row col-det">
					<div class="col-lg-6 d-none d-lg-block"></div>
					<div class="col-lg-6 col-md-12">
						<ul class="ulright">
							<form action="../../LogoutControlBB" method="post">
									<a href="../login1/login1.jsp">
							<button class="btn btn-primary" type="submit">
											<i class="fas fa-user"></i>Logout
										</button>
							</a>
							</form>
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
									<li class="nav-item"><a class="nav-link"
										href="../Home1/Home1.jsp">Donation Details</a></li>

									<li class="nav-item"><a class="nav-link" href="#mytable">Hospital</a>
									</li>
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
	</div>
	<br>

`
	
	<div>
	<table id="mytable" class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Sl no</th>
				<!--<th scope="col">BBank Name</th> -->
				<th scope="col">Hospital Name</th>
				<th scope="col">Blood Group</th>
				<th scope="col">Quantity of plasma in Units 1unit = 200ml</th>
				<th scope="col">IgM level(OD ratio)a</th>
				<th scope="col">IgG level(OD ratio)a,b</th>
				<th scope="col">Hospital_request_status</th>
		</thead>
		<%
			//String username=(String)session.getAttribute("adminBB");
		//int hospital_id = AdminHS.getHospitalId(username);
		String sql = "SELECT request.request_id, request.donation_id, hospital.Name, donation.Blood_Group, donation.Quantity_of_plasma, donation.IgM, donation.IgG, donation.Hospital_request_status FROM request, donation, hospital, blood_bank WHERE donation.Bbank_id = "+loggedInBbankId+" AND blood_bank.Bbank_id = "+loggedInBbankId+" AND request.donation_id = donation.donation_id AND request.Hospital_id = hospital.Hospital_id AND donation.Hospital_request_status <> 'Not Requested'";

		ResultSet rs = dao.getData(sql);
		%><tbody>
        <%
        while(rs.next())
        {
        %>
            <tr>
              <th scope="row"><%=rs.getRow()%></th>
              <td><%= rs.getString("Name") %></td>
              <td><%= rs.getString("Blood_Group") %></td>
              <td><%= rs.getString("Quantity_of_plasma") %></td>
              <td><%= rs.getString("IgM") %></td>
              <td><%= rs.getString("IgG") %></td>
              <% 
                  if(rs.getString("Hospital_request_status").equals("requested")){
              %>         <td><%= rs.getString("Hospital_request_status") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <a class="btn btn-primary" href="Home2.jsp?request=<%= rs.getInt("request_id") %>&donation=<%=rs.getInt("Donation_id")%>">Deliver</a></td>
              <%  
                  }
                  else if(rs.getString("Hospital_request_status").equals("cancelled") || rs.getString("Hospital_request_status").equals("delivered")) {
                    %><td><%= rs.getString("Hospital_request_status") %></td>
                  <%
                  }
                  %>
            </tr>
        <%
        }
        %>
        </tbody>
        </table>
        </div>	
    <br>
	<br>
	<br>
	<br>
	<br>
	<br>






</body>


<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/plugins/grid-gallery/js/grid-gallery.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/js/script.js"></script>


</html>