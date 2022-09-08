package com.nrifintech.bms.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nrifintech.bms.entity.Bus;
import com.nrifintech.bms.entity.Route;
import com.nrifintech.bms.entity.Ticket;
import com.nrifintech.bms.entity.User;
import com.nrifintech.bms.exporter.DepartureSheetExporter;
import com.nrifintech.bms.exporter.RevenueReportExporter;
import com.nrifintech.bms.exporter.UnderUtilizedBusInfoExporter;
import com.nrifintech.bms.model.Revenue;
import com.nrifintech.bms.model.RouteInfo;
import com.nrifintech.bms.model.UnderUtilizedBusInfo;
import com.nrifintech.bms.service.BusService;
import com.nrifintech.bms.service.RouteService;
import com.nrifintech.bms.service.TicketService;
import com.nrifintech.bms.service.UserService;
import com.nrifintech.bms.util.AdminBusSortingUtils;
import com.nrifintech.bms.util.BusActiveStatus;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private BusService busService;
	@Autowired
	private UserService userService;
	@Autowired
	private TicketService ticketService;
	@Autowired
	private RouteService routeService;

	@GetMapping("/login")
	public ModelAndView adminLogin() {
		ModelAndView mv = new ModelAndView("AdminLogin");
		return mv;
	}

	@GetMapping("/dashboard")
	public ModelAndView adminDashboard() {
		long busCount = busService.countBuses();
		long routeCount = routeService.countRoutes();
		long ticketCount = ticketService.countTickets();
		long userCount = userService.countUsers();
		List<RouteInfo> routeInfo = ticketService.getBusCountPerRoute();
		ModelAndView mv = new ModelAndView("AdminDashboard");
		mv.addObject("busCount", busCount);
		mv.addObject("routeCount", routeCount);
		mv.addObject("ticketCount", ticketCount);
		mv.addObject("userCount", userCount);
		mv.addObject("routeInfo", routeInfo);
		return mv;
	}

	@GetMapping("/displayBusInformation")
	public ModelAndView displayBusInformation(@RequestParam(required = false, name = "sort") String sort,
			@ModelAttribute("busAddMsg") String busAddMsg) {
		List<Bus> buses = null;
		if (sort != null) {
			int theSortField = Integer.parseInt(sort);
			buses = busService.getBuses(theSortField);
		} else {
			buses = busService.getBuses(AdminBusSortingUtils.REGISTRATION_NO);
		}
		ModelAndView mv = new ModelAndView("AdminBusInformation");
		mv.addObject("busAddMsg", busAddMsg);
		Date today = new Date();
		Date tomorrow = new Date(today.getTime() + (1000 * 60 * 60 * 24));
		String tmrDate = tomorrow.toString().substring(0, 10);
		mv.addObject("tmrDate", tmrDate);
		if (buses.isEmpty()) {
			mv.addObject("busFound", false);
		} else {
			mv.addObject("busFound", true);
			mv.addObject("buses", buses);
		}
		return mv;
	}

	@PostMapping("/login")
	public ModelAndView doAdminLogin(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		email = email.toLowerCase();
		String password = request.getParameter("password");
		User user = userService.findAdmin(email);

		if (user == null) {
			ModelAndView uauth = new ModelAndView("AdminLogin");
			uauth.addObject("error_msg", "Please Provide Correct Credentials");
			uauth.addObject("email", email);
			return uauth;
		} else {
			boolean isValidAdmin = userService.isValidAdmin(user, password);
			if (isValidAdmin) {
				HttpSession session = request.getSession();
				session.setAttribute("isValidAdmin", true);
				session.setAttribute("userid", user.getUserid());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("name", user.getName());
				ModelAndView mv = new ModelAndView("redirect:/admin/dashboard");
				return mv;
			} else {
				ModelAndView uauth = new ModelAndView("AdminLogin");
				uauth.addObject("error_msg", "Invalid Password. Please try again");
				uauth.addObject("email", email);
				return uauth;
			}
		}
	}

	@GetMapping("/logout")
	public ModelAndView doLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("isValidAdmin");
		session.removeAttribute("userid");
		session.removeAttribute("email");
		session.removeAttribute("name");
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/user/welcome");
		return mv;
	}

	@GetMapping("/disableBus/{registrationNo}")
	public ModelAndView disableBus(@PathVariable("registrationNo") String registrationNo) {
		Bus bus = busService.getById(registrationNo);
		bus.setActiveStatus(BusActiveStatus.NO);
		busService.saveOrUpdate(bus);
		ModelAndView mv = new ModelAndView("redirect:/admin/displayBusInformation");
		return mv;
	}

	@GetMapping("/enableBus/{registrationNo}")
	public ModelAndView enableBus(@PathVariable("registrationNo") String registrationNo) {
		Bus bus = busService.getById(registrationNo);
		bus.setActiveStatus(BusActiveStatus.YES);
		busService.saveOrUpdate(bus);
		ModelAndView mv = new ModelAndView("redirect:/admin/displayBusInformation");
		return mv;
	}

	@RequestMapping("ticketList/{registrationNo}")
	public ModelAndView ticketList(@PathVariable("registrationNo") String registrationNo) {
		Date today = new Date();
		Date tomorrow = new Date(today.getTime() + (1000 * 60 * 60 * 24));
		Bus bus = busService.getById(registrationNo);
		List<Ticket> tickets = ticketService.findAllTicketsByBusAndDateBought(bus, tomorrow);
		ModelAndView modelAndView = new ModelAndView("ticketList");
		modelAndView.addObject(bus);
		if (tickets.isEmpty()) {
			modelAndView.addObject("ticketFound", false);
		} else {
			modelAndView.addObject("ticketFound", true);
			modelAndView.addObject("tickets", tickets);
		}
		return modelAndView;
	}

	@RequestMapping("/export/{registrationNo}")
	public void exportToExcel(@PathVariable("registrationNo") String registrationNo, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		Object attribute = session.getAttribute("isValidAdmin");
		if (attribute != (Object) true) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
		} else {
			Date today = new Date();
			Date tomorrow = new Date(today.getTime() + (1000 * 60 * 60 * 24));
			String tmrDate = tomorrow.toString().substring(0, 10);
			Bus bus = busService.getById(registrationNo);
			List<Ticket> tickets = ticketService.findAllTicketsByBusAndDateBought(bus, tomorrow);
			String file_name = bus.getBusName() + tmrDate + ".xlsx";
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=" + file_name);

			DepartureSheetExporter excelExporter = new DepartureSheetExporter(tickets);
			excelExporter.export(response);
		}

	}

	// For calling admin add bus form
	@GetMapping("/addBus")
	public ModelAndView welcomeUser() {
		ModelAndView mv = new ModelAndView("AdminAddBus");
		List<Route> routes = routeService.findAll();
		mv.addObject("routes", routes);
		return mv;
	}

	// For saving the data in database after getting from form
	@PostMapping("/addBus")
	public ModelAndView addBus(@ModelAttribute("bus") Bus bus, @ModelAttribute("startTimeForm") String startTimeForm,
			@ModelAttribute("routeCode") int routeCode, RedirectAttributes redirectAttributes) {
		Bus busExists = busService.findByRegistrationNo(bus.getRegistrationNo());
		if (busExists != null) {
			ModelAndView mv = new ModelAndView("AdminAddBus");
			System.out.println(bus);
			mv.addObject("bus", bus);
			List<Route> routes = routeService.findAll();
			mv.addObject("routes", routes);
			mv.addObject("error_msg", "Registration number already exists!");
			return mv;
		}
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/displayBusInformation");
		Route route = routeService.getById(routeCode);
		String busAddMsg = "Bus with registration no. " + bus.getRegistrationNo() + " on route " + route.getStartName()
				+ " to " + route.getStopName() + " added successfully";
		redirectAttributes.addFlashAttribute("busAddMsg", busAddMsg);
		bus.setRoute(route);
		bus.setActiveStatus(BusActiveStatus.YES);

		startTimeForm = startTimeForm.concat(":00");
		java.sql.Time time = java.sql.Time.valueOf(startTimeForm);
		bus.setStartTime(time);

		busService.saveOrUpdate(bus);
		return modelAndView;
	}

	@GetMapping("/download/revenueReport.xlsx")
	public void getRevenueReport(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Object attribute = session.getAttribute("isValidAdmin");
		if (attribute != (Object) true) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
		} else {
			List<Revenue> revenueList = ticketService.getRevenue();

			response.setContentType("application/octet-stream");
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd");
			Calendar c1 = Calendar.getInstance();
			String currentDate = df.format(date);
			c1.add(Calendar.DAY_OF_YEAR, -30);
			df = new SimpleDateFormat("yyyy-MM-dd");
			Date resultDate = c1.getTime();
			String prevDate = df.format(resultDate);
			String filename = "Revenue_" + prevDate + "_" + currentDate + ".xlsx";
			response.setHeader("Content-Disposition", "attachment; filename=" + filename);
			ByteArrayInputStream stream = RevenueReportExporter.exportRevenueReport(revenueList);
			IOUtils.copy(stream, response.getOutputStream());
		}
	}

	@GetMapping("/download/underUtilizedBusReport.xlsx/{percentage}")
	public void getUnderUtilizedBusReport(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("percentage") int percentage) throws IOException {
		HttpSession session = request.getSession();
		Object attribute = session.getAttribute("isValidAdmin");
		if (attribute != (Object) true) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
		} else {
			List<UnderUtilizedBusInfo> underUtilizedBusList = busService.getUnderUtilizedBusInfo(percentage);

			response.setContentType("application/octet-stream");
			Date date = new Date();
			SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd");
			Calendar c1 = Calendar.getInstance();
			String currentDate = df.format(date);
			c1.add(Calendar.DAY_OF_YEAR, -30);
			df = new SimpleDateFormat("yyyy-MM-dd");
			Date resultDate = c1.getTime();
			String prevDate = df.format(resultDate);
			String filename = "Under_" + percentage + "_PercentUtilizedBus_" + prevDate + "_" + currentDate + ".xlsx";
			response.setHeader("Content-Disposition", "attachment; filename=" + filename);
			ByteArrayInputStream stream = UnderUtilizedBusInfoExporter.exportUnderUtilizedBusInfo(underUtilizedBusList,
					percentage);
			IOUtils.copy(stream, response.getOutputStream());
		}
	}
}
