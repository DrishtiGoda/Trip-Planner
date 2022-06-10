package com.me.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="post")
public class Traveller {

	
	public Traveller() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Traveller(String title, String countryOfTravel, String travelledFrom, String monthOfVisit,
			String firstDay, String secondDay, User users) {
		super();
		
		this.title = title;
		this.countryOfTravel = countryOfTravel;
		this.travelledFrom = travelledFrom;
		this.monthOfVisit = monthOfVisit;
		this.firstDay = firstDay;
		this.secondDay = secondDay;
		this.users = users;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int postId;
	
	
	private String title;
	private String countryOfTravel;
	private String travelledFrom;
	private String monthOfVisit;
	private String firstDay;
	private String secondDay;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name = "userid")
	private User users;
	
	
	public User getUsers() {
		return users;
	}
	public void setUsers(User users) {
		this.users = users;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCountryOfTravel() {
		return countryOfTravel;
	}
	public void setCountryOfTravel(String countryOfTravel) {
		this.countryOfTravel = countryOfTravel;
	}
	public String getTravelledFrom() {
		return travelledFrom;
	}
	public void setTravelledFrom(String travelledFrom) {
		this.travelledFrom = travelledFrom;
	}
	public String getMonthOfVisit() {
		return monthOfVisit;
	}
	public void setMonthOfVisit(String monthOfVisit) {
		this.monthOfVisit = monthOfVisit;
	}
	public String getFirstDay() {
		return firstDay;
	}
	public void setFirstDay(String firstDay) {
		this.firstDay = firstDay;
	}
	public String getSecondDay() {
		return secondDay;
	}
	public void setSecondDay(String secondDay) {
		this.secondDay = secondDay;
	}
	
	
}
