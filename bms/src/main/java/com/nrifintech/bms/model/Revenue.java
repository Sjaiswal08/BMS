package com.nrifintech.bms.model;

public class Revenue {
	private String routecode;
	private String source;
	private String destination;
	private String totalrevenue;

	public Revenue(String routecode, String source, String destination, String totalrevenue) {
		super();
		this.routecode = routecode;
		this.source = source;
		this.destination = destination;
		this.totalrevenue = totalrevenue;
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

	public String getTotalrevenue() {
		return totalrevenue;
	}

	public void setTotalrevenue(String totalrevenue) {
		this.totalrevenue = totalrevenue;
	}

	@Override
	public String toString() {
		return "Revenue [routecode=" + routecode + ", source=" + source + ", destination=" + destination
				+ ", totalrevenue=" + totalrevenue + "]";
	}

}
