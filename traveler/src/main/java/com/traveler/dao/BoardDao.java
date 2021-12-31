package com.traveler.dao;

import java.util.List;

import com.traveler.vo.BoardVO;

public interface BoardDao {
	
	int insertBoard(BoardVO board);

	List<BoardVO> selectAll();

}
