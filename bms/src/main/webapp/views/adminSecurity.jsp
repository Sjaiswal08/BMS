<%
		response.setHeader("Cache-Control", "no-cache, no-store, no-revalidate");	// HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setHeader("Expires", "0"); // Proxies
%>
	

<c:choose>
	<c:when test="${sessionScope.isValidUser == true}">
		<% System.out.println("inside admin"); %>
		<%response.sendRedirect(request.getContextPath()+"/user/searchBus");%>
	</c:when>
	<c:when test="${sessionScope.isValidAdmin != true}">
		<%response.sendRedirect(request.getContextPath()+"/admin/login");%>
	</c:when>
</c:choose>