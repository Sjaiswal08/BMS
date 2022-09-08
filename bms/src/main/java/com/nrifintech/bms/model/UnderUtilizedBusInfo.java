package com.nrifintech.bms.model;

public class UnderUtilizedBusInfo {
	private String regNo;
	private String busName;
	private String farePerKm;
	private String facilities;
	private String routecode;
	private String source;
	private String destination;
	private String totalSeats;
	private String totalSeatsBooked;
	private String percentageSeatUtilization;

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}

	public String getBusName() {
		return busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public String getFarePerKm() {
		return farePerKm;
	}

	public void setFarePerKm(String farePerKm) {
		this.farePerKm = farePerKm;
	}

	public String getFacilities() {
		return facilities;
	}

	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}

	public String getRoutecode() {
		return routecode;
	}

	public void setRoutecode(String routecode) {
		this.routecode = routecode;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getTotalSeats() {
		return totalSeats;
	}

	public void setTotalSeats(String totalSeats) {
		this.totalSeats = totalSeats;
	}

	public String getTotalSeatsBooked() {
		return totalSeatsBooked;
	}

	public void setTotalSeatsBooked(String totalSeatsBooked) {
		this.totalSeatsBooked = totalSeatsBooked;
	}

	public String getPercentageSeatUtilization() {
		return percentageSeatUtilization;
	}

	public void setPercentageSeatUtilization(String percentageSeatUtilization) {
		this.percentageSeatUtilization = percentageSeatUtilization;
	}

	public UnderUtilizedBusInfo(String regNo, String busName, String farePerKm, String facilities, String routecode,
			String source, String destination, String totalSeats, String totalSeatsBooked,
			String percentageSeatUtilization) {
		super();
		this.regNo = regNo;
		this.busName = busName;
		this.farePerKm = farePerKm;
		this.facilities = facilities;
		this.routecode = routecode;
		this.source = source;
		this.destination = destination;
		this.totalSeats = totalSeats;
		this.totalSeatsBooked = totalSeatsBooked;
		this.percentageSeatUtilization = percentageSeatUtilization;
	}

	@Override
	public String toString() {
		return "UnderUtilizedBusInfo [regNo=" + regNo + ", busName=" + busName + ", farePerKm=" + farePerKm
				+ ", facilities=" + facilities + ", routecode=" + routecode + ", source=" + source + ", destination="
				+ destination + ", totalSeats=" + totalSeats + ", totalSeatsBooked=" + totalSeatsBooked
				+ ", percentageSeatUtilization=" + percentageSeatUtilization + "]";
	}

}
