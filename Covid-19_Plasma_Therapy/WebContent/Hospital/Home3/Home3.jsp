<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="dao.DAO"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>


<html>

<head>


<meta charset="ISO-8859-1">
<title>Insert title here</title>




</head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Hospital</title>
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



<body>

	<%!DAO dao = new DAO();
	int loggedInHospitalId = -1;%>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	response.setHeader("Expires", "0"); // Proxies  
	if (session.getAttribute("adminH") == null) {
		response.sendRedirect("../../Hospital/login2/login2.jsp");
	} else {
		loggedInHospitalId = (int) session.getAttribute("hospitalId");
	}
	%>
	
	<%
	if(request.getParameter("request") != null && request.getParameter("hospital") != null && request.getParameter("cancel") != null) 
	  {
	    int donation_id = Integer.parseInt(request.getParameter("request"));
	    String cancelQuery = "delete from request where donation_id = " + donation_id;
	    if(dao.putData(cancelQuery) > 0) 
	    {
	      String cancelQuery1 = "update donation set Hospital_request_status = 'cancelled' where donation_id = " + donation_id;
	      if(dao.putData(cancelQuery1) > 0) 
	      {
	        %>
	        <script type="text/javascript">
	        alert("Cancellation of the order is done successfully!!");
	        window.location.href = "Home3.jsp";
	        </script>
	        <% 
	      }
	      else 
	      {
	        %>
	        <script type="text/javascript">
	        alert("There seems to be an issue in Cancellation.. Try again");
	        window.location.href = "Home3.jsp";
	        </script>
	        <%
	        
	      }
	    }
	  }

	else if(request.getParameter("request") != null && request.getParameter("hospital") != null) 
    {
      int donation_id = Integer.parseInt(request.getParameter("request"));
      int hospital_id = Integer.parseInt(request.getParameter("hospital"));
      
      String selectRequestTable = "select * from request where donation_id = "+donation_id+" and Request_status = 'cancelled'";
      ResultSet RequestTable = dao.getData(selectRequestTable);
      String raiseRequestQuery = "";
      if(RequestTable.next())
      {
        System.out.println("There is a cancelled order");
        raiseRequestQuery = "update request set Request_status = 'requested', Hospital_id = "+hospital_id+" where donation_id = "+donation_id+"";
      }
      else
      {
        System.out.println("There is no cancelled order");
        String selectRequestStatus = "select * from request where donation_id = "+donation_id+" and Request_status = 'requested'";
        ResultSet RequestStatus = dao.getData(selectRequestStatus);
        if(RequestStatus.next())
        {
          System.out.println("Sorry, This Plasma is no longer available..");
          %>
          <script type="text/javascript">
          alert("Sorry, This Plasma is no longer available..");
          window.location.href = "Home3.jsp";
          </script>
          <%
        }
        else
        {
          System.out.println("There is no request, so create a request");
          raiseRequestQuery = "insert into request (donation_id, Hospital_id) values ("+donation_id+", "+hospital_id+")";
        }
        
      }  
      if(dao.putData(raiseRequestQuery) > 0) 
      {
        String updateDonationStatus = "update donation set Hospital_request_status = 'requested' where donation_id = " + donation_id;
        if(dao.putData(updateDonationStatus) > 0) 
        {
          %>
          <script type="text/javascript">
          alert("Request raised for the selected plasma successfully done!!");
          window.location.href = "Home3.jsp";
          </script>
          <% 
        }
        else 
        {
          %>
          <script type="text/javascript">
          alert("There seems to be an issue in Requesting.. Try again");
          window.location.href = "Home3.jsp";
          </script>
          <%
          
        }
      }
      else
      {
        %>
        <script type="text/javascript">
        alert("There seems to be an issue in Requesting.. Try again");
        window.location.href = "Home3.jsp";
        </script>
        <%
        
      }
    }
