package com.nrifintech.bms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nrifintech.bms.entity.Bus;

@Repository
public interface BusAndRouteRepository extends AbstractBaseRepository<Bus, String> {

	@Query("SELECT b FROM Bus b where b.route.startName=?1 and b.route.stopName=?2 and b.activeStatus='YES'")
	public List<Bus> findAllWithSourceDest(String source, String destination);

	Bus findByRegistrationNo(String registrationNo);

	@Query(value = "select * from(\r\n"
			+ "		select bus.registration_no, busname, fare_per_km, facilities, routecode, startname, stopname, \r\n"
			+ "		(totalseats*30) as total_seats, coalesce(sum(seats_booked),0) as total_seats_booked, \r\n"
			+ "		round((coalesce(sum(seats_booked),0)/(totalseats*30)*100)) as Percentage_Seat_Utilization from bus  join route using(routecode) \r\n"
			+ "		left join ticket on bus.registration_no = ticket.registration_no\r\n"
			+ "		where DATEDIFF(curdate(),date_bought) < 31 or date_bought is null group by registration_no \r\n"
			+ "        ) t1\r\n" + "where Percentage_Seat_Utilization < ?1 order by 10", nativeQuery = true)
	public List<Object[]> getUnderUtilizedBusInfo(int percentage);

}
