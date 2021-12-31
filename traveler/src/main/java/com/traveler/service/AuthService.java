package com.traveler.service;

import java.util.List;

import com.traveler.vo.MemberVO;

public interface AuthService {

	void registerMember(MemberVO member);

	MemberVO findMemberByIdAndPasswd(String memberID, String passwd);

	List<MemberVO> findAll();

	MemberVO findMemberById(String memberID);

	void updateMember(MemberVO member);

}