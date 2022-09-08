<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>BMS | Login and Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="plugin.jsp"%>
<link rel="stylesheet" href="${context}/css/UserAuth.css">
<link rel="stylesheet" href="${context}/css/util.css">
<body class="d-flex align-items-center justify-content-center">
	<c:choose>
		<c:when test="${sessionScope.isValidAdmin == true}">
			<%
			System.out.println("inside admin");
			%>
			<%
			response.sendRedirect(request.getContextPath() + "/admin/dashboard");
			%>
		</c:when>
		<c:when test="${sessionScope.isValidUser == true}">
			<%
			response.sendRedirect(request.getContextPath() + "/user/searchBus");
			%>
		</c:when>
	</c:choose>

	<div class="wrapper">
		<div class="title-text">
			<div class="title login">BMS Login</div>
			<div class="title signup">BMS SignUp</div>
		</div>
		<div class="form-container">
			<div class="slide-controls">
				<input type="radio" name="slide" id="login" checked> <input
					type="radio" name="slide" id="signup"> <label for="login"
					class="slide login">Login</label> <label for="signup"
					class="slide signup">Signup</label>
				<div class="slider-tab"></div>
			</div>
			<div class="form-inner">
				<form action="${context}/user/login" class="login" method="post">
					<div class="field">
						<input type="email" id="email" name="email"
							placeholder="Email Address" value="${email }" required>
					</div>
					<div class="field">
						<input type="password" id="password" name="password"
							placeholder="Password" required>
					</div>
					<div class="pass-link text-center">
						<span class="text-danger">${error_msg }</span>
					</div>
					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="Login">
					</div>
					<div class="signup-link">
						Not a member? <a href="">Signup now</a>
					</div>
				</form>
				<form action="${context}/user/signUp" class="signup" method="post">
					<div class="field">
						<input type="text" id="name" name="name" placeholder="Full Name"
							pattern="^[a-zA-Z ]{2,50}$"
							oninvalid="this.setCustomValidity('Name can contain only alphabets ')"
							oninput="setCustomValidity('')" required>
					</div>
					<div class="field">
						<input type="text" id="mno" name="mobileNo"
							placeholder="Mobile Number" pattern="[6789]{1}[0-9]{9}"
							oninvalid="this.setCustomValidity('Please enter a valid mobile number ')"
							oninput="setCustomValidity('')" required>
					</div>
					<div class="field">
						<input type="email" id="email" name="email"
							placeholder="Email Address" required>
					</div>
					<div class="field">
						<input type="password" id="pass" name="password"
							placeholder="Password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}"
							oninvalid="this.setCustomValidity('Must contain at least one number and one uppercase and lowercase letter, and at least 8 and at max 15 characters')"
							oninput="setCustomValidity('')" required>
					</div>
					<div class="field">
						<input type="password" id="cpass" placeholder="Confirm password"
							onkeyup="matchPassword()"
							oninvalid="this.setCustomValidity('Password Don't Match')"
							required>
					</div>
					<div class="field btn">
						<div class="btn-layer"></div>
						<input type="submit" value="Sign Up">

					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${context}/js/UserAuth.js"></script>

</body>

</html>