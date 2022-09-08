package com.nrifintech.bms.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.nrifintech.bms.entity.Bus;
import com.nrifintech.bms.model.UnderUtilizedBusInfo;
import com.nrifintech.bms.repository.BusAndRouteRepository;
import com.nrifintech.bms.util.AdminBusSortingUtils;

@Service
public class BusService {
	@Autowired
	private BusAndRouteRepository repository;
	@Autowired
	private TicketService ticketService;

	public List<Bus> getBusWithSourceDest(String source, String destination) {
		return repository.findAllWithSourceDest(source, destination);
	}

	public List<Bus> findAll() {
		return repository.findAll();
	}

	public Bus getById(String registrationNo)

	{
		return repository.getById(registrationNo);
	}

	public void saveOrUpdate(Bus bus) {
		String reg_no = bus.getRegistrationNo().toUpperCase();
		bus.setRegistrationNo(reg_no);
		repository.save(bus);
	}

	public List<Bus> getBuses(int theSortField) {
		if (theSortField == AdminBusSortingUtils.BUS_NAME)
			return repository.findAll(Sort.by("busName"));
		else if (theSortField == AdminBusSortingUtils.FARE)
			return repository.findAll(Sort.by("fare"));
		else if (theSortField == AdminBusSortingUtils.SEAT_COUNT)
			return repository.findAll(Sort.by("seatCount"));
		else if (theSortField == AdminBusSortingUtils.IS_ACTIVE)
			return repository.findAll(Sort.by("activeStatus"));
		else if (theSortField == AdminBusSortingUtils.FROM)
			return repository.findAll(Sort.by("route.startName"));
		else if (theSortField == AdminBusSortingUtils.TO)
			return repository.findAll(Sort.by("route.stopName"));
		return repository.findAll(Sort.by("registrationNo"));
	}

	public void setAllAvailableSeatsForDate(List<Bus> buses, String travelDate) throws ParseException {
		int availableSeats;
		for (Bus bus : buses) {
			availableSeats = bus.getSeatCount() - ticketService.getTotalSeatsByBusAndDate(bus, travelDate);
			bus.setAvailableSeats(availableSeats);

		}
	}

	public Bus findByRegistrationNo(String registrationNo) {
		return repository.findByRegistrationNo(registrationNo);
	}

	public long countBuses() {
		return repository.count();
	}

	public List<UnderUtilizedBusInfo> getUnderUtilizedBusInfo(int percentage) {
		List<UnderUtilizedBusInfo> list = new ArrayList<>();
		List<Object[]> underUtilizedBusDetails = repository.getUnderUtilizedBusInfo(percentage);
		underUtilizedBusDetails.forEach(row -> {
			UnderUtilizedBusInfo underUtilizedBus = new UnderUtilizedBusInfo(row[0] + "", row[1] + "", row[2] + "",
					row[3] + "", row[4] + "", row[5] + "", row[6] + "", row[7] + "", row[8] + "", row[9] + "");
			list.add(underUtilizedBus);
		});
		return list;
	}
}
