<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="plugin.jsp"%>

<link rel="stylesheet" href="${context}/css/util.css" />
<link rel="stylesheet" href="${context}/css/myTickets.css" />
<link rel="stylesheet" href="${context}/css/navbar.css" />

<script type="text/javascript">
	function addClassShow() {
		document.querySelector(".upcoming-ticket-parent .collapse").classList
				.add("show");
	}
</script>
<title>My Tickets</title>
</head>
<body onload="addClassShow();">
	<%@ include file="userSecurity.jsp"%>

	<!-- NAVBAR -->
	<%@ include file="userNavbar.jsp"%>

	<section class="container">
		<c:if test="${validCancel == 'YES'}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				Your ticket from <b>${source}</b> to <b>${dest}</b> on <b>${date}</b>
				with PNR No: <b>${pnrNo}</b> is cancelled successfully.An Email will
				be sent to your email address shortly.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<c:if test="${validCancel == 'NO'}">
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				Unauthorized cancel operation.
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<c:if test="${fn:length(bookedTicket.getPnrNo()) > 0}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<div class="book-success-mssg">
					<strong>Success!</strong> Your ticket from <b>${bookedTicket.getBus().getRoute().getStartName()}</b>
					to <b>${bookedTicket.getBus().getRoute().getStopName()}</b> on <b>${bookedTicket.getDateOfTravel()}</b>
					with <b>${bookedTicket.getSeatsBooked()}</b> seats is booked
					successfully.An Email will be sent to your email address shortly.
					<p>
						PNR No: <b>${bookedTicket.getPnrNo()}</b><br /> Bus Registration Number: <b>${bookedTicket.getBus().getRegistrationNo()}</b>
					</p>
				</div>
				<div>Please find your ticket below.</div>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
	</section>

	<!-- UPCOMING TICKET SECTION -->
	<section class="container upcoming-ticket-parent">
		<div class="row">
			<h3>Upcoming Tickets</h3>
		</div>
		<c:choose>
			<c:when test="${upcomingTicketFound}">
				<div id="accordionUpcoming">
					<c:forEach var="upcomingTicket" items="${upcomingTickets}">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-lg-3">
										<a class="card-link" data-toggle="collapse"
											href="#collapse${upcomingTicket.getPnrNo()}"> PNR NO:
											${upcomingTicket.getPnrNo()} </a>
									</div>
									<div class="col-lg-3 offset-lg-6">
										<a class="card-link" data-toggle="collapse"
											href="#collapse${upcomingTicket.getPnrNo()}"> Date:
											${upcomingTicket.getDateOfTravel()} </a>
									</div>
								</div>
							</div>
							<div id="collapse${upcomingTicket.getPnrNo()}" class="collapse"
								data-parent="#accordionUpcoming">
								<div class="card-body">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<div class="row">
												<div class="col-md-6">
													<h4>
														<i class="fas fa-bus text-bms-primary"></i>
														${upcomingTicket.getBus().getBusName()}
														(${upcomingTicket.getBus().getRegistrationNo()})
													</h4>
												</div>
												<div id="pnr" class="col-md-6">
													<h4 class="float-md-right">PNR
														NO:(${upcomingTicket.getPnrNo()})</h4>
												</div>
											</div>
										</li>
										<li class="list-group-item">
											<div class="row">
												<div class="col-md-6">
													<h5>
														<i class="fa fa-city"></i> From :
														${upcomingTicket.getBus().getRoute().getStartName()}
													</h5>
												</div>

												<div class="col-md-6">
													<h5 class="float-md-right">
														<i class="fa fa-city"></i> To :
														${upcomingTicket.getBus().getRoute().getStopName()}
													</h5>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<h5>
														<i class="fa fa-calendar-alt"></i> Date:
														${upcomingTicket.getDateOfTravel()}
													</h5>
												</div>

												<div class="col-md-6">
													<h5 class="float-md-right">
														<i class="fa fa-clock"></i> Time (24 Hr Format):
														${fn:substring(upcomingTicket.getBus().getStartTime(),0,5)}
													</h5>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<h5>
														<i class="fas fa-chair"></i> Seats Booked :
														${upcomingTicket.getSeatsBooked()}
													</h5>
												</div>

												<div class="col-md-6">
													<h5 class="float-md-right">
														<i class="fas fa-money-bill"></i> Total Paid: Rs.
														${upcomingTicket.getTotalAmount()}
													</h5>
												</div>
											</div> <c:if
												test="${ upcomingTicket.getDateOfTravel() ne todayDate }">
												<div class="row">
													<div class="col text-center">
														<a href="#" data-toggle="modal"
															data-target="#modal${upcomingTicket.getPnrNo()}">
															<button class="btn btn-primary">Cancel Ticket</button>
														</a>
													</div>
												</div>
											</c:if>


										</li>

									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>No upcoming ticket yet</c:otherwise>
		</c:choose>

	</section>

	<!-- EXPIRED TICKET SECTION -->
	<section class="container expired-ticket-parent">
		<div class="row">
			<h3>Expired Tickets</h3>
		</div>
		<c:choose>
			<c:when test="${oldTicketFound}">
				<div id="accordionOld">
					<c:forEach var="oldTicket" items="${oldTickets}">
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-lg-3">
										<a class="card-link" data-toggle="collapse"
											href="#collapse${oldTicket.getPnrNo()}"> PNR NO:
											${oldTicket.getPnrNo()} </a>
									</div>
									<div class="col-lg-3 offset-lg-6">
										<a class="card-link" data-toggle="collapse"
											href="#collapse${oldTicket.getPnrNo()}"> Date:
											${oldTicket.getDateOfTravel()} </a>
									</div>
								</div>
							</div>
							<div id="collapse${oldTicket.getPnrNo()}" class="collapse"
								data-parent="#accordionOld">
								<div class="card-body">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<div class="row">
												<div class="col-md-6">
													<h4>
														<i class="fas fa-bus text-bms-primary"></i>
														${oldTicket.getBus().getBusName()}
														(${oldTicket.getBus().getRegistrationNo()})
													</h4>
												</div>
												<div id="pnr" class="col-md-6">
													<h4 class="float-md-right">PNR
														NO:(${oldTicket.getPnrNo()})</h4>
												</div>
											</div>
										</li>
										<li class="list-group-item">
											<div class="row">
												<div class="col-md-6">
													<h5>
														<i class="fa fa-city"></i> From :
														${oldTicket.getBus().getRoute().getStartName()}
													</h5>
												</div>

												<div class="col-md-6">
													<h5 class="float-md-right">
														<i class="fa fa-city"></i> To :
														${oldTicket.getBus().getRoute().getStopName()}
													</h5>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<h5>
														<i class="fa fa-calendar-alt"></i> Date:
														${oldTicket.getDateOfTravel()}
													</h5>
												</div>

												<div class="col-md-6">
													<h5 class="float-md-right">
														<i class="fa fa-clock"></i> Time (24 Hr Format):
														${fn:substring(oldTicket.getBus().getStartTime(),0,5)}
													</h5>
												</div>
											</div>
											<div class="row">
												<div class="col-md-6">
													<h5>
														<i class="fas fa-chair"></i> Seats Booked :
														${oldTicket.getSeatsBooked()}
													</h5>
												</div>

												<div class="col-md-6">
													<h5 class="float-md-right">
														<i class="fas fa-money-bill"></i> Total Paid: Rs.
														${oldTicket.getTotalAmount()}
													</h5>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:when>
			<c:otherwise>No expired ticket yet</c:otherwise>
		</c:choose>

	</section>

	<!-- Cancellation Modal -->
	<c:if test="${upcomingTicketFound}">
		<c:forEach var="upcomingTicket" items="${upcomingTickets}">
			<div class="modal fade" id="modal${upcomingTicket.getPnrNo()}"
				tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Cancel ticket?</h5>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							Your ticket from <b>${upcomingTicket.getBus().getRoute().getStartName()}</b>
							to <b>${upcomingTicket.getBus().getRoute().getStopName()}</b> on
							<b>${upcomingTicket.getDateOfTravel()}</b> with PNR No. <span
								class="text-red">${upcomingTicket.getPnrNo()}</span> will be
							cancelled.
						</div>
						<div class="modal-footer">
							<a class="btn btn-primary"
								href="${context}/ticket/cancel/${upcomingTicket.getPnrNo()}">Cancel
								Ticket</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>

	<%@ include file="userFooter.jsp"%>

</body>
</html>