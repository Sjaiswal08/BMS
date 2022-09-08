<nav class="navbar navbar-expand-lg navbar-light">
	<div class="container nav-container">
		<div class="brand">
			<a class="navbar-brand text-bms-yellow font-weight-bold"
				href="${context}/user/welcome"><i class="fas fa-bus"></i> BMS</a>
		</div>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Hi, <c:out value="${sessionScope.name}" />
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${context}/user/editaccount">Edit Account</a>
					</div></li>
				<li class="nav-item mx-2"><a class="nav-link item"
					href="${context}/user/searchBus">Plan Journey</a></li>
				<li class="nav-item mx-2"><a class="nav-link"
					href="${context}/user/myTickets">My Tickets</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0"
				action="${context}/user/logout">
				<button
					class="btn bg-bms-primary my-2 my-sm-0 logout-btn text-bms-secondary font-weight-bold"
					type="submit">LOG OUT</button>
			</form>
		</div>
	</div>
</nav>