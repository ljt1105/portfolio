package com.traveler.dao;

import java.util.List;

import com.traveler.vo.FlightSchedules;

public interface SchedulesDao {
	
	void dropFlightSchedules();
	
	void createFlightSchedules();
	
	void insertFlightSchedules(List<FlightSchedules> schedules);

}
