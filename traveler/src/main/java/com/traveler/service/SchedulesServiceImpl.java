package com.traveler.service;

import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opencsv.CSVReader;
import com.traveler.dao.SchedulesDao;
import com.traveler.vo.FlightSchedules;

public class SchedulesServiceImpl implements SchedulesService {
	
	private SchedulesDao schedulesDao;
	public void setSchedulesDao(SchedulesDao schedulesDao) { // IoC 컨테이너에서 의존 객체를 주입하는 통로 (setter Injection)
		this.schedulesDao = schedulesDao;
	}
	
	@Override
	public void initData(String csvPath) {
		// csv파일을 읽어서 DB에 WinningNumbers 리스트 저장
		List<FlightSchedules> list = readFlightSchedulesFromCsv(csvPath);
		
		// 테이블 제거
		schedulesDao.dropFlightSchedules();
		
		//테이블 생성
		schedulesDao.createFlightSchedules();
		
		//테이블 안에 데이터 저장
		schedulesDao.insertFlightSchedules(list);
		
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
			while (true) {
				String[] row = csvr.readNext();	// 파일에서 한 행의 데이터를 읽기 -> 문자열의 배열로 반환
				if (row == null) { // EOF (end of file)
					break;
				}
				// .csv의 한 행의 데이터를 읽어서 WinningNumbers 객체 만들기				
				FlightSchedules fs = new FlightSchedules(row[0],
													   row[1],
													   row[2],
													   sdf.parse(row[3]),
													   sdf.parse(row[4]),
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
	
}
