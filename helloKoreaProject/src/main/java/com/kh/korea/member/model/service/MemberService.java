package com.kh.korea.member.model.service;

import com.kh.korea.member.model.vo.Cert;
import com.kh.korea.member.model.vo.Member;

public interface MemberService {
	//회원가입
	int insertMember(Member m);
	//메일인증
	//인증메일 발송
	int sendMail(Cert cert);
	//인증메일 확인
	boolean validate(Cert cert);
	// 아이디 중복 체크
	int idCheck(String checkId);
	int nickCheck(String checkNick);
	//로그인 서비스(SELECT)
	Member loginMember(Member m);
	//회원정보 수정(UPDATE)
	int updateMember(Member m);
	//소셜 서비스
	int socialCheck(String id);
	Member socialLogin(String id);

	//회원정보 삭제
	int deleteMember(String email);
	//회원사진 업데이트
	int updateProfile(Member m);
}
