<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.lang.Math"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="plugin.jsp"%>
<link rel="stylesheet" href="${context}/css/util.css">
<link rel="stylesheet" href="${context}/css/bookTicket.css">
<link rel="stylesheet" href="${context}/css/navbar.css">
<title>BMS | Book Ticket</title>
</head>
<body>

	<%@ include file="userSecurity.jsp"%>

	<!-- NAVBAR -->
	<%@ include file="userNavbar.jsp"%>

	<!-- Booking info section -->
	<section class="container">
		<div
			class="row booking-info justify-content-lg-center justify-content-md-center">
			<div class="card">
				<div class="card-body">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="row list-group-item-heading">
								<h4>Booking Information</h4>
							</div>
						</li>
						<li class="list-group-item">

							<div class="row">
								<div class="col-lg-6">
									<i class="fa fa-city text-bms-primary"></i> From: <span
										class="info-placeholder info-from">${bus.getRoute().getStartName()}</span>
								</div>
								<div class="col-lg-6">
									<i class="fa fa-city text-bms-primary"></i> To: <span
										class="info-placeholder info-to">${bus.getRoute().getStopName()}</span>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="row">
								<div class="col-lg-6">
									<i class="fa fa-bus-alt text-bms-primary"></i> Bus Name: <span
										class="info-placeholder info-busname">${bus.getBusName()}</span>
								</div>
								<div class="col-lg-6">
									<i class="fa fa-registered text-bms-primary"></i> Registration
									No: <span class="info-placeholder info-regno">${bus.getRegistrationNo()}</span>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="row">
								<div class="col-lg-6">
									<i class="fa fa-calendar-alt text-bms-primary"></i> Date: <span
										class="info-placeholder info-date">${travelDate}</span>
								</div>
								<div class="col-lg-6">
									<i class="fa fa-clock text-bms-primary"></i> Time (24 Hr Format): <span
										class="info-placeholder info-time">${fn:substring(bus.getStartTime(),0,5)}</span>
								</div>
							</div>
						</li>
						<li class="list-group-item">
							<form class="form"
								action="${context}/ticket/bookTicket/${bus.getRegistrationNo()}/${travelDate}"
								method="post">
								<input type="hidden" id="dist_km" name="dist_km"
									value="${bus.getRoute().getDistance()}"> <input
									type="hidden" id="farePerKm" name="farePerKm"
									value="${bus.getFare()}"> <input type="hidden"
									id="availableSeats" name="availableSeats"
									value="${availableSeats}">
								<div class="row">
									<div class="col-lg-6">
										<label for="seats" class="m-2">Seats</label> <input
											type="number" name="seatsBooked" min="1" max="6" value="1"
											class="form-control m-2" id="seats">
										<div class="error" id="seatError"></div>
									</div>
									<div class="col-lg-6">
										<label for="totalFare" class="m-2">Total fare</label> <input
											type="number" name="totalAmount" class="form-control m-2"
											id="totalFare" readonly>
									</div>
								</div>


								<button type="submit" class="btn b g-bms-primary m-2 btn-block"
									data-target="#loadingModal" data-toggle="modal" id="book-btn">Book
									Ticket</button>
							</form>
						</li>

					</ul>
				</div>
			</div>
		</div>

	</section>

	<div class="modal fade" id="loadingModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div
				class="modal-content d-flex justify-content-center align-items-center"
				style="background-color: transparent; border: none">
				<div class="modal-header"
					style="background-color: transparent; border: none">
					<img id="spinner" style="width: 250px" alt="spinner"
						src="${context}/images/loading.gif" />
				</div>
			</div>
		</div>
	</div>


	<%@ include file="userFooter.jsp"%>
	<script src="${context}/js/bookTicket.js"></script>
</body>
</html>