package com.traveler.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.traveler.vo.Criteria;
import com.traveler.vo.FlightScheduleStatVO;
import com.traveler.vo.FlightSchedules;

// BoardMapper.xml 파일과 매핑되는 인터페이스 정의 -> Spring이 Mapper 객체를 자동으로 생성
// -> BoardMapper.xml과 경로와 이름이 일치하도록 작성
@Mapper // <bean id="boardMapper" class="...MapperFactoryBean"> ... </bean>
public interface FlightsMapper {

	/* FlightSchedules selectFlightsByFlightsNo(String flights); */

	List<FlightSchedules> selectAirline();
	// 인터페이스 메서드는 BoardMapper.xml 파일의 insert, update, select, ... 의 아이디과 일치하도록 작성

	List<FlightSchedules> selectFlight();
	List<FlightSchedules> selectDateFrom();
	List<FlightSchedules> selectDestination();
	List<FlightSchedules> selectDay();

	List<String> selectAirlineByDestination(String destination);

	List<String> selectDaysByDestinationAndAirline(HashMap<String, Object> params);

	List<String> selectDateFromByDestinationAndAirline(HashMap<String, Object> params);

	List<FlightScheduleStatVO> selectFlightScheduleStat(HashMap<String, Object> params);
	
	List<FlightSchedules> searchedList(Criteria cri);
}
