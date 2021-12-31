package com.traveler.dao;

import java.util.List;

import com.traveler.vo.MemberVO;

public interface ManagementDao {

	List<MemberVO> selectAll();
	
}
