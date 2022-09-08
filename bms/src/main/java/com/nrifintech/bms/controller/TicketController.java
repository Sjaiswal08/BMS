package com.nrifintech.bms.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nrifintech.bms.entity.Bus;
import com.nrifintech.bms.entity.Ticket;
import com.nrifintech.bms.entity.User;
import com.nrifintech.bms.service.BusService;
import com.nrifintech.bms.service.EmailSenderService;
import com.nrifintech.bms.service.TicketService;
import com.nrifintech.bms.service.UserService;
import com.nrifintech.bms.util.TicketEmailTemplate;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	@Autowired
	private BusService busService;
	@Autowired
	private UserService userService;
	@Autowired
	TicketService ticketService;
	@Autowired
	private EmailSenderService emailSenderService;

	@GetMapping("/bookTicket/{regNo}/{travelDate}/{availableSeats}")
	public ModelAndView showBookingInfo(@PathVariable("regNo") String regNo,
			@PathVariable("travelDate") String travelDate, @PathVariable("availableSeats") int availableSeats) {

		Bus bus = busService.getById(regNo);
		ModelAndView modelAndView = new ModelAndView("bookTicket");
		modelAndView.addObject("bus", bus);
		modelAndView.addObject("travelDate", travelDate);
		modelAndView.addObject("availableSeats", availableSeats);
		return modelAndView;
	}

	@PostMapping("/bookTicket/{regNo}/{travelDate}")
	public ModelAndView saveBookingInfo(@PathVariable("regNo") String regNo,
			@PathVariable("travelDate") String travelDate, @ModelAttribute("ticket") Ticket ticket,
			HttpServletRequest request, RedirectAttributes redirectAttributes) throws ParseException {

		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("userid");
		User user = userService.getById(userId);
		Bus bus = busService.getById(regNo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = format.parse(travelDate);
		java.sql.Date dateOfTravel = new java.sql.Date(parsed.getTime());
		String message = "Thank you For Using BMS Application For Ticket Booking.Your Booking Details are as follows :";

		ticket.setPnrNo(ticketService.generatePnrNo(userId));
		ticket.setDateOfTravel(dateOfTravel);
		ticket.setDateBought(java.sql.Date.valueOf(LocalDate.now()));
		ticket.setBus(bus);
		ticket.setUser(user);
		// Changes for Fare Edit Bug in FrontEnd
		int fare = busService.getById(bus.getRegistrationNo()).getFare();
		int distance = busService.getById(bus.getRegistrationNo()).getRoute().getDistance();
		int seatsBooked = ticket.getSeatsBooked();
		ticket.setTotalAmount(fare * distance * seatsBooked);
		ticketService.save(ticket);
		TicketEmailTemplate ticketTemplate = new TicketEmailTemplate.TicketEmailTemplateBuilder(ticket.getPnrNo(),
				ticket.getSeatsBooked()).busName(bus.getBusName()).dateBought(ticket.getDateBought().toString())
						.dateofTravel(ticket.getDateOfTravel().toString()).name(user.getName())
						.registrationNo(bus.getRegistrationNo()).busName(bus.getBusName())
						.facilities(bus.getFacilities().toString()).startTime(bus.getStartTime().toString())
						.startName(bus.getRoute().getStartName()).totalPaid(ticket.getTotalAmount())
						.stopName(bus.getRoute().getStopName()).message(message).build();
		emailSenderService.sendEmail(user.getEmail(), ticketTemplate.toString(), "TICKET CONFIRMATION");
		ModelAndView modelAndView = new ModelAndView("redirect:/user/myTickets");
		redirectAttributes.addFlashAttribute("bookedTicket", ticket);
		return modelAndView;
	}

	@GetMapping("/cancel/{pnrNo}")
	public ModelAndView cancelTicket(@PathVariable("pnrNo") String pnrNo, HttpServletResponse response,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {

		HttpSession session = request.getSession();
		Object attribute = session.getAttribute("isValidUser");

		if (attribute != (Object) true) {
			return new ModelAndView("redirect:/user/login");
		} else {
			Optional<Ticket> optionalTicket = ticketService.findById(pnrNo);
			Ticket ticket;
			if (optionalTicket.isPresent()) {
				ticket = optionalTicket.get();
			} else {
				ticket = null;
			}

			if (ticket != null) {
				int userIdOfTicket = ticket.getUser().getUserid();

				if (userIdOfTicket == (Integer) session.getAttribute("userid")) {
					redirectAttributes.addFlashAttribute("pnrNo", ticket.getPnrNo());
					redirectAttributes.addFlashAttribute("source", ticket.getBus().getRoute().getStartName());
					redirectAttributes.addFlashAttribute("dest", ticket.getBus().getRoute().getStopName());
					redirectAttributes.addFlashAttribute("date", ticket.getDateOfTravel());
					redirectAttributes.addFlashAttribute("validCancel", "YES");
					Bus bus = ticket.getBus();
					User user = ticket.getUser();
					String message = "Your ticket cancellation is successful.Details of your cancelled ticket are as follows :";
					TicketEmailTemplate ticketTemplate = new TicketEmailTemplate.TicketEmailTemplateBuilder(
							ticket.getPnrNo(), ticket.getSeatsBooked()).busName(bus.getBusName())
									.dateBought(ticket.getDateBought().toString())
									.dateofTravel(ticket.getDateOfTravel().toString()).name(user.getName())
									.registrationNo(bus.getRegistrationNo()).busName(bus.getBusName())
									.facilities(bus.getFacilities().toString()).startTime(bus.getStartTime().toString())
									.startName(bus.getRoute().getStartName()).totalPaid(ticket.getTotalAmount())
									.stopName(bus.getRoute().getStopName()).message(message).build();
					emailSenderService.sendEmail(user.getEmail(), ticketTemplate.toString(),
							"TICKET CANCELLATION CONFIRMED");
					ticketService.deleteByID(pnrNo);
				} else {
					redirectAttributes.addFlashAttribute("validCancel", "NO");
				}
			}

			ModelAndView modelAndView = new ModelAndView("redirect:/user/myTickets");
			return modelAndView;
		}

	}

}
