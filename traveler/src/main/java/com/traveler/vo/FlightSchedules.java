package com.traveler.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class FlightSchedules {
	
	private String day;
	private String flight;
	// private Time time;
	private String time;
	private Date date_from;
	private Date date_to;
	private String airline;
	private String destination;
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getFlight() {
		return flight;
	}
	public void setFlight(String flight) {
		this.flight = flight;
	}
	//public Time getTime() {
	//	return time;
	//}
	//public void setTime(Time time) {
	//	this.time = time;
	//}
	public Date getDate_from() {
		return date_from;
	}
	public void setDate_from(Date date_from) {
		this.date_from = date_from;
	}
	public Date getDate_to() {
		return date_to;
	}
	public void setDate_to(Date date_to) {
		this.date_to = date_to;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	public FlightSchedules() {}
	public FlightSchedules(String day, String flight, String time, Date date_from, Date date_to, 
							String airline, String destination) {
		this.day = day;
		this.flight = flight;
		this.time = time;
		this.date_from = date_from;
		this.date_to = date_to;
		this.airline = airline;
		this.destination = destination;
	}
	
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return String.format("[%5s][%5s][%20s][%10s][%10s][%10s][%10s]",
							 day, flight, time, sdf.format(date_from), sdf.format(date_to), airline, destination);
	}
	
}
