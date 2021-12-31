package com.traveler.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.traveler.service.TravelerService;
import com.traveler.vo.BoardVO;
import com.traveler.vo.Criteria;
import com.traveler.vo.FlightSchedules;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/traveler" })
public class SearchController {
	
	@Autowired
	TravelerService travelerService;
	
	@GetMapping(path = { "/search" })
	public String search(String destination, String airline, String day, Model model) {
		
		// 1. 데이터 읽기 (전달인자를 통해서 수신)

		List<FlightSchedules> destinations = travelerService.readDestination();
		
		
		System.out.println(destination);
		List<String> airlines = null;
		if (destination != null) {
			
			airlines = travelerService.readAirlineByDestination(destination);
			System.out.println(airlines.size());
		}
		
		List<String> days = null;
		if (destination != null && airline != null) {
			days = travelerService.readDayByDestinationAndAirline(destination, airline);
		}
		
		// 3. 조회된 데이터를 jsp에서 읽을 수 있도록 request 객체에 저장
		model.addAttribute("selectedDestination", destination);
		model.addAttribute("destinations", destinations);
		
		if (airlines != null) {
			model.addAttribute("airlines", airlines);			
		}
		model.addAttribute("selectedAirline", airline);
		
		if (days != null) {
			model.addAttribute("days", days);
		}
		
		return "traveler/search";
	}

	@GetMapping(path = { "/search2" })
	public String searchedList(Criteria cri, Model model) {
		
		List<FlightSchedules> schedules = travelerService.readsearchedList(cri);
		
		List<FlightSchedules> destinations = travelerService.readDestination();
		List<String> airlines =  travelerService.readAirlineByDestination(cri.getDestination());	
		List<String> days =  travelerService.readDayByDestinationAndAirline(cri.getDestination(), cri.getAirline());

		// 3. 조회된 데이터를 jsp에서 읽을 수 있도록 request 객체에 저장
		model.addAttribute("selectedDestination", cri.getDestination());
		model.addAttribute("destinations", destinations);
		model.addAttribute("airlines", airlines);			
		model.addAttribute("selectedAirline", cri.getAirline());
		model.addAttribute("days", days);
		model.addAttribute("selectedDay", cri.getDay());
		
		model.addAttribute("flightList", schedules);
		
		return "traveler/search";
	}

}
	

	