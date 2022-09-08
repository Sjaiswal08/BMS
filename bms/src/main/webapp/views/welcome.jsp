<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="plugin.jsp"%>
    <link rel="stylesheet" href="${context}/css/util.css">
    <link rel="stylesheet" href="${context}/css/welcomepage.css">
    <link rel="stylesheet" href="${context}/css/navbar.css">

      
    <title>BMS | Welcome</title>
</head>

<body>
	<c:choose>
		<c:when test="${sessionScope.isValidUser == true}">
			<%response.sendRedirect(request.getContextPath()+"/user/searchBus");%>
		</c:when>
		<c:when test="${sessionScope.isValidAdmin == true}">
			<%response.sendRedirect(request.getContextPath()+"/admin/dashboard");%>
		</c:when>
	</c:choose>

	<!-- NAVBAR -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-bms-primary">
        <div class="container nav-container">
            <a class="navbar-brand" href="${context}/user/welcome">
                <div class="font-weight-bold"><i class="fas fa-bus"></i> BMS</div>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item pl-2 pr-2">
                        <a class="nav-link btn" href="${context}/user/login"><span class="fas fa-sign-in-alt"></span>
                            Login</a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
    <!-- CAROUSEL -->
    <section id="carousel-section">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="${context}/images/1.jpg" alt="First slide">
                    <div class="carousel-caption trickcenter">
                        <div>
                            <h1>Our Premium Range of Services</h1>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="${context}/images/2.jpg" alt="Second slide">
                    <div class="carousel-caption trickcenter">
                        <div>
                            <h1>Our Premium Range of Services</h1>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>
    <!-- PROMISE SECTION  -->
    <section class="promise-section">
        <div class="container">
            <h1 class="text-center promise-heading">We Promise to Deliver</h1>
            <div class="row my-auto mx-auto card-section justify-content-center">
                <div class="card-deck">
                    <div class="card col-lg-4 col-sm-6 col-md-6 text-center text-secondary" data-aos="fade-up">
                        <i class="fas fa-pump-medical card-icon text-bms-primary"></i>
                        <div class="card-body">
                            <h5 class="card-title">safety+</h5>
                            <p class="card-text">With Safety+ we have brought in a set of measures like Sanitized
                                buses,
                                mandatory masks etc. to ensure you travel safely.</p>
                        </div>
                    </div>
                    <div class="card col-lg-4 col-sm-6 col-md-6 text-center text-secondary" data-aos="fade-up"
                        data-aos-delay="200">
                        <i class="fas fa-headset card-icon text-bms-primary"></i>
                        <div class="card-body">
                            <h5 class="card-title">SUPERIOR CUSTOMER SERVICE</h5>
                            <p class="card-text">We put our experience and relationships to good use and are
                                available
                                to solve your travel issues.</p>
                        </div>
                    </div>
                    <div class="card col-lg-4 col-sm-6 col-md-6 text-center text-secondary" data-aos="fade-up"
                        data-aos-delay="400">
                        <i class="fas fa-rupee-sign card-icon text-bms-primary"></i>
                        <div class="card-body">
                            <h5 class="card-title">LOWEST PRICES</h5>
                            <p class="card-text">We always give you the lowest price with the best partner offers.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

    <!-- OUR FEATURES -->

    <div class="row justify-content-center no-gutters">
        <div class="col-md my-4">
            <div class="card rounded-0 bg-transparent border-0">
                <div class="card-body">
                    <div class="row no-gutters">
                        <div class="col-md text-center" data-aos="fade-up">
                            <div class="route-count-img"></div>
                            <h4 class="mt-2"><strong>${routeCount }+</strong></h4>
                            <h5 class="text-uppercase text-gray">ROUTES</h5>
                        </div>
                        <div class="col-md text-center" data-aos="fade-up" data-aos-delay="200">
                            <div class="bus-services-img"></div>
                            <h4 class="mt-2"><strong>${busCount }+</strong></h4>
                            <h5 class="text-uppercase text-gray">BUSES</h5>
                        </div>
                        <div class="col-md text-center" data-aos="fade-up" data-aos-delay="400">
                            <h4 class="mt-2"><strong>30 SEC</strong></h4>
                            <h5 class="text-uppercase text-gray">INSTANT E-TICKET &amp; CANCELLATION</h5>
                        </div>
                        <div class="col-md text-center" data-aos="fade-up" data-aos-delay="600">
                            <h4 class="mt-2"><strong>${userCount }+</strong></h4>
                            <h5 class="text-uppercase text-gray">Happy customers</h5>
                        </div>
                        <div class="col-md text-center" data-aos="fade-up" data-aos-delay="800">
                            <h4 class="mt-2"><strong>24/7</strong></h4>
                            <h5 class="text-uppercase text-gray">customer care</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 
    OUR DESCRIPTION -->
    <div class="card" data-aos="fade-right" data-aos-delay="200">
        <div class="card-body">
            <h2 style="font-size: 1.5rem;" class="mb-4">The Best Way to Book Bus Ticket </h2>
            <p class="mt-3 ">Do you want to know the best way to book tickets online securely and how to book tickets in
                advance? BMS.com is the best online platform for bus booking.
                You can check the amenities provided, compare booking fares, check bus timings in the searched route,
                other
                facilities and more with us. You can find an affordable and cost-effective online travel bookings
                facility
                at BMS.</p>
            <p class="mt-3 ">With BMS, online bus ticket booking is now very easy. You simply need to fill in the
                details of your journey in our search bar (departure city, destination city and the date of journey)
                click
                on the search button to get all the bus operators available for booking tickets online. Then, select the
                bus
                that best suits your travel needs and securely complete your booking online on BMS.com.</p>
            <p class="mt-3 ">We would recommend that you book your tickets at least 2 - 3 days in advance so that you
                can
                reserve bus seats as per your preference and get the best price on your booking.
            </p>
            <h2 style="font-size: 1.5rem;" class="mb-4">Online Bus Booking Services</h2>
            <p class="mt-3 ">BMS is India‚Äôs leading online bus ticket booking service provider.
                schedules, and find all the information you need to plan an ideal and comfortable bus journey.</p>
            <p class="mt-3 ">BMS has simplified the online bus booking process for your travel planning. You can
                save
                time and money by using BMS. Book now!!!</p>
            <p class="mt-3 ">Check all your bus route options to accommodate
                a
                reliable and comfortable journey as per your scheduled travel plan needs.</p>
        </div>
    </div>
    <div class="card" data-aos="fade-left" data-aos-delay="400">
        <div class="card-body">
            <h2 style="font-size: 1.5rem;" class="mb-4 ">Why Choose BMS for Bus Ticket Booking? </h2>
            <p>BMS is India‚Äôs fastest growing online ticket booking platform offering bus ticket booking, train
                ticket
                booking and bus rental services. BMS is the ticketing partner of several State Road
                Transport
                Corporation (SRTC) operators, and you can also book tickets for your favourite private travels at
                discounted
                ticket prices.
            </p>
            <p>BMS has an inventory of over 100+ bus service partners operating scheduled buses in India.
                Travellers
                can easily view their bus schedules, compare their ticket prices, and book bus tickets online directly
                through BMS. All these buses currently cover more than 10 bus routes with reliable
                transportation
                in India.</p>
            <p> Travellers can book all types of bus booking, from Non-AC buses to Volvo AC buses on BMS. </p>
            <ul>
                <li>Free Cancellation</li>
                <li>Safe-T Bus Partners</li>
                <li>Lowest Bus Ticket Price Assured</li>
                <li>Easy and Quick Bus Booking Online </li>
            </ul>
        </div>
    </div>
    <div class="card" data-aos="fade-right" data-aos-delay="600">
        <div class="card-body">
            <h2 style="font-size: 1.5rem;" class="mb-4">Benefits of Booking Bus Tickets Online</h2>
            <p>In this day and age of technology, offline modes of bus ticket booking are no more a preference. Online
                ticket booking is easy, fast and hassle-free. BMS ticks off all three with our easy website
                navigation.</p>
            <p>Booking bus tickets online with BMS has solved many problems that people face while booking their
                tickets
                at offline counters or travel agents.</p>
            <p>Here's listing all the benefits of booking bus tickets online on BMS</p>
            <ul>
                <li>Avoid standing in long queues at offline bus ticket counters.</li>
                <li>No more hassle of approaching travel agents.</li>
                <li>Choose from multiple bus services.</li>
                <li>Book both Private and SRTC bus tickets online.</li>
                <li>Check bus ticket availability online.</li>
                <li>Get bus timings, ticket price, boarding &amp; dropping point details online.</li>
                <li>Free cancellation feature.</li>
                <li>Each and every transaction is simple, safe and secure.</li>
            </ul>
        </div>
    </div>
    <div class="card" data-aos="fade-left" data-aos-delay="800">
        <div class="card-body">
            <h2 style="font-size: 1.5rem;" class="mb-4">How to Book Bus Tickets Online on BMS</h2>
            <p>Each and every booking or transaction you do on the BMS website is simple, safe &amp; secure. You can
                complete your booking process from the best bus booking website BMS.com by following the steps
                mentioned
                below.</p>
            <ul>
                <li>Enter the Source and Destination details in the leaving from and Going to tab respectively</li>
                <li>Select the ÄúJourney date from calendar icon and click on the Search button</li>
                <li>Select any bus operator of your choice from the list of buses which are displayed</li>
                <li>Select a seat, boarding and dropping points and hit Continue to Confirm Booking.</li>
                <li>Enter all the required information including contact number &amp; passenger details</li>
            </ul>
            <p class="mt-3 ">Once the booking is confirmed, you will receive a E-ticket on your My Ticket Section of
                your dashboard.Also a Ticket Confirmation will be sent to your Registered Email.Äù</p>
            <h2 style="font-size: 1.5rem;" class="mb-4">Last Hour Ticket Booking</h2>
            <p>Most of the online bus bookings are more than 50% unplanned, with 32% of the people reserving tickets on
                the
                day of travel and 24% one day before the journey. Keeping this in mind, BMS has ensured buses are
                available round the clock 24/7. You can experience the
                flexibility of the ticket booking system on BMS both in terms of bus timings and price choices.</p>
            <p>BMS provides the quickest way to find last-hour online bus booking and you can compare the prices of
                the
                operators, their schedule timings, and more. Travellers can enjoy the affordability and convenience that
                comes with thousands of trusted bus operators who have partnered with us in India. You can avail of the
                last-hour ticket booking and find multiple pick-up and drop location options on BMS.com.</p>
        </div>
    </div>

    <footer class="page-footer font-small lighten-5">
        <div class="">
            <div class="container">
                <div class="row py-4 d-flex align-items-center">
                    <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
                        Copyright © Bus Management System 2022
                    </div>
                    <div class="col-md-6 col-lg-7 text-center text-md-right">
                        <a class="text-white" href="${context}/admin/login">Admin Login</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="${context}/plugin/aos.js"></script>
    <script>
        AOS.init();
    </script>
</body>

</html>