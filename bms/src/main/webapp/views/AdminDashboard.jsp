<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
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

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark" id="mainNav">
		<a class="navbar-brand" href="${context}/admin/dashboard">Bus Management
			System </a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav " id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="${context}/admin/dashboard">
						<i class="fa fa-fw fa-sign-in-alt"></i> <span
						class="nav-link-text">Dashboard</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables"><a class="nav-link"
					href="${context}/admin/displayBusInformation"> <i
						class="fa fa-fw fa-table"></i> <span class="nav-link-text">Display
							Bus Information</span>
				</a>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables"><a class="nav-link" href="${context}/admin/addBus"> <i
						class="fa fa-fw fa-wrench"></i> <span class="nav-link-text">Add
							New Bus</span>
				</a></li>
				</li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a class="nav-link"
					href="${context}/admin/download/revenueReport.xlsx"
					data-parent="#exampleAccordion"> <i class="fa fa-fw fa-file"></i>
						<span class="nav-link-text">Generate Revenue Report</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a class="nav-link dropdown-toggle" href="#" id="percentageDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" data-parent="#exampleAccordion"> <i class="fa fa-fw fa-file"></i>
						<span class="nav-link-text">Generate Bus Utilization Report</span></a>
					<div class="dropdown-menu percentage-dropdown-menu" aria-labelledby="percentageDropdown">
						<a class="dropdown-item" href="${context}/admin/download/underUtilizedBusReport.xlsx/10">Under 10% utilized</a> 
						<a class="dropdown-item" href="${context}/admin/download/underUtilizedBusReport.xlsx/20">Under 20% utilized</a> 
						<a class="dropdown-item" href="${context}/admin/download/underUtilizedBusReport.xlsx/30">Under 30% utilized</a> 
						<a class="dropdown-item" href="${context}/admin/download/underUtilizedBusReport.xlsx/40">Under 40% utilized</a> 
						<a class="dropdown-item" href="${context}/admin/download/underUtilizedBusReport.xlsx/50">Under 50% utilized</a> 
						<a class="dropdown-item" href="${context}/admin/download/underUtilizedBusReport.xlsx/60">Under 60% utilized</a> 
					</div>
				</li>
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
				<li class="breadcrumb-item"><a href="${context}/admin/dashboard">Dashboard</a></li>
				<li class="breadcrumb-item active">Admin Dashboard</li>
			</ol>
			<!-- Icon Cards-->
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-comments"></i>
							</div>
							<div class="mr-5">${busCount } Buses Currently Running</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left"></span> <span class="float-right">
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-list"></i>
							</div>
							<div class="mr-5">${routeCount } Routes Currently Serving</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left"></span> <span class="float-right">
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-shopping-cart"></i>
							</div>
							<div class="mr-5">${userCount } Users Registered Currently</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left"></span> <span class="float-right">
						</span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fa fa-fw fa-support"></i>
							</div>
							<div class="mr-5">${ticketCount } Tickets Sold</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="#">
							<span class="float-left"></span> <span class="float-right">
						</span>
						</a>
					</div>
				</div>
			</div>
			<!-- Example DataTables Card-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-table"></i> Route Information
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>Route Code</th>
									<th>Start Name</th>
									<th>Stop Name</th>
									<th>Distance(in KM)</th>
									<th>Bus Count</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${routeInfo }" var="route">
									<tr>
										<td>${route.routecode }</td>
										<td>${route.source }</td>
										<td>${route.destination }</td>
										<td>${route.distance }</td>
										<%-- <td>${route.totalrevenue }</td> --%>
										<td>${route.buscount }</td>
									</tr>
								</c:forEach>
							</tbody>
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
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="${context}/admin/logout">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>


</html>