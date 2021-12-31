package com.traveler.service;

import java.util.List;

import com.traveler.vo.BoardVO;
import com.traveler.vo.Criteria;
import com.traveler.vo.FlightScheduleStatVO;
import com.traveler.vo.FlightSchedules;



public interface TravelerService {

	
		void initData(String csvPath);

		List<FlightSchedules> readFlightSchedulesFromCsv(String csvPath);

		
		
		List<FlightSchedules> readAirline();

		List<FlightSchedules> readFlight();
		List<FlightSchedules> readDateFrom();
		List<FlightSchedules> readDestination();
		List<FlightSchedules> readDay();

		List<String> readAirlineByDestination(String destination);

		List<String> readDayByDestinationAndAirline(String destination, String airline);

		List<String> readDateFromByDestinationAndAirline(String destination, String airline);

		List<FlightScheduleStatVO> findDailyCount(String destination, String airline, String date_from);
    
		List<FlightSchedules> readsearchedList(Criteria cri);
		
	
		
}
