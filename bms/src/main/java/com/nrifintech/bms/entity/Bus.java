package com.nrifintech.bms.entity;

import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.nrifintech.bms.util.BusActiveStatus;
import com.nrifintech.bms.util.Facilities;

@Entity
@Table(name = "bus")
public class Bus extends AbstractBaseEntity {
	private static final long serialVersionUID = 6715094082833854125L;

	@Id
	@Column(name = "registration_no", length = 8, columnDefinition = "CHAR")
	private String registrationNo;

	@Column(name = "busname")
	private String busName;

	@Column(name = "fare_per_km")
	private int fare;

	@Column(name = "totalseats")
	private int seatCount;

	@Transient
	private int availableSeats;

	@Column(name = "starttime")
	private Time startTime;

	@Column(name = "facilities")
	@Enumerated(EnumType.STRING)
	private Facilities facilities;

	@Column(name = "isactive")
	@Enumerated(EnumType.STRING)
	private BusActiveStatus activeStatus;

	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "routecode", foreignKey = @ForeignKey(name = "routecode_fk"), nullable = false)
	private Route route;

	public String getRegistrationNo() {
		return registrationNo;
	}

	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}

	public String getBusName() {
		return busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public int getFare() {
		return fare;
	}

	public void setFare(int fare) {
		this.fare = fare;
	}

	public int getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}

	public Time getStartTime() {
		return startTime;
	}

	public int getAvailableSeats() {
		return availableSeats;
	}

	public void setAvailableSeats(int availableSeats) {
		this.availableSeats = availableSeats;
	}

	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public Facilities getFacilities() {
		return facilities;
	}

	public void setFacilities(Facilities facilities) {
		this.facilities = facilities;
	}

	public BusActiveStatus getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(BusActiveStatus activeStatus) {
		this.activeStatus = activeStatus;
	}

	@Override
	public String toString() {
		return "Bus [registrationNo=" + registrationNo + ", busName=" + busName + ", fare=" + fare + ", seatCount="
				+ seatCount + ", availableSeats=" + availableSeats + ", startTime=" + startTime + ", facilities="
				+ facilities + ", activeStatus=" + activeStatus + ", route=" + route + "]";
	}

}
