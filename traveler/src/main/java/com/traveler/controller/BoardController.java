package com.traveler.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.traveler.service.BoardService;
import com.traveler.vo.BoardVO;

@Controller
@RequestMapping(path = { "/board" })
public class BoardController {

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

	@GetMapping(path = { "/list" })
	public String list(Model model) {

		// 데이터 조회
		List<BoardVO> boards = boardService.findAll();

		// View에서 사용할 수 있도록 Model 타입의 전달인자에 저장 -> Request 객체에 저장
		model.addAttribute("boards", boards);

		return "board/list"; // /WEB-INF/views/ + board/list + .jsp
	}
	
	

	@GetMapping(path = { "/write" })
	public String showWriteForm() {

		return "board/write";
	}

	@PostMapping(path = { "/write" })
	public String write(BoardVO board) {

		// 데이터 읽기 (전달인자를 통해서 자동으로 읽고 저장)
		// 데이터베이스에 저장
		boardService.writeBoard(board);

		// 목록으로 이동
		return "redirect:list";
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

	@GetMapping(path = { "/delete" })
	public String delete(int boardNo, Model model) {

		// 1. 요청 데이터 읽기 (전달인자로 대체)

		// 2. 데이터베이스에서 데이터 삭제 (deleted 컬럼을 수정)
		boardService.deleteBoard(boardNo);

		// 3. 목록으로 이동
		return "redirect:list";
	}

	@GetMapping(path = { "/edit" })
	public String showEditForm(int boardNo, Model model) {

		// 1. 요청 데이터 읽기 (전달인자로 대체)

		// 2.
		BoardVO board = boardService.findBoardByBoardNo(boardNo);

		if (board == null) {
			return "redirect:list";
		}
		
		model.addAttribute("board", board);

		// 3. View으로 이동
		return "board/edit";
	}
	
	@PostMapping(path = { "/update" })
	public String update(BoardVO board) {
		
		// 1. 요청 데이터 읽기 (전달인자로 대체)
		
		// 2. 데이터베이스의 데이터 수정
		boardService.updateBoard(board);
		
		return "redirect:detail?boardNo=" + board.getBoardNo();
	}

}