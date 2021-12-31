package com.traveler.service;

import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


import com.opencsv.CSVReader;
import com.traveler.dao.TravelerDao;
import com.traveler.dao.TravelerDaoImpl;
import com.traveler.mapper.FlightsMapper;
import com.traveler.vo.BoardVO;
import com.traveler.vo.Criteria;
import com.traveler.vo.FlightScheduleStatVO;
import com.traveler.vo.FlightSchedules;

import lombok.Setter;

public class TravelerServiceImpl implements TravelerService{
	
	@Setter
	private TravelerDao travelerDao;
	
		@Setter
		private FlightsMapper flightsMapper;
	
	
		/*
		 * private TravelerDaoImpl travelerDao; public void
		 * setTravelerDao(TravelerDaoImpl travelerDao) { this.travelerDao=travelerDao; }
		 */
	
	
	@Override
	public void initData(String csvPath) {
		//csv파일을 읽어서 FlightSchedules 리스트 만들기
		List<FlightSchedules> list = readFlightSchedulesFromCsv(csvPath);
		
		//TravelerDaoImpl travelerDao =new TravelerDao();
		//테이블 제거
		travelerDao.dropFlightSchedulesTable();
		//테이블 생성
		travelerDao.createFlightSchedulesTable();
		//데이터 저장 1. 한 번에 한 개씩 여러 번 반복 저장
//		for(FlightSchedules fs : list) {
//			travelerDao.insertFlightSchedules(fs);
//		}
		//데이터 저장 2. 한 번에 여러 개의 데이터 저장
		travelerDao.insertFlightSchedules2(list);
		
	}

	
	@Override
	
	public List<FlightSchedules> readFlightSchedulesFromCsv(String csvPath) {
		FileReader fr = null;
		CSVReader csvr = null;
		ArrayList<FlightSchedules> result = new ArrayList<>(); // .csv 파일에서 읽은 당첨 번호 결과 목록을 저장할 컬렉션
		try {
			fr = new FileReader(csvPath);
			csvr = new CSVReader(fr);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			csvr.readNext(); // 첫 번째 제목 표시행은 필요 없기 때문에 잃고 다음으로 이동
			while (true) {
				String[] row = csvr.readNext();	// 파일에서 한 행의 데이터를 읽기 -> 문자열의 배열로 반환
				if (row == null) { // EOF (end of file)
					break;
				}
				// .csv의 한 행의 데이터를 읽어서 WinningNumbers 객체 만들기				
				FlightSchedules fs = new FlightSchedules(row[0],
														 row[1], 
														 row[2],
														 sdf.parse(row[3]),// "yyyy.MM.dd" -> Date로 변환
														 sdf.parse(row[4]),// "yyyy.MM.dd" -> Date로 변환
														 row[5],
														 row[6]);
													  
				result.add(fs); // 위에서 만든 WinningNumbers 객체를 목록에 추가
			}
		} catch (Exception ex) { // include FileNotFoundException, IOException, CsvValidationException, ParseException
			ex.printStackTrace();
		} finally {
			try { csvr.close(); } catch (Exception ex) {}
			try { fr.close(); } catch (Exception ex) {}
		}
		return result;
	}


	@Override
	public List<FlightSchedules> readAirline() {
		List<FlightSchedules> airlines = flightsMapper.selectAirline();
		return airlines;
	}


	@Override
	public List<FlightSchedules> readFlight() {
		List<FlightSchedules> flights = flightsMapper.selectFlight();
		return flights;
	}


	@Override
	public List<FlightSchedules> readDateFrom() {
		List<FlightSchedules> days = flightsMapper.selectDateFrom();
		return days;
	}


	@Override
	public List<FlightSchedules> readDestination() {
		List<FlightSchedules> destinations = flightsMapper.selectDestination();
		return destinations;
	}


	@Override
	public List<FlightSchedules> readDay() {
		List<FlightSchedules> days = flightsMapper.selectDay();
		return days;
	}


	@Override
	public List<String> readAirlineByDestination(String destination) {
		List<String> flightSchedules = flightsMapper.selectAirlineByDestination(destination);
		// TODO Auto-generated method stub
		return flightSchedules;
	}


	@Override
	public List<String> readDayByDestinationAndAirline(String destination, String airline) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("destination", destination);
		params.put("airline", airline);
		List<String> days = flightsMapper.selectDaysByDestinationAndAirline(params);
		// TODO Auto-generated method stub
		return days;
	}


	@Override
	public List<String> readDateFromByDestinationAndAirline(String destination, String airline) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("destination", destination);
		params.put("airline", airline);
		List<String> dateFrom = flightsMapper.selectDateFromByDestinationAndAirline(params);
		// TODO Auto-generated method stub
		return dateFrom;
	}


	@Override
	public List<FlightScheduleStatVO> findDailyCount(String destination, String airline, String date_from) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("destination", destination);
		params.put("airline", airline);
		params.put("date_from",date_from);
		List<FlightScheduleStatVO> dailyCounts= flightsMapper.selectFlightScheduleStat(params);
		return dailyCounts;
	}



	@Override
	public List<FlightSchedules> readsearchedList(Criteria cri) {
		List<FlightSchedules> searchedLists = flightsMapper.searchedList(cri);
		return searchedLists;
	}

	




	/*
	 * @Override public FlightSchedules selectflightsByflightsNo(String flights) {
	 * FlightSchedules flight = flightsMapper.selectFlightsByFlightsNo(flights);
	 * return flight; }
	 */









	

	/*@Override
	public int[] loadStatsBySection(int months, int range) {
		int[] countBySection = travelerDao.selectStatsBySection(months, range);
		return countBySection;
	}*/

}
