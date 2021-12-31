package com.traveler.service;

import java.util.List;

import com.traveler.dao.BoardDao;
import com.traveler.mapper.BoardMapper;
import com.traveler.vo.BoardVO;

import lombok.Setter;

public class BoardServiceImpl implements BoardService{
	
	@Setter	// setBoardDao를 자동으로 만드는 annotation
	private BoardDao boardDao;
	
	@Setter
	private BoardMapper boardMapper;

	@Override
	public int writeBoard(BoardVO board) {
		
//		boardDao.insertBoard(board);
		boardMapper.insertBoard(board);
		
		return 0;
	}

	@Override
	public List<BoardVO> findAll() {
		
//		List<BoardVO> boards = boardDao.selectAll();
		List<BoardVO> boards = boardMapper.selectAll();
		
		return boards;
	}
	
	@Override
	public BoardVO findBoardByBoardNo(int boardNo) {
		BoardVO board = boardMapper.selectBoardByBoardNo(boardNo);
		return board;
	}
	
	@Override
	public void increaseBoardReadCount(int boardNo) {
		
		boardMapper.updateBoardReadCount(boardNo);
	}

	@Override
	public void deleteBoard(int boardNo) {
		boardMapper.updateBoardDeleted(boardNo);
		
	}

	@Override
	public void updateBoard(BoardVO board) {
		boardMapper.updateBoard(board);
		
	}

}
