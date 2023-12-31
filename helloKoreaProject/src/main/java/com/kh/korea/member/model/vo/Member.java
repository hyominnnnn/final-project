package com.kh.korea.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Member {
	private int memberNo;
	private String email;
	private String memberNickname;
	private String memberPwd;
	private String memberName;
	private int birthday;
	private int idCardNumber;
	private Date memberEnrollDate;
	private String status;
	private String nationNo;
	private String socialId;
	private String socialProfile;
	private String nationName; //국가이름

}
