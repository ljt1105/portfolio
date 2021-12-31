package com.traveler.vo;

import java.sql.Date;

import lombok.Data;

@Data // VO: 데이터 저장용 클래스 -> 일반적으로 데이터베이스 테이블에 대응하는 클래스
public class MemberVO {
	
	// VO 클래스의 필드(변수)는 데이터베이스의 테이블의 컬럼과 일치하도록 구현
	private String memberID;
	private String passwd;
	private String email;
	private String usertype;
	private boolean active;
	private Date regDate;
	
}
