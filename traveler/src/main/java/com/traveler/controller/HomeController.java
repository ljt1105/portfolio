package com.traveler.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.traveler.service.BoardService;
import com.traveler.vo.BoardVO;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;
	
	@RequestMapping(path = { "/", "/home" }, method = RequestMethod.GET)
	public String home(Model model) {
		
		// 데이터 조회
		List<BoardVO> boards = boardService.findAll();

		// View에서 사용할 수 있도록 Model 타입의 전달인자에 저장 -> Request 객체에 저장
		model.addAttribute("boards", boards);
		
		return "home"; // view 이름을 DispatcherServlet에게 반환 --> /WEB-INF/views/ + home + .jsp
	}
	
	@GetMapping(path = { "/detail" })
	public String detail(int boardNo, Model model) {

		// 1. 요청 데이터 읽기 (전달인자로 대체)

		// 2. 데이터베이스에서 데이터 조회 (데이터가 없으면 목록으로 이동)
		BoardVO board = boardService.findBoardByBoardNo(boardNo);

		if (board == null) {
			return "redirect:list";
		}
		
		boardService.increaseBoardReadCount(boardNo);	// 조회수 증가 처리
		board.setReadCount(board.getReadCount() + 1);

		// 3. View(.jsp)에서 읽을 수 있도록 데이터 저장
		model.addAttribute("board", board); // HttpServletRequest.setAttribute("board", board)와 같은 의미

		return "board/detail";
	}
	
}
