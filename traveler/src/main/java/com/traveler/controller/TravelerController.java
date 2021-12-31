package com.traveler.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.service.TravelerService;
import com.traveler.vo.FlightScheduleStatVO;
import com.traveler.vo.FlightSchedules;

@Controller
@RequestMapping(path = { "/traveler" })
public class TravelerController {

	@Autowired
	@Qualifier("travelerService")
	private TravelerService travelerService;

	@GetMapping(path = { "/init-data" })
	public String initData(HttpServletRequest req) {
		// 1. 데이터베이스에서 traveler 테이블 drop
		// 2. 데이터베이스에서 traveler 테이블 create
		// 3. traveler 테이블에 데이터 저장
		ServletContext application = req.getServletContext(); // JSP의 application 내장 객체와 같은 객체
		String csvPath = application.getRealPath("/WEB-INF/data-files/Flight_Departure_Schedules_Incheon_Airport.csv"); // web
																														// path
		// (http://....) ->
		// computer path
		// (C:\...)
		// LottoService lottoService = new LottoServiceImpl();
		travelerService.initData(csvPath);

		System.out.println("init data !!!");

		// 4. home으로 redirect (응답컨텐츠 생산)
		return "redirect:/home";
	}

	@GetMapping(path = { "/graph" })
	public String airline(String airline, String date_from, String destination, Model model) {
		
		// 1. 데이터 읽기 (전달인자를 통해서 수신)
		
				//List<FlightSchedules> airlines = travelerService.readAirline();
				//List<FlightSchedules> days = travelerService.readDay();
				List<FlightSchedules> destinations = travelerService.readDestination();
				
				
				List<String> airlines = null;
				if (destination != null) {
					airlines = travelerService.readAirlineByDestination(destination);
				}
				
				List<String> dateFrom = null;
				if (destination != null && airline != null) {
					dateFrom = travelerService.readDateFromByDestinationAndAirline(destination, airline);
				}
				
				/*
				 * System.out.println(destinations); System.out.println(dateFrom);
				 */
//				List<FlightSchedules> flights = null;
//				if (airline != null && airline.length() > 0) {
//					// List<FlightSchedules> flights = travelerService.readFlight(); // 기존 코드
//					
//					// 여기에 아래와 같이 데이터 조회 작업을 구현해야 합니다.			
//					// flights = travelerService.데이터조회메서드(airline);
//				}
				//2. 데이터 조회 작업
				List<FlightScheduleStatVO> dailyCounts = null;
				if(destination != null && airline != null && date_from !=null) {
					dailyCounts = travelerService.findDailyCount(destination,airline,date_from);
				}
				/*
				 * List<FlightScheduleStatVO> dailyCounts=travelerService.findDailyCount(destination,airline,date_from);
				 */
								
				// 3. 조회된 데이터를 jsp에서 읽을 수 있도록 request 객체에 저장
				//model.addAttribute("selectedAirline", airline);
				model.addAttribute("selectedDestination", destination);
				model.addAttribute("destinations", destinations);
				model.addAttribute("selectedDateFrom", date_from);
				
				if (airlines != null) {
					model.addAttribute("airlines", airlines);			
				}
				model.addAttribute("selectedAirline", airline);
				
				if (dateFrom != null) {
					model.addAttribute("dateFrom", dateFrom);
				}
				
				System.out.println(dailyCounts);
				if (dailyCounts != null) {
					
					model.addAttribute("dailyCounts",dailyCounts);
				}
				
		
		return "traveler/graph";
	}
	

}
