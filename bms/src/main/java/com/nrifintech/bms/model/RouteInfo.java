package com.nrifintech.bms.model;

public class RouteInfo {
	private String routecode;
	private String source;
	private String destination;
	private String distance;
	private String buscount;

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

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public String getBuscount() {
		return buscount;
	}

	public void setBuscount(String buscount) {
		this.buscount = buscount;
	}

	@Override
	public String toString() {
		return "RouteInfo [routecode=" + routecode + ", source=" + source + ", destination=" + destination
				+ ", distance=" + distance + ", buscount=" + buscount + "]";
	}

	
}