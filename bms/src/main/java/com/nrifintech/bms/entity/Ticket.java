package com.nrifintech.bms.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ticket")
public class Ticket extends AbstractBaseEntity {
	private static final long serialVersionUID = 6715094082833854125L;

	@Id
	@Column(name = "pnr_no", length = 10, columnDefinition = "CHAR")
	private String pnrNo;

	@Column(name = "seats_booked")
	private int seatsBooked;

	@Column(name = "total_amount")
	private int totalAmount;

	@Column(name = "date_bought")
	private Date dateBought;

	@Column(name = "date_of_travel")
	private Date dateOfTravel;

	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "registration_no", foreignKey = @ForeignKey(name = "registration_no_fk"), nullable = false)
	private Bus bus;

	@ManyToOne(fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "userid", foreignKey = @ForeignKey(name = "userid_fk"), nullable = false)
	private User user;

	public String getPnrNo() {
		return pnrNo;
	}

	public void setPnrNo(String pnrNo) {
		this.pnrNo = pnrNo;
	}

	public int getSeatsBooked() {
		return seatsBooked;
	}

	public void setSeatsBooked(int seatsBooked) {
		this.seatsBooked = seatsBooked;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getDateBought() {
		return dateBought;
	}

	public void setDateBought(Date dateBought) {
		this.dateBought = dateBought;
	}

	public Date getDateOfTravel() {
		return dateOfTravel;
	}

	public void setDateOfTravel(Date dateOfTravel) {
		this.dateOfTravel = dateOfTravel;
	}

	public Bus getBus() {
		return bus;
	}

	public void setBus(Bus bus) {
		this.bus = bus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Ticket [pnrNo=" + pnrNo + ", seatsBooked=" + seatsBooked + ", totalAmount=" + totalAmount
				+ ", dateBought=" + dateBought + ", dateOfTravel=" + dateOfTravel + ", bus=" + bus + ", user=" + user
				+ "]";
	}

	
}
