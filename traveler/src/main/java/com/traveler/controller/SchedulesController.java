package com.traveler.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.service.SchedulesService;

@Controller
@RequestMapping(path = { "/schedules" })
public class SchedulesController {
	
	@Autowired
	@Qualifier("schedulesService")
	private SchedulesService schedulesService;

	@GetMapping(path = { "/init-data.action" })
	public String initData(HttpServletRequest req) {

		// 1. 데이터베이스에서 데이터 조회

		// 2. 조회된 데이터를 jsp에서 읽을 수 있도록 request 객체에 저장

		// 3. lotto 테이블에 데이터 저장
		ServletContext application = req.getServletContext();	// 파일을 가져오려면 필요함.
		String csvPath = application.getRealPath("/WEB-INF/data-files/Flight_Schedules.csv"); // 웹경로(http://...) -> 컴퓨터경로(C:/...)로 바꿔주는 작업
//		LottoService lottoService = new LottoServiceImpl();
		schedulesService.initData(csvPath);
		
		System.out.println("init data completed.");

		// 4. home으로 redirect (응답컨텐츠 생산)
//		resp.sendRedirect("/demoweb/home.action");
		return "redirect:/home.action";
	}

}
