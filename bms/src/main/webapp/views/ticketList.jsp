<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Math"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="plugin.jsp"%>
<link rel="stylesheet" href="${context}/css/ticketList.css">
<link rel="stylesheet" href="${context}/css/util.css">

<title>BMS Admin | Ticket List</title>
</head>
<body>
	<%@ include file="adminSecurity.jsp"%>
	<div class="container">
		<div>
			<h1 class="font-weight-bold">Tickets Booked</h1>
			<a href="${context}/admin/dashboard">
				<button class="btn btn-primary">Back to Dashboard</button>
			</a> <a class="float-right"
				href="${context}/admin/export/${bus.getRegistrationNo()}">
				<button class="btn btn-primary">Export to Excel</button>
			</a>

		</div>
		<hr />
		<div>
			<h2 class="text-info font-weight-bold">Bus Name:
				${bus.getBusName()}</h2>
			<h3 class="text-info">
				Route:- ${bus.getRoute().getStartName()}
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-arrow-right-circle-fill"
					viewBox="0 0 16 16">
  					<path
						d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
				</svg>
				${bus.getRoute().getStopName()}
			</h3>
			<h3 class="text-info">Bus Start Time (24 Hr Format):-
				${fn:substring(bus.getStartTime(),0,5)}</h3>
			<h3 class="text-danger">Seats Booked : ${!ticketFound ? 0 : tickets.stream().map(it -> it.getSeatsBooked()).reduce(0, (acc, it) -> acc+it)}</h3>
		</div>
		<table class="table table-striped table-bordered">
			<thead class="table-dark">
				<tr>
					<th>User ID</th>
					<th>PNR Number</th>
					<th>Name</th>
					<th>Seats Booked</th>
					<th>Booking Date</th>
					<th>Fare</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${ticketFound}">
					<tbody>
						<c:forEach var="ticket" items="${tickets}">
							<tr>
								<td>
									<p class="fw-bold mb-1">${ticket.getUser().getUserid()}</p>
								</td>
								<td>
									<p class="fw-bold mb-1">${ticket.getPnrNo()}</p>
								</td>
								<td>
									<p class="fw-bold mb-1">${ticket.getUser().getName()}</p>
								</td>
								<td>
									<p class="fw-bold mb-1">${ticket.getSeatsBooked()}</p>
								</td>
								<td>
									<p class="fw-bold mb-1">${ticket.getDateBought()}</p>
								</td>
								<td>
									<p class="fw-bold mb-1">${ticket.getTotalAmount()}</p>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<td>
								<p class="fw-bold mb-1">NO TICKETS WERE BOOKED</p>
							</td>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>

		</table>
	</div>
</body>
</html>