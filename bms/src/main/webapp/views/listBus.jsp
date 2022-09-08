<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="plugin.jsp"%>
<link rel="stylesheet" href="${context}/css/util.css" />
<link rel="stylesheet" href="${context}/css/listBus.css" />
<link rel="stylesheet" href="${context}/css/navbar.css" />

<title>Available Bus</title>
</head>

<body>
	<%@ include file="userSecurity.jsp"%>
	<!-- NAVBAR -->
	<%@ include file="userNavbar.jsp"%>

	<c:choose>
		<c:when test="${busFound}">

			<!-- Result Page  -->
			<section class="container result-page">
				<!-- Number of buses found from abc to xyz -->
				<div class="row">
					<span class="font-weight-bold busFound">${buses.size()} Bus
					</span> <span>&nbsp;found from</span> <span
						class="font-weight-bold busFound">&nbsp;${buses.get(0).getRoute().getStartName()}
					</span> <span>&nbsp;to</span> <span class="font-weight-bold busFound">&nbsp;${buses.get(0).getRoute().getStopName()}
					</span> <span>&nbsp;(${buses.get(0).getRoute().getDistance()} kms)</span>
					<span>&nbsp;on</span> <span class="font-weight-bold busFound">&nbsp;${travelDate}</span>
				</div>
			</section>

			<!-- Found Buses Details -->
			<section class="container" id="listsection">
				<c:forEach var="bus" items="${buses}">
					<a
						style="margin-bottom: 2%; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;"
						class="card"
						href="${context}/ticket/bookTicket/${bus.getRegistrationNo()}/${travelDate}/${bus.getAvailableSeats()}">
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="row">
										<div class="col-md-6">
											<h4>
												<i class="fas fa-bus text-bms-primary"></i>
												${bus.getBusName()}
												<c:choose>
													<c:when test="${bus.getFacilities() == 'AC'}">
														<span class="badge badge-pill badge-success my-auto">${bus.getFacilities()}</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-pill badge-warning my-auto">${bus.getFacilities()}</span>
													</c:otherwise>
												</c:choose>
											</h4>
										</div>
										<div id="pnr" class="col-md-6">
											<h4 class="float-md-right text-danger">Fare Per Ticket:
												Rs.&nbsp;${bus.getFare() *
												bus.getRoute().getDistance()}</h4>
										</div>
									</div>
								</li>
								<li class="list-group-item">
									<div class="row">
										<div class="col-md-6">
											<h5>
												<i class="fas fa-chair"></i> Available Seats :
												${bus.getAvailableSeats()}
											</h5>
										</div>

										<div class="col-md-6">
											<h5 class="float-md-right">
												<i class="fa fa-clock"></i>Departure Time (24 Hr Format):
												${fn:substring(bus.getStartTime(),0,5)}
											</h5>
										</div>
									</div>
								</li>

							</ul>
						</div>
					</a>
				</c:forEach>
			</section>

		</c:when>
		<c:otherwise>
			<section class="container">
				<div
					class="row no-bus-found-parent justify-content-lg-center justify-content-md-center">
					<div class="card">
						<div class="card-body">No bus found in this Route. Kindly
							select a different route and plan your journey accordingly.</div>
					</div>
				</div>
			</section>
		</c:otherwise>
	</c:choose>

	<%@ include file="userFooter.jsp"%>
</body>

</html>