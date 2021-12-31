package com.traveler.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.traveler.vo.BoardVO;

import lombok.Setter;

public class MyBatisBoardDaoImpl implements BoardDao{
	
	private final String mapper = "com.traveler.mapper.BoardMapper.";
	
	@Setter
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertBoard(BoardVO board) {
		sqlSessionTemplate.insert(mapper + "insertBoard", board);
		return 0;
	}

	@Override
	public List<BoardVO> selectAll() {
		List<BoardVO> boards = sqlSessionTemplate.selectList(mapper + "selectAll");
		return boards;
	}

}