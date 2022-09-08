<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="plugin.jsp"%>
<link rel="stylesheet" href="${context}/css/util.css">
<link rel="stylesheet" href="${context}/css/searchBus.css">
<link rel="stylesheet" href="${context}/css/navbar.css">

<script src="${context}/js/searchBus.js"></script>

<title>BMS | Plan your journey</title>
</head>

<body>
	<%@ include file="userSecurity.jsp"%>


	<!-- NAVBAR -->
	<%@ include file="userNavbar.jsp"%>
	<!-- SEARCH SECTION -->
	<section class="container-fluid search-section" style="background-image : url('${context}/images/bus-inside-img.jpg');">
		<div class="container">
			<form class="search-form" method="post">
				<div class="input-group mb-3 my-auto search-element">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1"><i
							class="fas fa-bus form-icon text-bms-primary"></i></span>
					</div>
					<select class="form-select form-control"
						aria-label="Default select example" name="source" required>
						<option value="">Select Source</option>
						<c:forEach var="startName" items="${startNames}">
							<option value="${startName}">${startName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="input-group mb-3 my-auto search-element">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1"><i
							class="fa fa-solid fa-building form-icon text-bms-primary"></i></span>
					</div>
					<select class="form-select form-control"
						aria-label="Default select example" name="destination" required>
						<option value="">Select Destination</option>
						<c:forEach var="stopName" items="${stopNames}">
							<option value="${stopName}">${stopName}</option>
						</c:forEach>
					</select>
				</div>

				<div class="input-group mb-3 my-auto search-element">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1"><i
							class="fas fa-calendar-alt form-icon text-bms-primary"></i></span>
					</div>
					<input type="date" id="travelDate" class="form-control"
						placeholder="Date" aria-describedby="basic-addon1"
						name="travelDate" required>
				</div>
				<button type="submit" class="btn bg-bms-yellow search-btn">
					<i class="fas fa-search form-icon"></i>
				</button>
			</form>
		</div>
	</section>

	<!-- PROMISE SECTION  -->
	<section class="promise-section">
		<div class="container">
			<h1 class="text-center promise-heading">We Promise to Deliver</h1>
			<div class="row my-auto mx-auto card-section justify-content-center">
				<div class="card-deck">
					<div
						class="card col-lg-4 col-sm-6 col-md-6 text-center text-secondary">
						<i class="fas fa-pump-medical card-icon text-bms-primary"></i>
						<div class="card-body">
							<h5 class="card-title">safety+</h5>
							<p class="card-text">With Safety+ we have brought in a set of
								measures like Sanitized buses, mandatory masks etc. to ensure
								you travel safely.</p>
						</div>
					</div>
					<div
						class="card col-lg-4 col-sm-6 col-md-6 text-center text-secondary">
						<i class="fas fa-headset card-icon text-bms-primary"></i>
						<div class="card-body">
							<h5 class="card-title">SUPERIOR CUSTOMER SERVICE</h5>
							<p class="card-text">We put our experience and relationships
								to good use and are available to solve your travel issues.</p>
						</div>
					</div>
					<div
						class="card col-lg-4 col-sm-6 col-md-6 text-center text-secondary">
						<i class="fas fa-rupee-sign card-icon text-bms-primary"></i>
						<div class="card-body">
							<h5 class="card-title">LOWEST PRICES</h5>
							<p class="card-text">We always give you the lowest price with
								the best partner offers.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<%@ include file="userFooter.jsp"%>
</body>

</html>