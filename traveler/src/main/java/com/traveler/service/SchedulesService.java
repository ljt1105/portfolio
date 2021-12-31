package com.traveler.service;

import java.util.List;

import com.traveler.vo.FlightSchedules;

public interface SchedulesService {
	
	void initData(String csvPath);
	
	List<FlightSchedules> readFlightSchedulesFromCsv(String csvPath);

}
