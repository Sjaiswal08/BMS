<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.nrifintech.bms.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<%@ include file="plugin.jsp"%>
<link rel="stylesheet" href="${context}/css/util.css">
<link rel="stylesheet" href="${context}/css/adminBus.css">

<title>BMS ADMIN | DASHBOARD</title>
</head>
<!-- NAVAR AND SIDEBAR -->

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<%@ include file="adminSecurity.jsp"%>

	<c:url var="sortLinkRegistrationNumber"
		value="${context}/admin/displayBusInformation">
		<c:param name="sort"
			value="<%=Integer.toString(AdminBusSortingUtils.REGISTRATION_NO)%>" />
	</c:url>
	<c:url var="sortLinkBusName"
		value="${context}/admin/displayBusInformation">
		<c:param name="sort"
			value="<%=Integer.toString(AdminBusSortingUtils.BUS_NAME)%>" />
	</c:url>
	<c:url var="sortLinkSeatCount"
		value="${context}/admin/displayBusInformation">
		<c:param name="sort"
			value="<%=Integer.toString(AdminBusSortingUtils.SEAT_COUNT)%>" />
	</c:url>
	<c:url var="sortLinkFare"
		value="${context}/admin/displayBusInformation">
		<c:param name="sort"
			value="<%=Integer.toString(AdminBusSortingUtils.FARE)%>" />
	</c:url>
	<c:url var="sortLinkStatus"
		value="${context}/admin/displayBusInformation">
		<c:param name="sort"
			value="<%=Integer.toString(AdminBusSortingUtils.IS_ACTIVE)%>" />
	</c:url>
	<c:url var="sortLinkFrom"
		value="${context}/admin/displayBusInformation">
		<c:param name="sort"
			value="<%=Integer.toString(AdminBusSortingUtils.FROM)%>" />
	</c:url>
	<c:url var="sortLinkTo" value="${context}/admin/displayBusInformation">
		<c:param name="sort"
			value="<%=Integer.toString(AdminBusSortingUtils.TO)%>" />
	</c:url>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark" id="mainNav">
		<a class="navbar-brand" href="index.html">Bus Management System </a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav " id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link"
					href="${context}/admin/dashboard"> <i
						class="fa fa-fw fa-sign-in-alt"></i> <span class="nav-link-text">Dashboard</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables"><a class="nav-link"
					href="${context}/admin/displayBusInformation"> <i
						class="fa fa-fw fa-table"></i> <span class="nav-link-text">Display
							Bus Information</span>
				</a>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables"><a class="nav-link"
					href="${context}/admin/addBus"> <i class="fa fa-fw fa-wrench"></i>
						<span class="nav-link-text">Add New Bus</span>
				</a></li>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a class="nav-link"
					href="${context}/admin/download/revenueReport.xlsx"
					data-parent="#exampleAccordion"> <i class="fa fa-fw fa-file"></i>
						<span class="nav-link-text">Generate Revenue Report</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a class="nav-link dropdown-toggle"
					href="#" id="percentageDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
					data-parent="#exampleAccordion"> <i class="fa fa-fw fa-file"></i>
						<span class="nav-link-text">Generate Bus Utilization Report</span></a>
					<div class="dropdown-menu percentage-dropdown-menu"
						aria-labelledby="percentageDropdown">
						<a class="dropdown-item"
							href="${context}/admin/download/underUtilizedBusReport.xlsx/10">Under
							10% utilized</a> <a class="dropdown-item"
							href="${context}/admin/download/underUtilizedBusReport.xlsx/20">Under
							20% utilized</a> <a class="dropdown-item"
							href="${context}/admin/download/underUtilizedBusReport.xlsx/30">Under
							30% utilized</a> <a class="dropdown-item"
							href="${context}/admin/download/underUtilizedBusReport.xlsx/40">Under
							40% utilized</a> <a class="dropdown-item"
							href="${context}/admin/download/underUtilizedBusReport.xlsx/50">Under
							50% utilized</a> <a class="dropdown-item"
							href="${context}/admin/download/underUtilizedBusReport.xlsx/60">Under
							60% utilized</a>
					</div></li>
			</ul>
			<ul class="navbar-nav ml-auto">

				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>Logout
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${context}/admin/dashboard">Dashboard</a></li>
				<li class="breadcrumb-item active">Displaying All Bus
					Information</li>
			</ol>
			<!-- Example DataTables Card-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> Bus Information
				</div>
				<c:if test="${fn:length(busAddMsg) > 0}">
					<div class="alert alert-success alert-dismissible fade show"
						role="alert">
						${busAddMsg}
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<div class="card-body">
					<table class="table align-middle mb-0 bg-white">
						<thead class="bg-light">
							<tr>
								<th title="Sort Alphabetically By Registration Number"><a
									href="${sortLinkRegistrationNumber}">Registration number<i
										class="fas fa-sort"></i>
								</a></th>
								<th title="Sort Alphabetically By Bus Name"><a
									href="${sortLinkBusName}">Bus Name<i class="fas fa-sort"></i></a></th>
								<th title="Sort Alphabetically By Source"><a
									href="${sortLinkFrom}">From<i class="fas fa-sort"></i></a></th>
								<th title="Sort Alphabetically By Destination"><a
									href="${sortLinkTo}">To<i class="fas fa-sort"></i></a></th>
								<th title="Sort By Seat Count"><a
									href="${sortLinkSeatCount}">Seat Count<i
										class="fas fa-sort"></i></a></th>
								<th title="Sort By Fare"><a href="${sortLinkFare}">Fare(per
										KM)<i class="fas fa-sort"></i>
								</a></th>
								<th title="Show Disabled Buses First"><a
									href="${sortLinkStatus}">Status<i class="fas fa-sort"></i></a></th>
								<th>Actions</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${busFound}">
								<tbody>
									<c:forEach var="bus" items="${buses}">
										<tr>
											<td>
												<p class="fw-bold mb-1">${bus.getRegistrationNo() }</p>
												<p class="text-muted mb-0 small">${bus.getFacilities()}</p>
											</td>
											<td>
												<p class="fw-bold mb-1">${bus.getBusName() }</p>
											</td>
											<td>
												<p class="fw-bold mb-1">${bus.route.getStartName() }</p>
											</td>
											<td>
												<p class="fw-bold mb-1">${bus.route.getStopName() }</p>
											</td>
											<td>
												<p class="fw-bold mb-1">${bus.getSeatCount() }</p>
											</td>
											<td>
												<p class="fw-bold mb-1">${bus.getFare() }</p>
											</td>
											<td><c:choose>
													<c:when test="${bus.getActiveStatus() eq 'YES'}">
														<span class="badge badge-success rounded-pill">ACTIVE</span>
													</c:when>
													<c:otherwise>
														<span class="badge badge-warning rounded-pill">DISABLED</span>
													</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${bus.getActiveStatus() eq 'YES'}">
														<a
															href="${context}/admin/ticketList/${bus.getRegistrationNo()}"
															title="Download PNR Report for ${tmrDate }"><span
															class="fa fa-download pr-2"></span></a>
														<a
															href="${context}/admin/disableBus/${bus.getRegistrationNo() }"
															title="Disable the bus"><span
															class="fas fa-toggle-on"></span></a>
													</c:when>
													<c:otherwise>
														<a
															href="${context}/admin/ticketList/${bus.getRegistrationNo()}"
															title="Download PNR Report for ${tmrDate }"><span
															class="fa fa-download pr-2"></span></a>
														<a
															href="${context}/admin/enableBus/${bus.getRegistrationNo() }"
															title="Enable the bus"><span
															class="fas fa-toggle-off"></span></a>
													</c:otherwise>
												</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</c:when>
							<c:otherwise>
								<tbody>
									<tr>
										<td>
											<p class="fw-bold mb-1">NO DATA FOUND</p>
										</td>
									</tr>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<div class="card-footer small text-muted">
				Last Updated at
				<%=(new java.util.Date()).toString()%></div>
		</div>
	</div>
	<!-- /.container-fluid-->
	<!-- /.content-wrapper-->
	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Copyright © Bus Management System 2022</small>
			</div>
		</div>
	</footer>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="${context}/admin/logout">Logout</a>
				</div>
			</div>
		</div>
	</div>

</body>


</html>