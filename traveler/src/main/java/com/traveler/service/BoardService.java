package com.traveler.service;

import java.util.List;

import com.traveler.vo.BoardVO;

public interface BoardService {

	int writeBoard(BoardVO board);

	List<BoardVO> findAll();

	BoardVO findBoardByBoardNo(int boardNo);

	void deleteBoard(int boardNo);

	void increaseBoardReadCount(int boardNo);

	void updateBoard(BoardVO board);
}
