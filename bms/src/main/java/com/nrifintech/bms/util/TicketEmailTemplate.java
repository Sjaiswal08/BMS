//package com.nrifintech.bms.util;
//
//public class TicketEmailTemplate {
//
//	private String name;
//	private String pnrNo;
//	private String dateBought;
//	private String dateofTravel;
//	private String registrationNo;
//	private String busName;
//	private String facilities;
//	private String startTime;
//	private String startName;
//	private String stopName;
//	private int seatsBooked;
//	private int totalPaid;
//
//	
//	private TicketEmailTemplate(TicketEmailTemplateBuilder builder)
//	{
//		this.name = builder.name;
//		this.pnrNo = builder.pnrNo;
//		this.dateBought = builder.dateBought;
//		this.dateofTravel = builder.dateofTravel;
//		this.registrationNo = builder.registrationNo;
//		this.busName = builder.busName;
//		this.facilities = builder.facilities;
//		this.startTime = builder.startTime;
//		this.startName = builder.startName;
//		this.stopName = builder.stopName;
//		this.seatsBooked = builder.seatsBooked;
//		this.totalPaid = builder.totalPaid;
//	}
//
//	@Override
//	public String toString() {
//		return "Dear " + name + ",\n" + "Thank you For Using BMS Application For Ticket Booking.Your Booking Details are as follows :" + "\n\n" + "PNRNO : " + pnrNo + "\n" + "Date of Booking : " + dateBought
//				+ "\n" + " Date Of Travel : " + dateofTravel + "\n" + "Bus Registration No : " + registrationNo + "\n"
//				+ " Bus Name : " + busName + "\n" + " Facilities : " + facilities + "\n" + " Onboarding Time : "
//				+ startTime + "\n" + " Onboarding Point : " + startName + "\n" + " Departure Point : " + stopName + "\n"
//				+ " No Of Seats Booked : " + seatsBooked + "\n" + " Total Paid : " + totalPaid + "\n";
//	}
//	
//	public static class TicketEmailTemplateBuilder
//	{
//		private String name;
//		private String pnrNo;
//		private String dateBought;
//		private String dateofTravel;
//		private String registrationNo;
//		private String busName;
//		private String facilities;
//		private String startTime;
//		private String startName;
//		private String stopName;
//		private int seatsBooked;
//		private int totalPaid;
//		
//		public TicketEmailTemplateBuilder(String pnrNo,int seatsBooked)
//		{
//			this.pnrNo=pnrNo;
//			this.seatsBooked=seatsBooked;
//		}
//		
//		public TicketEmailTemplateBuilder name(String name)
//		{
//			this.name=name;
//			return this;
//		}
//		public TicketEmailTemplateBuilder dateBought(String dateBought)
//		{
//			this.dateBought=dateBought;
//			return this;
//		}
//		public TicketEmailTemplateBuilder dateofTravel(String dateofTravel)
//		{
//			this.dateofTravel=dateofTravel;
//			return this;
//		}
//		public TicketEmailTemplateBuilder registrationNo(String registrationNo)
//		{
//			this.registrationNo=registrationNo;
//			return this;
//		}
//		public TicketEmailTemplateBuilder busName(String busName)
//		{
//			this.busName=busName;
//			return this;
//		}
//		public TicketEmailTemplateBuilder facilities(String facilities)
//		{
//			this.facilities=facilities;
//			return this;
//		}
//		public TicketEmailTemplateBuilder startTime(String startTime)
//		{
//			this.startTime=startTime;
//			return this;
//		}
//		public TicketEmailTemplateBuilder stopName(String stopName)
//		{
//			this.stopName=stopName;
//			return this;
//		}
//		public TicketEmailTemplateBuilder startName(String startName)
//		{
//			this.startName=startName;
//			return this;
//		}
//		public TicketEmailTemplateBuilder totalPaid(int totalPaid)
//		{
//			this.totalPaid=totalPaid;
//			return this;
//		}
//		public TicketEmailTemplate build()
//		{
//			TicketEmailTemplate template = new TicketEmailTemplate(this);
//			return template;
//		}
//	}
//
//}

