package com.nrifintech.bms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "route")
public class Route extends AbstractBaseEntity {
	private static final long serialVersionUID = 6715094082833854125L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "routecode")
	private int routeCode;

	@Column(name = "startname")
	private String startName;

	@Column(name = "stopname")
	private String stopName;

	@Column(name = "distance_km")
	private int distance;

	public int getRouteCode() {
		return routeCode;
	}

	public void setRouteCode(int routeCode) {
		this.routeCode = routeCode;
	}

	public String getStartName() {
		return startName;
	}

	public void setStartName(String startName) {
		this.startName = startName;
	}

	public String getStopName() {
		return stopName;
	}

	public void setStopName(String stopName) {
		this.stopName = stopName;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	@Override
	public String toString() {
		return "Route [routeCode=" + routeCode + ", startName=" + startName + ", stopName=" + stopName + ", distance="
				+ distance + "]";
	}

}