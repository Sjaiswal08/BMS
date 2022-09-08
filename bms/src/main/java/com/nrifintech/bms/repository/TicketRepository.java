package com.nrifintech.bms.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.nrifintech.bms.entity.Bus;
import com.nrifintech.bms.entity.Ticket;
import com.nrifintech.bms.entity.User;

@Repository
public interface TicketRepository extends AbstractBaseRepository<Ticket, String> {

	@Query("SELECT t FROM Ticket t where t.bus=?1 and t.dateOfTravel=?2")
	public List<Ticket> findAllTicketsByBusAndDateBought(Bus bus, java.util.Date date);

	@Query("SELECT coalesce(sum(t.seatsBooked),0) FROM Ticket t where t.bus=?1 and t.dateOfTravel=?2")
	int getTotalSeatsByBusAndDate(Bus bus, Date dateOfTravel);

	@Query("SELECT t FROM Ticket t where t.user=?1 and t.dateOfTravel >= CURRENT_DATE() ORDER BY t.dateOfTravel, t.bus.startTime, t.createdAt DESC")
	List<Ticket> findAllUpcomingTicketsWithUser(User user);

	@Query("SELECT t FROM Ticket t where t.user=?1 and t.dateOfTravel < CURRENT_DATE() ORDER BY t.dateOfTravel DESC")
	List<Ticket> findAllOldTicketsWithUser(User user);

	@Query(value = "select routecode, startname, stopname, sum(total_amount) from ticket join bus using(registration_no) join route using(routecode) where DATEDIFF(curdate(),date_bought) < 31 group by routecode order by sum(total_amount) desc", nativeQuery = true)
	List<Object[]> getRevenue();

	@Query(value = "select routecode, startname, stopname, distance_km,sum(total_amount) from ticket join bus using(registration_no) join route using(routecode) where DATEDIFF(curdate(),date_bought) < 31 group by routecode order by routecode", nativeQuery = true)
	List<Object[]> getAllRoutesRevenue();

	@Query(value = "SELECT r.routecode,r.startname,r.stopname,r.distance_km,count(b.registration_no) as bus_count FROM bus b join route r on b.routecode=r.routecode group by r.routecode", nativeQuery = true)
	List<Object[]> getBusCountPerRoute();
}
