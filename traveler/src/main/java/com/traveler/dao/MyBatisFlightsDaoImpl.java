package com.traveler.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.traveler.vo.BoardVO;
import com.traveler.vo.FlightSchedules;

import lombok.Setter;

public class MyBatisFlightsDaoImpl implements TravelerDao {
	
	private final String mapper = "com.traveler.mapper.flgihtsMapper.";
	
	@Setter
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void dropFlightSchedulesTable() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createFlightSchedulesTable() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertFlightSchedules(FlightSchedules fs) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertFlightSchedules2(List<FlightSchedules> schedules) {
		// TODO Auto-generated method stub
		
	}

	

	

}
