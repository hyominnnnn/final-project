package com.kh.korea.member.model.service;

import com.kh.korea.member.model.vo.Member;

public interface MemberService {
	//회원가입
	int insertMember(Member m);
	//메일인증
//	void sendMail(CertVo certVo);
//	boolean validate(CertVO certVo);
	// 아이디 중복 체크
	int idCheck(String checkId);
	int nickCheck(String checkNick);
	//로그인 서비스(SELECT)
	Member loginMember(Member m);
	//회원정보 수정(UPDATE)
	int updateMember(Member m);
}