package com.nrifintech.bms.util;

public class TicketEmailTemplate {

	private String name;
	private String pnrNo;
	private String dateBought;
	private String dateofTravel;
	private String registrationNo;
	private String busName;
	private String facilities;
	private String startTime;
	private String startName;
	private String stopName;
	private int seatsBooked;
	private int totalPaid;
	private String message;

	private TicketEmailTemplate(TicketEmailTemplateBuilder builder) {
		this.name = builder.name;
		this.pnrNo = builder.pnrNo;
		this.dateBought = builder.dateBought;
		this.dateofTravel = builder.dateofTravel;
		this.registrationNo = builder.registrationNo;
		this.busName = builder.busName;
		this.facilities = builder.facilities;
		this.startTime = builder.startTime;
		this.startName = builder.startName;
		this.stopName = builder.stopName;
		this.seatsBooked = builder.seatsBooked;
		this.totalPaid = builder.totalPaid;
		this.message = builder.message;
	}

	@Override
	public String toString() {
		return "Dear " + name + ",\n" + message + "\n\n" + "PNRNO : " + pnrNo + "\n" + "Date of Booking : " + dateBought
				+ "\n" + " Date Of Travel : " + dateofTravel + "\n" + "Bus Registration No : " + registrationNo + "\n"
				+ " Bus Name : " + busName + "\n" + " Facilities : " + facilities + "\n" + " Onboarding Time : "
				+ startTime + "\n" + " Onboarding Point : " + startName + "\n" + " Departure Point : " + stopName + "\n"
				+ " No Of Seats Booked : " + seatsBooked + "\n" + " Total Paid : " + totalPaid + "\n\n\n" +"With Regards,\nBMS Team.\n";
	}

	public static class TicketEmailTemplateBuilder {
		private String name;
		private String pnrNo;
		private String dateBought;
		private String dateofTravel;
		private String registrationNo;
		private String busName;
		private String facilities;
		private String startTime;
		private String startName;
		private String stopName;
		private int seatsBooked;
		private int totalPaid;
		private String message;

		public TicketEmailTemplateBuilder(String pnrNo, int seatsBooked) {
			this.pnrNo = pnrNo;
			this.seatsBooked = seatsBooked;
		}

		public TicketEmailTemplateBuilder name(String name) {
			this.name = name;
			return this;
		}

		public TicketEmailTemplateBuilder dateBought(String dateBought) {
			this.dateBought = dateBought;
			return this;
		}

		public TicketEmailTemplateBuilder dateofTravel(String dateofTravel) {
			this.dateofTravel = dateofTravel;
			return this;
		}

		public TicketEmailTemplateBuilder registrationNo(String registrationNo) {
			this.registrationNo = registrationNo;
			return this;
		}

		public TicketEmailTemplateBuilder busName(String busName) {
			this.busName = busName;
			return this;
		}

		public TicketEmailTemplateBuilder facilities(String facilities) {
			this.facilities = facilities;
			return this;
		}

		public TicketEmailTemplateBuilder startTime(String startTime) {
			this.startTime = startTime;
			return this;
		}

		public TicketEmailTemplateBuilder stopName(String stopName) {
			this.stopName = stopName;
			return this;
		}

		public TicketEmailTemplateBuilder startName(String startName) {
			this.startName = startName;
			return this;
		}

		public TicketEmailTemplateBuilder totalPaid(int totalPaid) {
			this.totalPaid = totalPaid;
			return this;
		}

		public TicketEmailTemplateBuilder message(String message) {
			this.message = message;
			return this;
		}

		public TicketEmailTemplate build() {
			TicketEmailTemplate template = new TicketEmailTemplate(this);
			return template;
		}
	}

}