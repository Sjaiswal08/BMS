<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<title>Admin Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="plugin.jsp"%>
<link rel="stylesheet" href="${context}/css/AdminLogin.css">
<link rel="stylesheet" href="${context}/css/util.css">

</head>

<body>
	<c:choose>
		<c:when test="${sessionScope.isValidUser == true}">
			<%
			System.out.println("inside admin");
			%>
			<%
			response.sendRedirect(request.getContextPath() + "${context}/user/searchBus");
			%>
		</c:when>
		<c:when test="${sessionScope.isValidAdmin == true}">
			<%
			response.sendRedirect(request.getContextPath() + "${context}/admin/dashboard");
			%>
		</c:when>
	</c:choose>

	<div class="wrapper">
		<div class="title-text">
			<div class="title login">BMS Admin Login</div>

		</div>
		<div class="form-container">

			<div class="form-inner">
				<form action="login" class="login" method="post">
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

				</form>

			</div>
		</div>
	</div>
	<script>
      const loginText = document.querySelector(".title-text .login");
      const loginForm = document.querySelector("form.login");
      const loginBtn = document.querySelector("label.login");
      const signupBtn = document.querySelector("label.signup");
      const signupLink = document.querySelector("form .signup-link a");

      loginBtn.onclick = (() => {
         loginForm.style.marginLeft = "0%";
         loginText.style.marginLeft = "0%";
      });

   </script>
</body>

</html>