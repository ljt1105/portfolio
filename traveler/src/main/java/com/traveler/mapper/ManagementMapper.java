package com.traveler.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.traveler.vo.MemberVO;

@Mapper
public interface ManagementMapper {

	List<MemberVO> selectAll();

	MemberVO selectMemberById(String memberID);

	void updateMember(MemberVO member);

}
