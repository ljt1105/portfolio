package com.traveler.dao;

import com.traveler.vo.MemberVO;

public interface MemberDao {

	void insertMember(MemberVO member);

	MemberVO selectMemberByIdAndPasswd(String memberID, String passwd);

}