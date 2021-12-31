package com.traveler.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.traveler.vo.MemberVO;

import lombok.Setter;

public class MyBatisManagementDaoImpl implements ManagementDao{
	
	private final String mapper = "com.traveler.mapper.ManagemnetMapper.";
	
	@Setter
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<MemberVO> selectAll() {
		List<MemberVO> members = sqlSessionTemplate.selectList(mapper + "selectAll");
		return members;
	}

}