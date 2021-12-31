package com.traveler.dao;

import java.util.List;

import com.traveler.vo.FlightSchedules;

public interface TravelerDao {

	
	void dropFlightSchedulesTable();
	
	void createFlightSchedulesTable();
	
	void insertFlightSchedules(FlightSchedules fs);
	
	// 한 번에 여러 개의 데이터를 insert하는 메서드
	void insertFlightSchedules2(List<FlightSchedules> schedules);
}
