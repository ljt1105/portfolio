package com.traveler.vo;

import lombok.Data;

@Data
public class Criteria {
	
	private String destination;
	private String airline;
	private String day;
	
	public Criteria(String destination, String airline, String day) {
		this.destination = destination;
		this.airline = airline;
		this.day = day;
	}
	

	
}