%>
Welcome ${adminH}

	<header class="continer-fluid ">
		<div class="header-top">
			<div class="container">
				<div class="row col-det">
					<div class="col-lg-6 d-none d-lg-block"></div>
					<div class="col-lg-6 col-md-12">
						<ul class="ulright">
							<li>
								<form action="../../LogoutControlHS" method="post">
									<a href="../login2/login2.jsp"><button
											class="btn btn-primary" type="submit">
											<i class="fas fa-user"></i>Logout
										</button> </a>
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
									<li class="nav-item"><a class="btn btn-primary"
										href="#mytable1" role="button">A</a></li>

									<li class="nav-item"><a class="btn btn-primary"
										href="#mytable2" role="button">B</a></li>

									<li class="nav-item"><a class="btn btn-primary"
										href="#mytable3" role="button">O</a></li>

									<li class="nav-item"><a class="btn btn-primary"
										href="#mytable4" role="button">AB</a></li>


									<li class="nav-item"><a class="btn btn-primary"
										href="#mytable5" role="button">Request List</a></li>
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


						<div class=" vbh"></div>
					</div>
				</div>

				<div class="carousel-item">
					<img class="d-block w-100" src="assets/images/slider/slide-03.jpg"
						alt="Third slide">
					<div class="carousel-caption vdg-cur d-none d-md-block">


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
			</a> <br id="mytable1"> <br>
		</div>




		<br>
	</div>
	<br>

	<div class="p-3 mb-2 bg-danger text-white">List of A+ and A-
		Blood Group</div>
	
	<table  class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Sl no</th>
				<th scope="col">BBank Name</th>
				<th scope="col">Blood Group</th>
				<th scope="col">Quantity of plasma in Units 1unit = 200ml</th>
				<th scope="col">IgM level(OD ratio)a</th>
				<th scope="col">IgG level(OD ratio)a,b</th>
				<th scope="col">Raise Request</th>
			</tr>
		</thead>
		<tbody>
			<%
				String getDataQuery = "SELECT * FROM donation, blood_bank WHERE donation.Blood_Group LIKE 'A_' AND donation.Bbank_id = blood_bank.Bbank_id AND (Hospital_request_status = 'Not Requested' OR Hospital_request_status = 'cancelled')";
			ResultSet resultSet = dao.getData(getDataQuery);

			while (resultSet.next()) {
			%>
			<tr>
				<th scope="row"><%=resultSet.getRow()%></th>
				<td><%=resultSet.getString("Name")%></td>
				<td><%=resultSet.getString("Blood_Group")%></td>
				<td><%=resultSet.getInt("Quantity_of_plasma")%></td>
				<td><%=resultSet.getFloat("IgM")%></td>
				<td><%=resultSet.getFloat("IgG")%></td>
				<td><a class="btn btn-primary"
					href="Home3.jsp?request=<%=resultSet.getInt("donation_id")%>&hospital=<%=loggedInHospitalId%>">Request
						Now</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<br id = "mytable2">
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="p-3 mb-2 bg-danger text-white">List of B+ and B-
		Blood Group</div>

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Sl no</th>
				<th scope="col">BBank Name</th>
				<th scope="col">Blood Group</th>
				<th scope="col">Quantity of plasma in Units 1unit = 200ml</th>
				<th scope="col">IgM level(OD ratio)a</th>
				<th scope="col">IgG level(OD ratio)a,b</th>
				<th scope="col">Raise Request</th>
			</tr>
		</thead>
		<tbody>
			<%
				String getDataQuery1 = "SELECT * FROM donation, blood_bank WHERE donation.Blood_Group LIKE 'B_' AND donation.Bbank_id = blood_bank.Bbank_id AND (Hospital_request_status = 'Not Requested' OR Hospital_request_status = 'cancelled')";
			ResultSet resultSet1 = dao.getData(getDataQuery1);

			while (resultSet1.next()) {
			%>
			<tr>
				<th scope="row"><%=resultSet1.getRow()%></th>
				<td><%=resultSet1.getString("Name")%></td>
				<td><%=resultSet1.getString("Blood_Group")%></td>
				<td><%=resultSet1.getInt("Quantity_of_plasma")%></td>
				<td><%=resultSet1.getFloat("IgM")%></td>
				<td><%=resultSet1.getFloat("IgG")%></td>
				<td><a class="btn btn-primary"
					href="Home3.jsp?request=<%=resultSet1.getInt("donation_id")%>&hospital=<%=loggedInHospitalId%>">Request
						Now</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<br id="mytable3">
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="p-3 mb-2 bg-danger text-white">List of O+ and O-
		Blood Group</div>

	<table  class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Sl no</th>
				<th scope="col">BBank Name</th>
				<th scope="col">Blood Group</th>
				<th scope="col">Quantity of plasma in Units 1unit = 200ml</th>
				<th scope="col">IgM level(OD ratio)a</th>
				<th scope="col">IgG level(OD ratio)a,b</th>
				<th scope="col">Raise Request</th>
			</tr>
		</thead>
		<tbody>
			<%
				String getDataQuery2 = "SELECT * FROM donation, blood_bank WHERE donation.Blood_Group LIKE 'O_' AND donation.Bbank_id = blood_bank.Bbank_id AND (Hospital_request_status = 'Not Requested' OR Hospital_request_status = 'cancelled')";
			ResultSet resultSet2 = dao.getData(getDataQuery2);

			while (resultSet2.next()) {
			%>
			<tr>
				<th scope="row"><%=resultSet2.getRow()%></th>
				<td><%=resultSet2.getString("Name")%></td>
				<td><%=resultSet2.getString("Blood_Group")%></td>
				<td><%=resultSet2.getInt("Quantity_of_plasma")%></td>
				<td><%=resultSet2.getFloat("IgM")%></td>
				<td><%=resultSet2.getFloat("IgG")%></td>
				<td><a class="btn btn-primary"
					href="Home3.jsp?request=<%=resultSet2.getInt("donation_id")%>&hospital=<%=loggedInHospitalId%>">Request
						Now</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<br id="mytable4">
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="p-3 mb-2 bg-danger text-white">List of AB+ and
		AB- Blood Group</div>

	<table  class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Sl no</th>
				<th scope="col">BBank Name</th>
				<th scope="col">Blood Group</th>
				<th scope="col">Quantity of plasma in Units 1unit = 200ml</th>
				<th scope="col">IgM level(OD ratio)a</th>
				<th scope="col">IgG level(OD ratio)a,b</th>
				<th scope="col">Raise Request</th>
			</tr>
		</thead>
		<tbody>
			<%
				String getDataQuery3 = "SELECT * FROM donation, blood_bank WHERE donation.Blood_Group LIKE 'AB_' AND donation.Bbank_id = blood_bank.Bbank_id AND (Hospital_request_status = 'Not Requested' OR Hospital_request_status = 'cancelled')";
			ResultSet resultSet3 = dao.getData(getDataQuery3);

			while (resultSet3.next()) {
			%>
			<tr>
				<th scope="row"><%=resultSet3.getRow()%></th>
				<td><%=resultSet3.getString("Name")%></td>
				<td><%=resultSet3.getString("Blood_Group")%></td>
				<td><%=resultSet3.getInt("Quantity_of_plasma")%></td>
				<td><%=resultSet3.getFloat("IgM")%></td>
				<td><%=resultSet3.getFloat("IgG")%></td>
				<td><a class="btn btn-primary"
					href="Home3.jsp?request=<%=resultSet3.getInt("donation_id")%>&hospital=<%=loggedInHospitalId%>">Request
						Now</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<br id="mytable5">
	<br>
	<br>
	<br>
	<br>
	<br>


	<div class="p-3 mb-2 bg-danger text-white">List of All Requested
		Plasma</div>

	<table  class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Sl no</th>
				<th scope="col">BBank Name</th>
				<th scope="col">Blood Group</th>
				<th scope="col">Quantity of plasma in Units 1unit = 200ml</th>
				<th scope="col">IgM level(OD ratio)a</th>
				<th scope="col">IgG level(OD ratio)a,b</th>
				<th scope="col">Request Cancellation</th>
			</tr>
		</thead>
		<tbody>
			<%
				String getDataQuery4 = "SELECT donation.donation_id, donation.BBank_id, hospital.Hospital_id, hospital.Username, blood_bank.Username, blood_bank.Name, donation.Blood_Group, donation.Quantity_of_plasma, donation.IgM, donation.IgG, donation.Hospital_request_status FROM donation, blood_bank, hospital, request WHERE donation.BBank_id = blood_bank.Bbank_id AND donation.donation_id = request.donation_id AND hospital.Hospital_id = "+loggedInHospitalId+" AND request.Hospital_id = "+loggedInHospitalId+" AND (donation.Hospital_request_status = 'requested' OR donation.Hospital_request_status = 'delivered')";
			ResultSet resultSet4 = dao.getData(getDataQuery4);

			while (resultSet4.next()) {
			%>
			<tr>
				<th scope="row"><%=resultSet4.getRow()%></th>
				<td><%=resultSet4.getString("Name")%></td>
				<td><%=resultSet4.getString("Blood_Group")%></td>
				<td><%=resultSet4.getInt("Quantity_of_plasma")%></td>
				<td><%=resultSet4.getFloat("IgM")%></td>
				<td><%=resultSet4.getFloat("IgG")%></td>
				<%
					if (resultSet4.getString("Hospital_request_status").equals("requested")) {
				%>
				<td><%=resultSet4.getString("Hospital_request_status")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-primary" href="Home3.jsp?request=<%=resultSet4.getInt("donation_id")%>&hospital=<%=loggedInHospitalId%>&cancel=1">Cancel</a>
				</td>

				<%
					} else if (resultSet4.getString("Hospital_request_status").equals("delivered")) {
				%>
				<td><%=resultSet4.getString("Hospital_request_status")%></td>
			</tr>
			<%
				}
			}
			%>
		</tbody>
	</table>
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